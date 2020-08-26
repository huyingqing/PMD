<template>
  <div >
    <my-start></my-start>
    <my-header></my-header>
    <!-- 引入回到顶部 -->
    <my-scroll></my-scroll>
    <div class="home">

    
    <!-- 轮播图 -->
    <div >
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(item, index) of lunbo" :key="index">
          <a href="/cake"><img class="lunboimg" v-lazy="item.img" alt=""/></a>
        </van-swipe-item>
      </van-swipe>
    </div>
    <!-- 本季推荐div -->
    <div class="benji">
      <div class="benjiin">
        <!-- 图片 -->
        <div class="benjiweizhi">
          <div class="flot">
            <img
              class="benjiimg"
              src="../assets/img/home/canju/icon_cj.png"
              alt=""
            />
          </div>
          <div class="flot ">
            <span class="benjisize">本季推荐</span><br />
            <span class="benjisizesmall">Seasonal Recommend</span>
          </div>
          <div class="flot">
            <span class="benjisizesmall">Seasonal</span>
          </div>
        </div>
      </div>
    </div>
    <!-- 大图 -->
    <div class="datu">
      <a href="/cake"
        ><img
          class="datuimg"
          src="../assets/img/home/datu/f7bbdd0477316e45.jpg"
          alt=""
      /></a>
    </div>
    <!-- 第一个列表 -->
    <div class="listdiv">
      <ul class="listul">
        <li
          v-for="(item, index) of list.slice(0, 4)"
          :key="index"
          class="lidtflot"
        >
          <a :href="`/details/${item.lid}`"
            ><img class="listimg" v-lazy="list.slice(0, 4)[index].img" alt=""
          /></a>
          <div>
            <span class="listspan">{{ item.cname }}</span>
          </div>
          <div>
            <span class="listtitle">{{ item.title }}</span>
          </div>
          <span class="listspan ">¥{{ item.price.toFixed(2) }}</span>
          <span class="listshopping"><van-icon name="shopping-cart-o" /> </span>
        </li>
      </ul>
    </div>
    <!-- 本季推荐div -->
    <div class="benji">
      <div class="benjiin">
        <!-- 图片 -->
        <div class="benjiweizhi">
          <div class="flot">
            <img
              class="benjiimg"
              src="../assets/img/home/canju/icon_cj.png"
              alt=""
            />
          </div>
          <div class="flot ">
            <span class="benjisize">人气推荐</span><br />
            <span class="benjisizesmall">Popularity Recommend</span>
          </div>
          <div class="flot">
            <span class="benjisizesmall">Popularity</span>
          </div>
        </div>
      </div>
    </div>
    <!-- 大图 -->
    <div class="datu">
      <a href="/cake"
        ><img
          class="datuimg"
          src="../assets/img/home/datu/b6f553a4b6fb8b76.jpg"
          alt=""
      /></a>
    </div>
    <!-- 第二个列表 -->
    <div class="listdiv">
      <ul class="listul">
        <li
          v-for="(item, index) of list.slice(4, 8)"
          :key="index"
          class="lidtflot"
        >
          <a :href="`/details/${item.lid}`"
            ><img class="listimg" v-lazy="list.slice(4, 8)[index].img" alt=""
          /></a>
          <div>
            <span class="listspan">{{ item.cname }}</span>
          </div>
          <div>
            <span class="listtitle">{{ item.title }}</span>
          </div>
          <span class="listspan ">¥{{ item.price.toFixed(2) }}</span>
          <span class="listshopping"><van-icon name="shopping-cart-o" /> </span>
        </li>
      </ul>
    </div>
    <!-- 本季推荐div -->
    <div class="benji">
      <div class="benjiin">
        <!-- 图片 -->
        <div class="benjiweizhi">
          <div class="flot">
            <img
              class="benjiimg"
              src="../assets/img/home/canju/icon_cj.png"
              alt=""
            />
          </div>
          <div class="flot ">
            <span class="benjisize">萌系推荐</span><br />
            <span class="benjisizesmall">萌系推荐</span>
          </div>
          <div class="flot">
            <span class="benjisizesmall">Lovely Recommed</span>
          </div>
        </div>
      </div>
    </div>
    <!-- 大图 -->
    <div class="datu">
      <a href="/cake">
        <img
          class="datuimg"
          src="../assets/img/home/datu/e05788df1a90eedd.jpg"
          alt=""
      /></a>
    </div>
    <!-- 第三个列表 -->
    <div class="listdiv">
      <ul class="listul">
        <li
          v-for="(item, index) of list.slice(8, 12)"
          :key="index"
          class="lidtflot"
        >
          <a :href="`/details/${item.lid}`"
            ><img class="listimg" v-lazy="list.slice(8, 12)[index].img" alt=""
          /></a>
          <div>
            <span class="listspan">{{ item.cname }}</span>
          </div>
          <div>
            <span class="listtitle">{{ item.title }}</span>
          </div>
          <span class="listspan ">¥{{ item.price.toFixed(2) }}</span>
          <span class="listshopping"><van-icon name="shopping-cart-o" /> </span>
        </li>
      </ul>
    </div>
    <div class="bankp">
      <p class="bankpadding ">银行专区 Bank Zone</p>
      <!-- 银行大图 -->
      <div class="datu">
        <a href="/"
          ><img
            class="datuimg"
            src="../assets/img/home/datu/247f819453472e25.jpg"
            alt=""
        /></a>
      </div>
    </div>
    <!-- 底部 -->
    <div class="footdiv">
      <div class="footout">
        <div class="footout">
          <img
            class="footlogo1"
            src="../assets/img/home/footer/logo1.png"
            alt=""
          />
        </div>
      </div>
      <div class="footout">
        <img
          class="footwx"
          src="../assets/img/home/footer/wx_code.jpg"
          alt=""
        />
      </div>
      <div class="footin">
        <p class="footp1">
          <a href="/"
            ><img src="../assets/img/home/footer/weibo.png" alt=""
          /></a>
        </p>
        <p class="footp2">
          <a href="/"
            ><img src="../assets/img/home/footer/weixin.png" alt=""
          /></a>
        </p>
      </div>
      <div class="footlastp">
        <p class="footp">
          Copyright © 2012-2019 上海卡法电子商务有限公司 版权所有
          沪ICP备12022075号
        </p>
      </div>
    </div>
    <!-- 引入底部导航 -->
    <my-footer></my-footer>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  data() {
    return {
      // 保存轮播数组
      lunbo: [],
      // 保存首页商品列表
      list: [],
    };
  },
  // 监听
  mounted() {
    // 监听轮播图
    this.axios.get("/lunbo").then((res) => {
      this.lunbo = res.data.results;
      // console.log(this.lunbo)
    });
    this.axios.get("/list").then((res) => {
      this.list = res.data.results;
      // console.log(this.list)
    });
  },
  watch: {
    $route() {
      // this.lid=this.$route.params.lid
      //判断得到的参数，执行全局查找
      this.detail();
    },
  },
};
</script>

