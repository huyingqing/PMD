<template>
  <div>
    <my-dheader></my-dheader>
    <div class="detail">
      <my-scroll></my-scroll>
      <div>
        <van-swipe class="my-swiper" :autoplay="3000" indicator-color="white">
          <van-swipe-item v-for="(item, index) of swipers" :key="index">
            <a href="/"><img class="lunboimg" v-lazy="item" alt=""/></a>
          </van-swipe-item>
        </van-swipe>
      </div>
      <!-- 价格 -->
      <div class="priceout">
        <div class="price">¥{{ parseFloat(details.price).toFixed(2) }}</div>
      </div>
      <!-- 点餐时间 -->
      <div class="reserve">
        <div>
          <ul>
            <li>
              <img src="../assets/img/home/detail/time.png" alt="" />
              {{ details.reserve }}
            </li>
            <li>
              <img src="../assets/img/home/detail/canju.png" alt="" />
              {{ details.tableware }}
            </li>
            <li>
              <img src="../assets/img/home/detail/component.png" alt="" />
              {{ details.size }}
            </li>
            <li>
              <img src="../assets/img/home/detail/cake.png" alt="" />
              {{ details.Sweight }}
            </li>
            <!-- <li>
                    {{details.Storage}}
                </li> -->
          </ul>
        </div>
      </div>
      <!-- 口味 -->
      <div class="taste">
        <div>
          <img class="" src="../assets/img/home/detail/component.png" alt="" />
          <span
            ><pre> {{ details.category }} </pre></span
          >
        </div>
      </div>
      <!-- 警告 -->
      <div class="warning">
        <div>
          <img
            class="warningimg"
            src="../assets/img/home/detail/warning.png"
            alt=""
          />
          <pre class="pre">{{ details.Storage }}</pre>
        </div>
      </div>
      <!-- 简介 -->
      <div class="jianjie">
        <!-- 第一段中文 -->
        <div>{{ details.jianjie }}</div>
        <!-- 第二段英文 -->
        <div class="jjen">{{ details.jjen }}</div>
      </div>
      <!-- 促销 -->
      <div class="sales">
        <div class="salesin">
          <div class="sales1">促销</div>
          <div class="sales2">
            <div>
              <span class="salesspan">换购</span>买蛋糕可至购物车参加优惠换购
            </div>
            <div><span class="salesspan">立减</span>29.9元夏日清凉卡</div>
            <div>
              <span class="salesspan">换购</span
              >2020年8月会员日+5元换购1/4牛奶生巧
            </div>
          </div>
          <div class="sales3"><a href="">详情 &gt;</a></div>
        </div>
      </div>
      <!-- 商品详情和点评 -->
      <div class="information">
        <ul>
          <!-- 商品详情 -->
          <li class="informationdiv" @click="showimg()">商品详情</li>
          <!-- 商品点评 -->
          <li class="informationdiv" @click="showComment()">商品点评</li>
        </ul>
      </div>
      <!-- 点击商品=详情显示的页面 -->
      <div v-show="isShow">
        <!-- 商品详情下的种类页面 -->
        <div class="kind">
          <div>{{ details.adetails }}</div>
          <div>{{ details.bdetails }}</div>
          <div>{{ details.adetails }}</div>
          <div>{{ details.cdetails }}</div>
          <div>{{ details.sweet }}</div>
        </div>
        <!-- 国家 -->
        <!-- <div>
            <ul v-for="(item,index) of flag2" :key="index">
                <li><img src="item[0]" alt=""></li>
                <li>{{item[0]}}</li>
            </ul>
        </div> -->
        <!-- 详情大图 -->
        <div class="detailsimg">
          <img class="image" v-lazy="details.image" alt="" />
          <!-- {{details.img}} -->
        </div>
      </div>
      <!-- 点击商品点评显示的页面 -->
      <div class="Comment" v-show="isComment">
        <div>
          啊哦~还没有人来评论过~
        </div>
      </div>
    </div>
    <div>
      <van-goods-action class="van-goods-action">
        <!-- <van-goods-action-icon icon="chat-o" text="客服" color="#07c160" />
            <van-goods-action-icon icon="cart-o" text="购物车" />
            <van-goods-action-icon icon="star" text="已收藏" color="#ff5000" /> -->
        <van-goods-action-button
          @click="join(lid)"
          type="warning"
          text="加入购物车"
        />
        <van-goods-action-button
          @click="tocart(lid)"
          type="danger"
          text="立即购买"
        />
      </van-goods-action>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    // 声明数组保存轮播变量
    return {
      details: [],
      // 声明变量保存轮播图信息
      swipers: [],
      // 保存旗子的数组
      // flag:[],
      // flag2:[],
      isShow: true,
      isComment: false,
      // 声明变量保存商品的信息
      lid: "",
      cname: "",
      img: "",
      title: "",
      price: "",
      spec: "",
      count: 1,
    };
  },
  // 监听得到轮播
  methods: {
    detail() {
      // 监听home,传过来的lid
      let lid = this.$route.params.lid;
      this.axios.get("/details?lid=" + lid).then((res) => {
        this.details = res.data.results;
        this.swipers = res.data.results.swipers.split(",");
        console.log(res.data.results.image);

        // 将原来的商品信息，赋值给新的商品信息
        this.lid = res.data.results.lid;
        this.cname = res.data.results.cname;
        this.img = res.data.results.img;
        this.title = res.data.results.title;
        this.price = res.data.results.price;
        this.spec = res.data.results.spec;
        // console.log(this.cname)
      });
    },
    join(lid) {
      if (!this.$store.state.isLogin) {
        this.$toast({
          message: "您需要先登录才能操作",
          position: "center",
          duration: 3000,
        });
        this.$router.push(`/login`);
      } else {
        // this.$router.push(`/cart`);
        this.$toast({
          message: "添加成功,我在购物车等你哦~",
          position: "center",
          duration: 3000,
        });
        // this.load();
        // 点击之后，把当前商品的所有信息都搜集起来
        let goodsInfo = {
          lid: this.lid,
          cname: this.cname,
          title: this.title,
          price: this.price,
          spec: this.spec,
          img: this.img,
          addCount: this.count,
        };
        // 调用store中的mutations来将商品加入购物车
        this.$store.commit("addTocar", goodsInfo);
        // this.load();
        console.log(goodsInfo);
      }
    },
    // 点击购物车跳转到购物车页面
    tocart() {
    //   this.$router.push(`/cart`);
    if (!this.$store.state.isLogin) {
        this.$toast({
          message: "您需要先登录才能操作",
          position: "center",
          duration: 3000,
        });
        this.$router.push(`/login`);
      } else {
        this.$router.push(`/cart`);
        // this.load();
        // 点击之后，把当前商品的所有信息都搜集起来
        let goodsInfo = {
          lid: this.lid,
          cname: this.cname,
          title: this.title,
          price: this.price,
          spec: this.spec,
          img: this.img,
          addCount: this.count,
        };
        // 调用store中的mutations来将商品加入购物车
        this.$store.commit("addTocar", goodsInfo);
        // this.load();
        console.log(goodsInfo);
      }
    },
    // 点击商品详情，就隐藏商品点评
    showimg() {
      this.isShow = true;
      this.isComment = false;
    },
    // 点击商品点评，就隐藏商品详情
    showComment() {
      this.isShow = false;
      this.isComment = true;
    },
  },
  mounted() {
    this.detail();
  },
  // created(){
  //      this.detail();
  // }
};
</script>

