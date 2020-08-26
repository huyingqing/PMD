<template>
<div>
  <!-- 头部组件 -->
  <div class="outdiv">
    <!-- 顶部 -->
    <div class="logoout">
      <div class="logo">
        <img class="logoimg" src="../assets/img/home/header/logo.png" alt="" />
      </div>
    </div>
      <van-nav-bar left-arrow class="van-nav-bar">
        <template #left>
          <van-icon class="van-icon" name="location-o" size="22" />
          <span class="spansize"
            ><a href="/addr" @click="addrer(k)">{{ address }}</a></span
          >
        </template>
        <template #right>
          <van-icon @click="search" name="search" size="22" />
          <span><pre class="premargin"> | </pre></span>
          <van-icon @click="personal" name="more-o" size="20" />
        </template>
      </van-nav-bar>
    </div>
    <!-- 点击显示个人中心四列 @click="personalowen"-->
    <my-personal v-show="ispersonal"></my-personal>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  data() {
    return {
      ispersonal: false,
      //addr:"上海市"
    };
  },
  methods: {
    personal() {
      if (this.ispersonal == false) {
        this.ispersonal = true;
      } else if (this.ispersonal == true) {
        this.ispersonal = false;
      }
    },
    // 点击进入地址页面
    addrer(k) {
      // this.addr=this.$store.data.address
      console.log(this.address);
      // this.isShow=false
    },
    // 点击搜索
    search(){
        this.$router.push('/search')
    }

    // personalowen(){
    //     if(this.ispersonal==true){
    //         this.ispersonal=false;
    //     }
    // }
  },
  computed: {
    ...mapState(["address"]),
  },
  mounted() {
    console.log(this.address);
  },
};
</script>

<style scoped>

.outdiv {
  width: 100%;
  /* max-width: 736px; */
  position: fixed;
  z-index: 1000;
  background-color: #fff;
  border-bottom: 1px solid #c6c6c6;
  /* margin: 0 auto;
  height: .5rem;  */
  
}
.van-nav-bar {
  padding: 25px 0px;
  position: relative;
  z-index: 1000;
  background-color: #fff;
  height: 3.4rem;
}
.mint-header {
  padding: 25px 0px;
}
.logoout {
  width: 50%;
  text-align: center;
  line-height: 2rem;
  margin: 0 auto;
  /* position: fixed;
    z-index: 1999; */
  /* position:relative; */
}
.logo {
  width: 50%;
  position: fixed;
  z-index: 1999;
  margin: 0 auto;
}
.logoimg {
  width: 40%;
  max-width: 50%;
  /* margin-top: 15px; */
  padding-top: 1.3rem;
}
.headerspan,a {
  font-size: 16px;
  color: #8d8d8d;
}
.spansize {
  font-size: 14px;
  color: #8d8d8d;
  display: inline-block;
  margin-left: 0.6rem;
}
.van-nav-bar__right {
  padding: 0px;
}
.premargin {
  margin: 0;
  font-size: 14px;
  color: #8d8d8d;
}
.van-icon {
  color: #8d8d8d;
}
</style>
