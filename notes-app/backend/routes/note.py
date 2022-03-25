from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
import models
from schema import Note, NoteOut
from database import get_db
import oauth2
from typing import List, Optional


route = APIRouter(prefix="/notes", tags=["Notes"])


@route.get("/", status_code=200, response_model=List[NoteOut])
def get_notes(
    db: Session = Depends(get_db),
    username: str = Depends(oauth2.get_current_user),
    sort_by_update_time: bool = False,
    search: Optional[str] = "",
):
    if sort_by_update_time:
        if search != "":
            notes = (
                db.query(models.Note)
                .filter(
                    models.Note.username == username.username,
                    models.Note.title.contains(search),
                )
                .order_by(models.Note.last_updated_at.desc())
                .all()
            )
        else:
            notes = (
                db.query(models.Note)
                .filter(models.Note.username == username.username)
                .order_by(models.Note.last_updated_at.desc())
                .all()
            )
    else:
        if search != "":
            notes = (
                db.query(models.Note)
                .filter(
                    models.Note.username == username.username,
                    models.Note.title.contains(search),
                )
                .order_by(models.Note.id.asc())
                .all()
            )
        else:
            notes = (
                db.query(models.Note)
                .filter(models.Note.username == username.username)
                .order_by(models.Note.id.asc())
                .all()
            )
    return notes


@route.post("/", status_code=201)
def add_note(
    note: Note,
    db: Session = Depends(get_db),
    username: dict = Depends(oauth2.get_current_user),
):
    # new_note = models.Note(title=note.title, content=note.content, username=username)
    new_note = models.Note(**note.dict(), username=username.username)
    db.add(new_note)
    db.commit()
    return {"success": "true"}


@route.get("/{id}", response_model=NoteOut)
def get_note_by_id(
    id: int,
    db: Session = Depends(get_db),
    username: str = Depends(oauth2.get_current_user),
):
    note = (
        db.query(models.Note)
        .filter(models.Note.username == username.username, models.Note.id == id)
        .first()
    )
    if not note:
        raise HTTPException(status_code=404, detail="Note not found")
    return note


@route.delete("/{id}", status_code=204)
def delete_note_by_id(
    id: int,
    db: Session = Depends(get_db),
    username: str = Depends(oauth2.get_current_user),
):
    note = db.query(models.Note).filter(
        models.Note.id == id, models.Note.username == username.username
    )

    if not note.first():
        raise HTTPException(status_code=404, detail="Note not found")

    note.delete(synchronize_session=False)
    db.commit()
    return {"success": "true"}


@route.put("/{id}", status_code=200)
def update_note_by_id(
    id: int,
    note: Note,
    db: Session = Depends(get_db),
    username: str = Depends(oauth2.get_current_user),
):
    note_query = db.query(models.Note).filter(models.Note.id == id)

    if not note_query.first():
        raise HTTPException(status_code=404, detail="Note not found")

    note_query.update(note.dict(), synchronize_session=False)

    db.commit()

    return {"success": "true"}