<style scoped>
.cakebig{
  width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
}
.detail {
  width: 100%;
  padding-top: 3.45rem;
  padding-bottom: 3.45rem;

  width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
}
.lunboimg {
  width: 100%;
}
.priceout {
  width: 100%;
}
.price {
  width: 98%;
  padding: 0.8rem 0.7rem;
  border-bottom: 1px solid #ddd;
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 auto;
}

.reserve {
  font-size: 0.5rem;
  color: #999;
  width: 100%;
  overflow: hidden;
  /* border-bottom: 1px solid #ddd; */
}
.reserve div,
.taste div {
  width: 98%;
  border-bottom: 1px solid #ddd;
  margin: 0 auto;
  padding: 0.4rem 0;
  overflow: hidden;
}
.reserve ul li {
  float: left;
  padding: 0.1rem 1rem;
}
.reserve ul li img,
.taste div img {
  width: 1rem;
}
.taste div,
.warning,
.jianjie {
  font-size: 0.5rem;
  color: #000;
  padding: 0.6rem 1rem;
}
.taste div span {
  border: 1px solid #ddd;
  border-radius: 10px;
  float: left;
}
.taste div span pre,
.pre {
  margin: 0;
  padding: 0.3rem;
}
.taste div img {
  float: left;
  margin-right: 0.5rem;
}
.warning {
  width: 98%;
  border-bottom: 1px solid #ddd;
  margin: 0 auto;
}
.warningimg {
  width: 30px;
  float: left;
}
.pre,
.jjen {
  font-size: 0.5rem;
  color: #999;
}
.sales {
  width: 100%;
  border-bottom: 1px solid #ddd;
  overflow: hidden;
  padding: 1rem 0;
}
.salesin {
  padding: 0.3rem;
  width: 98%;
  font-size: 0.5rem;
  color: #999;
}
.salesspan {
  border: 1px solid #f00;
  border-radius: 1rem;
  padding: 0 0.5rem;
  color: #f00;
}
.sales1,
.sales2,
.sales3 {
  float: left;
  padding: 0 0.5rem;
}
.sales2 div {
  padding: 0.2rem 0;
}
a {
  color: #999;
}
.information {
  width: 98%;
  padding: 1rem 3rem 0rem 3rem;
  margin: 0 auto;
  border-bottom: 1px solid #ddd;
  /* overflow: hidden; */
}
.information ul {
  display: flex;
}
.information ul > li {
  flex: 1;
  text-align: center;
}
.informationdiv {
  font-size: 1.2rem;
  color: #888;
}
.informationdiv:hover {
  color: #000;
  border-bottom: 2px solid #ffe32a;
}
.kind,
.detailsimg {
  width: 98%;
  padding: 0.6rem 0.3rem;
  margin: 0 auto;
}
.kind div {
  font-size: 0.5rem;
  color: #999;
}
.detailsimg img {
  width: 100%;
  margin: 0 auto;
}
.Comment {
  width: 98%;
  border-bottom: 1px solid #ddd;
  height: 15rem;
  margin: 0 auto;
  padding: 5rem 0;
  text-align: center;
  color: #999;
}

.van-goods-action {
  background-color: rgba(0, 0, 0, 0);
  margin-bottom: -0.33rem;
}
</style>
