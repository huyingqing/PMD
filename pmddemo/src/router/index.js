import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Cake from '../views/Cake.vue'
import Cracker from '../views/Cracker.vue'
import Details from '../views/Details.vue'
import Scroll from "../components/Scroll.vue"
import Detailfooter from "../components/Detailfooter.vue"
import Detailheader from "../components/Detailheader.vue"
import Cakesort from "../views/Cakesort.vue"
import Cakersort from "../views/Cakersort.vue"
import Login from "../views/Login.vue"
import Register from "../views/Register.vue"
import Cart from "../views/Cart.vue"
import Center from "../views/Center.vue"
import Personal from "../components/Personal.vue"
import Addr from "../views/Addr.vue"
import Search from "../views/Search.vue"
import Searchkey from "../views/Searchkey.vue"



Vue.use(VueRouter)

  const routes = [
    {
      path:'/searchkey/:kw',
      component:Searchkey,
      props:true
    },
    {
      path:'/search',
      component:Search,
      props:true
    },
    {
      path:'/addr',
      component:Addr
    },
    {
      path:'/center',
      component:Center
    },
    {
      path:'/personal',
      component:Personal
    },
    {
      path:'/cart',
      component:Cart
    },
    {
      path:'/register',
      component:Register
    },
    {
      path:'/login',
      component:Login
    },
    {
      path:'/sort/caker/:sort',
      component:Cakersort,
      name:'Cakersort',
      props:true
    },
    {
      path:'/sort/cake/:sort',
      component:Cakesort,
      name:'Cakesort',
      props:true
    },
    // {
    //   path:'/footer',
    //   component:Footer
    // },
    {
      path:'/detailheader',
      component:Detailheader
    },
    {
      path:'/detailfooter',
      component:Detailfooter
    },
    {
      path:"/details/:lid",
      name:"Details",
      component:Details,
      props:true
    },
  {
    path:'/cracker',
    component:Cracker,
  },
  {
    path:'/scroll',
    component: Scroll
  },
  {
    path:'/cake',
    name: 'Cake',
    component: Cake,
  },
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  mode: 'history',//该模式对应的浏览器中网址后面就不用跟#，例如http://localhost:8080/header
  base: process.env.BASE_URL,
  routes
})

export default router
