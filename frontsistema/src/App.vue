<template>
<div class="template-home">
  <div id="app" >
  <nav class="navbar d-flex justify-content-between p-4" role="navigation">
    <img src="./assets/gabilogo1.svg"/>    
    <ul class="nav">
      <li class="nav-item">
        <router-link class="nav-link active btn-transparent text-white btn-lg" to="/">Home</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link active btn-transparent text-white btn-lg" to="/producto">Productos</router-link>
      </li>
      <span v-if="!isLogged"><li class="nav-item">
        <router-link class="nav-link active btn-transparent text-white btn-lg" to="/login">Login</router-link>
      </li></span>
      <span v-if="!isLogged"><li class="nav-item">
        <router-link class="nav-link active btn-transparent text-white btn-lg" to="/registrar">Registrarse</router-link>
      </li></span>
      <span v-if="isLogged"><li class="nav-item">
        <router-link class="nav-link active btn-transparent text-white btn-lg" to="/pedido">Pedidos</router-link>
      </li></span>
      <span v-if="isLogged"><li class="nav-item">
        <router-link class="nav-link active btn-transparent text-white btn-lg" to="/logout">Logout</router-link>
      </li></span>
    </ul>
        
        
        
      </nav>
   <div class="container-fluid p-5"> <router-view /></div>
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

