<template>
  <div class="center_out">
    <!-- 引入头部 -->
    <my-dheader></my-dheader>
    <div class="center">
      <!-- 设置背景颜色开始 -->
      <div></div>
      <!-- 设置背景颜色结束 -->
      <!-- 个人中心的div开始 -->
      <div class="centerinfo">
        <div class="centerinfo_name">
            <!-- 用户头像开始 -->
            <div class="center_userimg">
                <img src="../assets/img/home/header/touxiang.png" alt="">
            </div>
            <!-- 用户姓名开始 -->
            <div v-if="this.$store.state.isLogin">
                <p >{{this.$store.state.uname}} </p>
                <p class="login_p" @click="Logout">退出登录</p>
            </div>
            <div  v-else>
                <p ><pre class="login_p">您还没有登录哦~ <a href="/login">点击登录</a></pre></p>
            </div>
        <!-- 用户头像结束 -->
        <!-- 菜单选项开始 -->
        <div class="centerinfo_menu">
            <!-- 第一行 -->
            <ul class="centerinfo_menu1">
                <li>
                    <img src="../assets/img/home/header/center/dingdan.png" alt="">
                    <p><a href="">我的订单</a></p>
                </li>
                <li>
                    <img src="../assets/img/home/header/center/daifukuan.png" alt="">
                    <p><a href="">待付款</a></p>
                </li>
                <li>
                    <img src="../assets/img/home/header/center/daishouhuo.png" alt="">
                    <p><a href="">待收货</a></p>
                </li>
                <li>
                    <img src="../assets/img/home/header/center/level1.png" alt="">
                    <p><a href="">会员等级</a></p>
                </li>
            </ul>
            <ul class="centerinfo_menu1 centerinfo_menu2">
                <li>
                    <img src="../assets/img/home/header/center/jifen_1.png" alt="">
                    <p><a href="">积分</a></p>
                </li>
                <li>
                    <img src="../assets/img/home/header/center/yue.png" alt="">
                    <p><a href="">余额</a></p>
                </li>
                <li>
                    <img src="../assets/img/home/header/center/youhuiquan.png" alt="">
                    <p><a href="">优惠券</a></p>
                </li>
                <li>
                    <img src="../assets/img/home/header/center/yinhangka1.png" alt="">
                    <p><a href="">现金卡</a></p>
                </li>
            </ul>
        </div>
        <!-- 菜单选项结束 -->
        </div>
      </div>
      <!-- 个人中心的div结束 -->
    </div>
  </div>
</template>

<script>
export default {
    methods:{
        Logout(){
            // 点击退出时，使用store中的logout_mutations方法
            this.$store.commit('logout_mutations');
    }
    }
}
</script>

<style scoped>
.center_out{
    position: relative;
}
.center {
  width: 100%;
  height: 100%;
  max-width: 150rem;
  height: 100%;
  margin: 0 auto;
  padding-top: 3.45rem;
  padding-bottom: 3.45rem;
  /* position: relative; */
  /* overflow: hidden; */
}
.center>div:first-child{
  width: 100%;
  height: 100%;
  min-height: 15rem;
  background-color: #eee;
}
.login_p{
    font-size: 1rem ;
    color:#767676 ;
}
.center_userimg img{
    width: 25%;
    border-radius: 50%;
}
.centerinfo{
    width: 85%;
    height: 100%;
    background-color: white;
    text-align: center;
    position: absolute;
    margin-top: -10rem;
    padding-top: 2rem;
    top: 75%;
    left: 8%;
    /* margin-left: 2rem; */
    /* margin: -10 auto; */
}
.centerinfo_menu{
    padding: 3rem 0rem 0rem 0rem;
}
.centerinfo_menu1{
     width: 100%;
    margin: 0 auto;
    overflow: hidden;
    display: flex; 
    flex-direction: row;
    justify-content: center;
}
.centerinfo_menu1 li{
    width: 100%;
    border-left:1px solid #eee ;
    padding: 1rem 0.85rem;
    margin-left: 0;
    text-align: center;
}
.centerinfo_menu1 li a{
    font-size: 0.5rem;
    color: #767676;
}
.centerinfo_menu1 li img{
    width: 50%;
}
.centerinfo_menu2{
    border-bottom:1px solid #eee ;
    /* border-bottom: 1px; */
}

</style>
