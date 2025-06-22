<template>
  <ul>
    <li v-for="todo in todos" :key="todo._id">
      <label>
        <input type="checkbox" :checked="todo.done" @change="$emit('toggle', todo)" />
        <span :style="{ textDecoration: todo.done ? 'line-through' : 'none' }">{{ todo.title }}</span>
      </label>
      <button @click="$emit('delete', todo)">Delete</button>
    </li>
  </ul>
</template>
