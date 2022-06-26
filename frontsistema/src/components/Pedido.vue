<template>
  <div class="vh-100">
    <h3 class="display-3 text-white text-center">Mis pedidos</h3>
    <button
      v-on:click="crearPedido()"
      class="btn btn-success m-1"
      type="button"

    >
      Crear nuevo pedido
    </button>
    <ul class="text-white">
      <li v-for="item in datosPedido" :key="item.id">
        <div class="row">
          <div class="col-12 col-sm-12">
            <b>Código:</b> {{ item.id }} | <b>Fecha:</b> {{ item.fecha }} |
            <b>Total:</b> {{ item.total }}
            <span v-if="item.estado === 'A'">
              <button
                v-on:click="cerrarPedido(item.id)"
                class="btn btn-danger m-1"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#collapseExample"
                aria-expanded="false"
                aria-controls="collapseExample"
              >
                Cerrar pedido
              </button>
            </span>
            <span v-else-if="item.estado === 'P'">
              <button
                class="btn btn-warning m-1"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#collapseExample"
                aria-expanded="false"
                aria-controls="collapseExample"
                disabled
              >
                Pendiente
              </button>
            </span>
            <span v-else-if="item.estado === 'V'">
              <button
                class="btn btn-outline-success m-1"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#collapseExample"
                aria-expanded="false"
                aria-controls="collapseExample"
                disabled
              >
                En viaje
              </button>
            </span>
            <span v-else-if="item.estado === 'E'">
              <button
                class="btn btn-success m-1"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#collapseExample"
                aria-expanded="false"
                aria-controls="collapseExample"
                disabled
              >
                Entregado
              </button>
            </span>
            <router-link :to="'/detallepedido/' + item.id">
              <button
                class="btn btn-primary m-1"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#detPedido"
              >
                Ver detalle
              </button>
            </router-link>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>


<script>
import axios from "axios";
export default {
  //////
  name: "Pedido",
  data() {
    return {
      datosPedido: {},
    };
  },
  ///////
  methods: {
    getPedidos() {
      axios({
        url: "http://127.0.0.1:8081/pedido/c/",
        headers: { Authorization: "Token " + this.$store.getters.getToken },
        method: "GET",
      }).then((response) => {
        this.datosPedido = response.data;
        const size = this.datosPedido.length;
        for(var i = 0; i<size; i++) {
          if(this.datosPedido[i].estado === 'A') {
            this.$store.commit(
            "cargarPedidoAbierto",
            this.datosPedido[i].id
            );    
          }

        }
        console.log(this.$store.getters.getIdPedidoAbierto)
      });
    },
    cerrarPedido(idPedido) {
      axios({
        url: "http://127.0.0.1:8081/pedido/" + idPedido + "/",
        headers: { Authorization: "Token " + this.$store.getters.getToken },
        method: "PATCH",
        data: { estado: "P" },
      }).then(() => {
        this.$store.commit(
          "sacarPedidoAbierto"
          );
        this.getPedidos();
      });
    },
    crearPedido() {
      axios({
        url: "http://127.0.0.1:8081/pedido/crear/",
        headers: { Authorization: "Token " + this.$store.getters.getToken },
        method: "GET",
      }).then((response) => {
        this.$store.commit(
          "cargarPedidoAbierto",
          response.data[0].id
          );
          //console.log(response.data[0].id)
        this.getPedidos();
      });
    },
  },
  mounted() {
    this.getPedidos();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
