import {createRouter, createWebHistory} from 'vue-router'
import Index from './components/Index.vue'
import Producto from './components/Producto.vue'
import Pedido from './components/Pedido.vue'
import Registrar from './components/Registrar.vue'
import Login from './components/Login.vue'
import Logout from './components/Logout.vue'
import DetallePedido from './components/DetallePedido.vue'
export const router = createRouter ({
    history: createWebHistory(),
    routes: [
        {path: '/', name: 'Index', component: Index},
        {path: '/producto', name: 'Producto', component: Producto},
        {path: '/pedido', name: 'Pedido', component: Pedido},
        {path: '/registrar', name: 'Registrar', component: Registrar},
        {path: '/login', name: 'Login', component: Login},
        {path: '/logout', name: 'Logout', component: Logout},
        {path: '/detallepedido/:id', name: 'DetallePedido', component: DetallePedido}





    ],





})