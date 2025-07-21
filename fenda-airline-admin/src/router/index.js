import Vue from 'vue'
import VueRouter from 'vue-router'
import Main from '../views/Main.vue'
import User from '../views/User'
import Flight from '../views/Flight'
import Home from '../views/Home'
import Request from '../views/Request'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'AppMain',
    component: Main,
    children: [
      {
        path: '/home',
        name: 'AppHome',
        component:Home,
      },
      {
        path: '/user',
        name: 'AppUser',
        component: User,
      },
      {
        path: '/flight',
        name: 'AppFlight',
        component:Flight,
      },
      {
        path: '/request',
        name: 'AppRequest',
        component:Request,
      },
    ]
  },
]

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router