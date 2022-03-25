from datetime import datetime
from pydantic import BaseModel


class Note(BaseModel):
    title: str
    content: str = None
    last_updated_at: str = "now()"

class UserOut(BaseModel):
    username: str
    created_at: datetime

    class Config:
        orm_mode = True


class NoteOut(BaseModel):
    title: str
    id: int
    content: str
    last_updated_at: datetime
    user: UserOut

    class Config:
        orm_mode = True

class User(BaseModel):
    username: str
    password: str

class UserLogin(BaseModel):
    username: str
    password: str


class Token(BaseModel):
    username: str


class TokenOut(BaseModel):
    access_token: str
    token_type: str = "bearer"
