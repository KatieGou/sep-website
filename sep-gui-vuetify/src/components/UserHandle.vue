<template>
  <div class="center">
    <form @submit.prevent="login">
      <h2>Login</h2>
      <v-text-field
        label="username"
        v-model="loginData.username"
        style="width: 600px;"
        required
        clearable
      ></v-text-field>

      <v-text-field
        label="password"
        v-model="loginData.password"
        style="width: 600px;"
        required
        clearable
      ></v-text-field>

      <v-btn type="submit" @click="login">Login</v-btn>
    </form>
  </div>
</template>

<script>
import { postLogin } from '@/api/api';
export default {
  data() {
    return {
      loginData: {
        username: '',
        password: '',
      },
      loginStatus: '',
      wrongPassword: false,
      nonExistentUser: false,
    };
  },
  methods: {
    async login() {
      // Send a POST request to the backend for authentication
      // Handle success or error responses accordingly
      this.loginStatus = await postLogin(this.loginData);
      this.loginData = {
        username: '',
        password: '',
      };
      if (this.loginStatus === 'Wrong password') {
        this.wrongPassword = true;
        this.nonExistentUser = false;
      } else if (this.loginStatus === 'Non-existent user') {
        this.nonExistentUser = true;
        this.wrongPassword = false;
      } else {
        this.wrongPassword = false;
        this.nonExistentUser = false;
        this.$router.push(`/user/${this.loginStatus.data[0].id}`);
      }
    },
  },
};
</script>