  <template>
    <div>
      <h3 class="display-3 text-white text-center mb-3">Productos</h3>
    <div id="alerta" class="alert alert-success" role="alert">
      A simple success alert—check it out!
    </div>
      <section class="container">
        <div class="row">
          <article class="col-12 col-sm-4 p-2 article-height" v-for="item in datosProducto" :key="item.id">
              <div class="card bg-transluce h-100">
                <div class="card-body d-flex flex-column justify-content-between">
                  <h5 class="card-title h3 text-center">{{ item.nombre }}</h5>
                  <p class="card-text">{{ item.descripcion }}</p>
                  <p class="card-text h5">Precio: ${{ item.precio }}</p>
                  <div class="w-100 d-flex justify-content-center">
                    <img :src="(item.imagen)" class="w-75"/>
                  </div>  
                  <span v-if="isLogged">
                    <span v-if="pedidoAbierto" class="d-flex justify-content-end mt-3">
                      <button v-on:click="agregarAPedido(item.id)" 
                      class="btn btn-primary m-1" type="button">
                      Agregar a pedido
                    </button>
                    </span>
                  </span>
                </div>
              </div>
          </article>
        </div>
      </section>
    </div>
  </template>

<script>
import axios from "axios";
export default {
  //////
  name: "Producto",
  data() {
    return {
      datosProducto: {},
    };
  },
  ///////
  methods: {
    getImagen() {
      axios({
        url: "http://localhost:8081/"+this.item.imagen,
        method: "PUSH",
      });
    },
    getProductos() {
    var alerta = document.getElementById("alerta"); 
    alerta.style.display = 'none';
      axios({
        url: "http://127.0.0.1:8081/producto/",
        headers: {},
        method: "GET",
      }).then((response) => {
        this.datosProducto = response.data;
      });
    },
    agregarAPedido(idProducto) {
      axios({
        url: "http://127.0.0.1:8081/productopedido/agregar/",
        headers: { Authorization: "Token " + this.$store.getters.getToken },
        method: "POST",
        data: {idProd: idProducto, idPed: this.$store.getters.getIdPedidoAbierto},
      });
      var alerta = document.getElementById("alerta"); 
      alerta.style.display = 'block';
    }
  
  },
  mounted() {
    var alerta = document.getElementById("alerta"); 
    alerta.style.display = 'none';
    this.getProductos();
  },
  computed: {
    isLogged() {
      return this.$store.getters.getIsLog;
    },
    pedidoAbierto() {
      return (this.$store.getters.getIdPedidoAbierto != 0);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
