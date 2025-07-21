import Vue from 'vue'
import App from './App.vue'
// import {Container,Button,Radio,Main,Header,Aside} from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import ElementUI from 'element-ui';

import router from './router'
import store from './Store'
import api from './api'

Vue.prototype.$api = api
Vue.config.productionTip = false
// Vue.use(Button)
// Vue.use(Container)
// Vue.use(Radio)
// Vue.use(Main)
// Vue.use(Header)
// Vue.use(Aside)
Vue.use(ElementUI)

new Vue({
  store,
  router,
  render: h => h(App),
}).$mount('#app')
