from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from schema import UserLogin, TokenOut
import models, oauth2
from utils import verify


route = APIRouter(tags=['Authentication'])


@route.post('/login',response_model=TokenOut)
def login(user_credentials: UserLogin, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.username == user_credentials.username).first()

    if not user:
        raise HTTPException(status_code=403, detail="Invalid credentials")

    if not verify(user_credentials.password, user.password):
        raise HTTPException(status_code=403, detail="Invalid credentials")

    access_token = oauth2.create_access_token(data = {"username": user.username})
    return {"access_token": access_token, "token_type": "bearer"}
