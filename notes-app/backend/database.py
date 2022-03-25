import os
from sqlalchemy import create_engine, engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from dotenv import load_dotenv

load_dotenv()

SQLALCHEMY_DATABASE_URL = (
    "postgresql://"
    + os.getenv("database_username")
    + ":"
    + os.getenv("database_password")
    + "@"
    + os.getenv("database_hostname")
    + ":"
    + os.getenv("database_port")
    + "/"
    + os.getenv("database_name")
)

engine = create_engine(SQLALCHEMY_DATABASE_URL)

SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
