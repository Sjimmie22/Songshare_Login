<template>
  <div class="Loginscreen">
    <h1>Welcome To the Songshare login screen</h1>
    <img alt="Vue logo" src="../assets/logo.png">

    <form @submit.prevent="login">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" v-model="username" required>
      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="password" required>
      </div>

      <div class="form-group">
        <button type="submit">Login</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      username: '',
      password: '',
      token: null
    };
  },
  methods: {
    async login() {
      try {
        const response = await axios.post('http://localhost:8080/api/users/login', {
          username: this.username,
          password: this.password
        });

        this.token = response.data;
        console.log("Token:", this.token)

        if (this.token) {
          //localStorage.setItem('jwtToken', this.token);
          document.cookie = `jwtToken=${this.token}; path=/; domain=localhost; secure;`;

          window.location.href = 'http://localhost:5173';
        } else {
          console.error('Login failed');
        }
      } catch (error) {
        console.error('An error occurred during login:', error);
      }
    }
  }
};
</script>

<style>
/* Add more styles as needed */
</style>
