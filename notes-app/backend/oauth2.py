import os
from jose import JWTError, jwt
from datetime import datetime, timedelta
from schema import Token
from fastapi import Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
from dotenv import load_dotenv

load_dotenv()

oauth2_scheme = OAuth2PasswordBearer(tokenUrl='login')

SECRET_KEY=os.getenv('SECRET_KEY')
ALGORITHM="HS256"
ACCESS_TOKEN_EXPIRE_DAYS=30


def create_access_token(data: dict):
    to_encode = data.copy()

    expire = datetime.utcnow() + timedelta(days=ACCESS_TOKEN_EXPIRE_DAYS)

    to_encode.update({"exp": expire})

    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

    return  encoded_jwt


def verify_access_token(token: str, credentials_exception):

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])

        username: str = payload.get("username")

        if username is None:
            raise credentials_exception

        token_data = Token(username=username)

    except JWTError:
        raise credentials_exception

    return token_data

def get_current_user(token: str=Depends(oauth2_scheme)):
    credentials_exception=HTTPException(status_code=401, detail="Could not validate", headers={"WWW-Authenticate": "Bearer"})
    return verify_access_token(token, credentials_exception)
