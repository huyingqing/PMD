import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import store from './store'
// import cors from './cors'
import qs from 'qs'
// import Bootstrap from 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min'
import Vant from 'vant'
import 'vant/lib/index.css'
import Mint from 'mint-ui'
import 'mint-ui/lib/style.min.css'
import VueLazyload from 'vue-lazyload'  //引入这个懒加载插件
// 引入头部全局组件
import Header from "./components/Header.vue"
import Footer from "./components/Footer.vue"
import Scroll from "./components/Scroll.vue"
import Detailfooter from "./components/Detailfooter.vue"
import Detailheader from "./components/Detailheader.vue"
import Start from "./components/Start.vue"
import Personal from "./components/Personal.vue"


// 引入swiper轮播
import { Swipe, SwipeItem } from 'vant';
Vue.use(Swipe);
Vue.use(SwipeItem);

// 挂载懒加载
Vue.use(VueLazyload)
// 引入全局icon
import { Icon } from 'vant';
Vue.use(Icon)

Vue.use(Mint)
// Vue.use(Bootstrap)
Vue.use(Vant)
axios.defaults.baseURL = 'http://127.0.0.1:3005'
Vue.prototype.axios = axios;
Vue.config.productionTip = false
Vue.component("my-header",Header)
Vue.component("my-footer",Footer)
Vue.component("my-scroll",Scroll)
Vue.component("my-dfooter",Detailfooter)
Vue.component("my-dheader",Detailheader)
Vue.component("my-start",Start)
Vue.component("my-personal",Personal)



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
