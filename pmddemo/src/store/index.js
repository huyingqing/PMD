import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //标识用户是否登录
    // 如果用户已登录，islogin的值为sessionStorage中的islogin的值，即为true
    isLogin:localStorage.getItem('isLogin') || false,
    isLogin:localStorage.getItem('uname') || "",
    // 组件一开始加载时，执行这个文件时，先从本地缓存把购物车数据拉下来，保存进全局
    car:JSON.parse(localStorage.getItem('car')) || [],
     address:'上海市',
  },
  mutations: {
    // 用户登录后，将用户名存到缓存
    login_mutation(state,payload){
      state.isLogin=true;
      state.uname=payload.uname;
    },
    // 退出登录时清除缓存
    logout_mutations:(state)=>{
      state.isLogin=false;
      localStorage.clear();
      // 退出登录后，清除购物车
      state.car=[];
    },
    // 点击加入购物车，把商品保存到store的car上
    addTocar(state,goodInfo){
      // 假设购物车中没有找到商品
      let flag=false;
      // 如果购物车之前有商品，只需要更新商品数量，否则添购物车中加新商品
      state.car.forEach(item=>{
        if(item.lid==goodInfo.lid){
          item.addCount+=parseInt(goodInfo.addCount);
          flag=true;
        }
      });
      // 如果循环完之后，拿到的flag还是false，则把商品数据直接添加到car中
      if(!flag){
        state.car.push(goodInfo);
      }
      // 把car拿到本地localstorge中储存
      localStorage.setItem('car',JSON.stringify(state.car))
    },
    // 点击地址后将内容赋给头部
    setaddress(state,address){
      state.address=address;
    }
    
  },
  actions: {
  },
  modules: {
  }
})
