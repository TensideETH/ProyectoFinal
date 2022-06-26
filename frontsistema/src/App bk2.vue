<template>
  <div id="app">
  <nav class="navbar bg-dark" role="navigation">
          
        <ul class="nav">
            <li class="nav-item">
              <router-link class="nav-link active" to="/"><button type="button" class="btn btn-success">Home</button></router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link active" to="/producto"><button type="button" class="btn btn-secondary">Productos</button></router-link>
            </li>
            <span v-if="!isLogged"><li class="nav-item">
              <router-link class="nav-link active" to="/login"><button type="button" class="btn btn-secondary">Login</button></router-link>
            </li></span>
            <span v-if="!isLogged"><li class="nav-item">
              <router-link class="nav-link active" to="/registrar"><button type="button" class="btn btn-secondary">Registrarse</button></router-link>
            </li></span>
            <span v-if="isLogged"><li class="nav-item">
              <router-link class="nav-link active" to="/pedido"><button type="button" class="btn btn-secondary">Pedidos</button></router-link>
            </li></span>
            <span v-if="isLogged"><li class="nav-item">
              <router-link class="nav-link active" to="/logout"><button type="button" class="btn btn-danger">Logout</button></router-link>
            </li></span>
          </ul>
        
        
        
      </nav>
   <div class="container-fluid p-5"> <router-view /></div>
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

