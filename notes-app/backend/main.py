from fastapi import FastAPI
# import models
from fastapi.middleware.cors import CORSMiddleware
# from database import engine
from routes import note, user, auth


# models.Base.metadata.create_all(bind=engine)


app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(note.route)
app.include_router(user.route)
app.include_router(auth.route)


@app.get("/")
def root():
    return {"message": "i am alive"}
