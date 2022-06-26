import { createApp } from 'vue'
import App from './App.vue'
import {router} from './router'
import store from './store'
//import axios from 'axios'
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"
import "./App.css"
const app = createApp(App).use(router).use(store)
app.mount('#app');
