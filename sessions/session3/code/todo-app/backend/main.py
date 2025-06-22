from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List
from pymongo import MongoClient
import os

app = FastAPI()

# ✅ Add CORS middleware BEFORE anything else
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Or ["http://localhost:8080"] for stricter control
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ✅ MongoDB setup
mongo_url = os.getenv("MONGO_URL", "mongodb://localhost:27017")
client = MongoClient(mongo_url)
db = client.todo_db
todos = db.todos

# ✅ Pydantic model
class Todo(BaseModel):
    title: str
    done: bool = False

# ✅ API routes
@app.get("/todos", response_model=List[Todo])
def get_todos():
    return list(todos.find({}, {"_id": 0}))

@app.post("/todos", response_model=Todo)
def add_todo(todo: Todo):
    todos.insert_one(todo.dict())
    return todo

@app.delete("/todos/{title}")
def delete_todo(title: str):
    result = todos.delete_one({"title": title})
    if result.deleted_count == 0:
        raise HTTPException(status_code=404, detail="Todo not found")
    return {"status": "deleted"}
