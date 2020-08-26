<template>
  <!-- 头部组件 -->
  <div class="outbigdiv">
    <div class="outdiv">
    <!-- 顶部 -->
    <div class="logoout">
      <div class="logo">
        <img class="logoimg" src="../assets/img/home/header/logo.png" alt="" />
      </div>
    </div>
    <div>
      <van-nav-bar left-arrow class="van-nav-bar">
        <template #left>
          <van-icon
            @click="back"
            class="van-icon"
            name="arrow-left"
            size="22"
          />
        </template>
        <template #right>
          <van-icon @click="cart" name="shopping-cart-o" size="22" />
          <span><pre class="premargin"> | </pre></span>
          <van-icon @click="personal" name="more-o" size="20" />
        </template>
      </van-nav-bar>
    </div>
    <!-- 点击显示个人中心四列 @click="personalowen"-->
    <my-personal v-show="ispersonal"></my-personal>
  </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      ispersonal: false,
    };
  },
  methods: {
    back() {
      this.$router.go(-1);
    },
    cart() {
      // 如果用户没有登录就先登录
      if (!this.$store.state.isLogin) {
        this.$router.push("/login");
      } else {
        this.$router.push("/cart");
      }
    },
    personal() {
      if (this.ispersonal == false) {
        this.ispersonal = true;
      } else if (this.ispersonal == true) {
        this.ispersonal = false;
      }
    },
    // goto(){
    //     this.$router.push('/cake')
    // }
  },
};
</script>

<style scoped>
/* .outbigdiv{
  width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
} */
.outdiv {
  width: 100%;
  /* max-width: 736px; */
  position: fixed;
  z-index: 1000;
  background-color: #fff;
  border-bottom: 1px solid #c6c6c6;
  /* margin: 0 auto; */
  /* height: .5rem; */ 
}
.detail[data-v-14d957f8]{
  /* width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px; */
}
.van-nav-bar {
  padding: 25px 0px;
  position: relative;
  z-index: 1000;
  background-color: #fff;
  height: 3.4rem;

  /* width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px; */
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
  /* margin-top: 15px; */
  padding-top: 1.3rem;
}
.headerspan {
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
.van-nav-bar .van-icon {
  color: #8d8d8d;
}
</style>
