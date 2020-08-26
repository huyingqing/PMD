<template>
  <div class="outtop">
    <transition>
      <div class="gotop-index" v-show="btnFlag">
        <a href="javascript:;" class="gotop-a" @click="backTop">
          <img
            class="topimg"
            src="../assets/img/home/header/backtop.png"
            alt=""
          />
          <!-- <p>top</p> -->
        </a>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  data() {
    return {
      btnFlag: false,
    };
  },
  mounted() {
    // 此处true需要加上，不加滚动事件可能绑定不成功
    window.addEventListener("scroll", this.scrollToTop, true);
  },
  destroyed() {
    window.removeEventListener("scroll", this.scrollToTop, true);
  },
  methods: {
    backTop() {
      const that = this;
      let timer = setInterval(() => {
        let ispeed = Math.floor(-that.scrollTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop =
          that.scrollTop + ispeed;
        if (that.scrollTop === 0) {
          clearInterval(timer);
        }
      }, 16);
    },
    // 为了计算距离顶部的高度，当高度大于20显示回顶部图标，小于60则隐藏
    scrollToTop() {
      //   console.log(123);
      const that = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      that.scrollTop = scrollTop;
      if (that.scrollTop > 20) {
        that.btnFlag = true;
      } else {
        that.btnFlag = false;
      }
    },
  },
};
</script>

<style scoped>
/*返回顶部*/
.gotop-index {
  position: fixed;
  right: 0.6rem;
  bottom: 1.6rem;
  display: block;
  width: 0.8rem;
  height: 0.8rem;
  /* background: #fff; */
  /* box-shadow: 0px 0px 4px #ddd; */
  display: flex;
  border-radius: 50%;
  z-index: 100;
  /* background-color: #fff; */
}
.topimg {
  width: 30px;
  background-color: #fff;
  border: 1px solid #fff;
  border-radius: 50%;
}
.gotop-a {
  display: block;
  /* width: 70px; */
  /* height: 100px; */
  /* background: url() no-repeat 0 0; */
  /* background-size: 50px; */
  margin-left: -15px;
  margin-top: -190px;
  text-align: center;
  font-size: 16px;
  font-weight: 700;
  color: #666;
}
</style>