<style scoped>
.home{
  width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
}
.my-swipe .van-swipe-item {
  width: 100%;
  color: #fff;
  font-size: 20px;
  line-height: 150px;
  text-align: center;
  /* background-color: #39a9ed; */
  margin-top: 2rem;
}
.lunboimg {
  width: 100%;
  margin-top: 23px;
}
.benji {
  width: 100%;
  /* height: 10rem; */
  /* border: 1px solid #999; */
  overflow: hidden;
}
.benjiin {
  width: 95%;
  margin: 0 auto;
  padding: 30px 0px;
  overflow: hidden;
}
.benjiimg {
  width: 4.53rem;
}
.flot {
  float: left;
  /* margin: 0px 15px; */
  /* margin: 0 auto; */
}
.benjisize {
  margin-left: 20px;
  font-size: 1rem;
  font-weight: 700;
}
.benjisizesmall {
  font-size: 0.18rem;
  color: #7f7f7f;
  margin-left: 15px;
}
.benjiweizhi {
  width: 285px;
  margin: 0 auto;
  overflow: hidden;
  /* text-align: center; */
}
.datu {
  width: 100%;
}
.datuimg {
  width: 100%;
  margin: 0 auto;
}
.listdiv {
  width: 100%;
  border-bottom: 1px solid #e0dddd;
}
.listimg {
  width: 100%;
  margin-bottom: 7px;
}
.lidtflot {
  float: left;
  overflow: hidden;
  width: 50%;
  padding: 15px 5px;
  margin-bottom: 5px;
  margin: 0 auto;
}
.listul {
  width: 100%;
  overflow: hidden;
  margin: 0 auto;
}
.listspan {
  font-size: 0.8rem;
  margin-top: 7px;
  font-weight: 700;
  display: block;
}
.listtitle {
  font-size: 0.29rem;
  color: #7f7f7f;
}
.listshopping {
  border: 4px solid #ffe32a;
  border-radius: 50%;
  background-color: #ffe32a;
  float: right;
  margin-top: -25px;
  margin-right: 20px;
}
.bankp {
  color: #151515;
  text-align: center;
  font-size: 1rem;
  padding: 0.3rem 0 0.5rem;
  font-weight: 700;
}
.bankpadding {
  padding-top: 2rem;
}
.footdiv {
  background-color: #000;
  height: 21rem;
  margin-bottom: 3.2rem;
}
.footout {
  width: 200px;
  margin: 0 auto;
}
.footlogo1 {
  width: 8rem;
  margin: 2rem 3rem;
}
.footwx {
  width: 120px;
  margin: 0rem 3rem;
}
.footin {
  width: 8rem;
  margin: 15px auto;
  overflow: hidden;
}
.footp1 {
  float: left;
  margin-left: 12px;
}
.footp2 {
  float: right;
  margin-left: 3px;
}
.footlastp {
  width: 17rem;
  margin: 0 auto;
  text-align: center;
  color: #fff;
}
.footp {
  font-size: 0.18rem;
}
</style>
