<template>
  <div>
    <!-- 底部导航栏 -->
    <div>
      <van-tabbar v-model="active">
        <van-tabbar-item icon="home-o" @click="Selected"
          ><a>精选</a></van-tabbar-item
        >
        <van-tabbar-item icon="shop-o"
          ><a href="/cake">蛋糕</a></van-tabbar-item
        >
        <van-tabbar-item icon="shop-collect-o"
          ><a href="/cracker">小食</a></van-tabbar-item
        >
        <van-tabbar-item icon="shopping-cart-o" @click="shopcart"
          >购物车</van-tabbar-item
        >
      </van-tabbar>
    </div>

    <!-- 精选 -->
    <div class="Selected" v-if="isSelected" @click="Selectedown">
      <div class="Selectedin">
        <!-- 第一行 -->
        <div class="Selectedin_div">
          <a href="/cake" class="Selecteda">所有蛋糕</a>
        </div>
        <!-- 第二行 -->
        <ul class="Selectedin_ul">
          <li @click="taste" class="taste">口味筛选</li>
        </ul>
        <ul v-if="istaste">
          <li v-for="(item, index) of tastes" :key="index">
            <a :href="`/sort/cake/${item.sort}`">{{ item.taste }}</a>
          </li>
        </ul>
        <!-- 第三行 -->
        <ul class="Selectedin_ul" @click="sence">
          <li class="taste">场景筛选</li>
        </ul>
        <ul v-if="isscene">
          <li v-for="(item, index) of scenes" :key="index">
            <a :href="`/sort/caker/${item.sort}`">{{ item.scene }}</a>
          </li>
        </ul>
        <!-- 第四行 -->
        <div><a href="/cracker" class="Selecteda">所有小食</a></div>
        <!-- 第五行 -->
        <div><a href="" class="Selecteda">所有配件</a></div>
      </div>
      <!-- 点击关闭 -->
      <!-- <div class="personal_div">
                <span>关闭页面</span>
            </div> -->
    </div>
  </div>
</template>

<script>
export default {
  // props:['sort'],
  data() {
    return {
      active: "dot",
      istaste: false,
      isscene: false,
      // 声明数组保存口味
      tastes: [],
      // 声明数组保存场景
      scenes: [],
      isSelected: false,
      // iscenter:true
    };
  },
  methods: {
    taste() {
      if (this.istaste == false) {
        this.isscene = false;
        this.istaste = true;
      } else if ((this.istaste = true)) {
        this.istaste = false;
        this.isscene = false;
      }
    },
    sence() {
      if (this.isscene == false) {
        this.istaste = false;
        this.isscene = true;
      } else if (this.isscene == true) {
        this.istaste = false;
        this.isscene = false;
      }
    },
    Selected() {
      this.isSelected = true;
    },
    Selectedown() {
      // if(this.isSelected==true){
      //     this.isSelected=false
      // }
    },
    // 点击购物车判断有无登录
    shopcart() {
      if (!this.$store.state.isLogin) {
        this.$toast({
          message: "您需要先登录才能操作",
          position: "center",
          duration: 3000,
        });
        this.$router.push(`/login`);
      } else {
        this.$router.push(`/cart`);
      }
    },
    // close(){
    //     this.iscenter=false
    // },
  },
  mounted() {
    // 请求口味
    this.axios.get("/listtaste").then((res) => {
      this.tastes = res.data.results;
      // console.log(this.tastes)
    });
    // 请求场景
    this.axios.get("/listscene").then((res) => {
      this.scenes = res.data.results;
      // console.log(this.scenes)
    });
  },
  watch: {
    // 实时监听sort的变化
    $route() {
      this.sort = this.$route.params.sort;
      //判断得到的参数，执行全局查找
      this.onload();
    },
  },
};
</script>

<style scoped>
.van-tabbar-item--active {
  color: #000 !important;
  font-weight: 700;
}
a {
  color: #646566;
  text-decoration: none;
}
.Selected {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  /* margin-bottom: -4rem; */
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 2002;
  overflow: hidden;
}
.Selectedin {
  width: 40%;
  height: 100%;
  background-color: #fff;
  padding-top: 3rem;
}
.Selectedin div {
  padding: 0.2rem 1rem;
  border-bottom: 1px solid #ddd;
}
.Selecteda {
  font-size: 0.8rem;
  color: #000;
}
ul {
  padding: 0.2rem 0rem;
}
ul > li {
  padding: 0.1rem 1rem;
}
ul > li > a,
.taste {
  font-size: 0.8rem;
  color: #555;
}
.Selectedin_ul {
  border-bottom: 1px dashed #999;
}
.personal_div span {
  display: block;
  background-color: #eee;
  margin-top: -50%;
  margin-left: 20%;
  width: 20%;
  font-size: 1rem;
}
.personal_div img {
  width: 60%;
}
</style>
