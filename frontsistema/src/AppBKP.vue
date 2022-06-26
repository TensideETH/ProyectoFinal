<template>
  <div id="app">
    <div class="container-fluid">
      <span v-if="!isLogged">
      <router-link to="/registrar">Registrarse</router-link> |
      </span>
      <span v-if="!isLogged">
      <router-link to="/login">Log-in</router-link> |
      </span>
      <router-link to="/producto">Ver productos</router-link> |
      <span v-if="isLogged">
      <router-link to="/pedido">Ver pedidos</router-link> |
      </span>
      <span v-if="isLogged">
      <router-link to="/logout">Log-out</router-link> |
      </span>
      <router-link to="/">Home</router-link>
      <router-view />
      
      
      </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  computed: {
    isLogged() { return this.$store.getters.getIsLog}
  }

}
</script>

