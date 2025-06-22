<template>
  <div id="app">
    <h1>Todo List</h1>
    <input v-model="newTodo" @keyup.enter="addTodo" placeholder="New todo" />
    <button @click="addTodo">Add</button>
    <ul>
      <li v-for="todo in todos" :key="todo.title">
        {{ todo.title }}
        <button @click="deleteTodo(todo.title)">Delete</button>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

const api = axios.create({
  baseURL: process.env.VUE_APP_API_BASE_URL,
});

export default {
  data() {
    return {
      todos: [],
      newTodo: "",
    };
  },
  methods: {
    fetchTodos() {
      api.get("/todos").then((res) => (this.todos = res.data));
    },
    addTodo() {
      if (!this.newTodo.trim()) return;
      api.post("/todos", { title: this.newTodo, done: false }).then(() => {
        this.newTodo = "";
        this.fetchTodos();
      });
    },
    deleteTodo(title) {
      api.delete(`/todos/${title}`).then(() => {
        this.fetchTodos();
      });
    },
  },
  mounted() {
    this.fetchTodos();
  },
};
</script>
