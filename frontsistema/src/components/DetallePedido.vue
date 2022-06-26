<template>
  <div class="vh-100">
    <h3 class="display-3 text-white">Detalle del pedido  {{this.$route.params.id}}</h3>
      <ol class="text-white">
        <div class="row">
          <li v-for="item in datosPedido" :key="item">
            <div class="col-12 col-sm-12">
              <p><b>Producto:</b> {{ item["producto"]["nombre"]}} | <b>Precio unitario:</b> ${{ item["producto"]["precio"]}} | 
              <b>Cantidad pedida:</b> {{item["cantidad"]}}</p>
            </div>
          </li>
        </div>
      </ol>
    </div>

</template>
<script>
import axios from "axios";
export default {
  name: "DetallePedido",
  data() {
    return {
        datosPedido: {},
    };
  },
  methods: {
      getPedidos() {
        axios({
              url: "http://127.0.0.1:8081/productopedido/"+this.$route.params.id+"/det/",
              headers: {Authorization: "Token " + this.$store.getters.getToken},
              method: "GET",
        }).then((response) => {
            this.datosPedido = response.data;
    


        });
      },
  },
  mounted() {
      this.getPedidos();
  },
};
</script>


