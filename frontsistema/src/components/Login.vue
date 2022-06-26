<template>
<div class="vh-100">
    <h1 class="display-1 text-center text-white">Login</h1>
    <form class="form-group text-white d-grid gap-4 container form-w p-3" @submit.prevent="loguear">
        <label>Nombre:</label>
        <input type="text" class="form-control" required v-model="username" placeholder="Username">
        <label>Password:</label>
        <input type="password" class="form-control" required v-model="password" placeholder="Password">
        <div class="d-flex justify-content-center">
            <button class="btn btn-primary px-3" type="submit">Login</button>
        </div>
    </form>
</div>
</template>

<script>
import axios from "axios"
export default {
    //////
  name: 'Login',
  data() {
      return {
          username: "",
          password: "",
      }
  },
  ///////
  methods: {
      loguear() {
        axios({
              url: 'http://127.0.0.1:8081/auth/token/login/',
              data: {username: this.username, password: this.password},
              method: 'POST'
        }).then((response) => {
            //console.log(response.data);
            this.$store.commit(
                "logUser",
                response.data.auth_token,
                response.data.id
            );
            this.$router.push('/');
        });
      },
  },
  mounted() {
      //
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
