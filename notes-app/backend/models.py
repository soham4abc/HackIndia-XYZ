from sqlalchemy.orm import relationship
from sqlalchemy.sql.functions import now
from sqlalchemy.sql.schema import ForeignKey
from sqlalchemy.sql.sqltypes import TIMESTAMP
from database import Base
from sqlalchemy import Column, Integer, String


class Note(Base):
    __tablename__ = "notes"

    id = Column(Integer, primary_key=True, nullable=False)
    title = Column(String, nullable=False)
    content = Column(String, nullable=True)
    created_at = Column(TIMESTAMP(timezone=True), nullable=False, server_default=now())
    last_updated_at = Column(
        TIMESTAMP(timezone=True), nullable=False, server_default=now()
    )
    username = Column(
        String, ForeignKey("users.username", ondelete="CASCADE"), nullable=False
    )

    user = relationship("User")


class User(Base):
    __tablename__ = "users"

    username = Column(String, nullable=False, unique=True, primary_key=True)
    password = Column(String, nullable=False)
    created_at = Column(TIMESTAMP(timezone=True), nullable=False, server_default=now())
