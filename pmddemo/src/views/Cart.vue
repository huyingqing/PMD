<template>
  <div>
    <my-dheader></my-dheader>
    <!-- <div class="shopcarts" v-for="(item,k) of this.$store.state.car" :key="k"> -->
    <div class="cart_outdiv" v-if="this.$store.state.car.length > 0">
      <!-- 第一排优惠券 -->
      <div>
        <div class="Coupons">
          <span>赠券</span>
          <span>已满足条件，订单完成可获赠优惠券</span>
          <span><a href="">已参加 &gt;</a></span>
        </div>
        <!-- 加入到购物车的物品 -->
        <!-- 换购券 -->
        <div class="Exchange">
          <span>换购</span>
          <span>已满足换购条件，可换购优惠商品</span>
          <span><a href="">去换购 &gt;</a></span>
        </div>
      </div>
      <!-- 加入到购物车的商品 -->
      <div
        class="shopcarts "
        v-for="(item, k) of this.$store.state.car"
        :key="k"
      >
        <!-- 单选按钮开始 -->
        <div>
          <input
            type="checkbox"
            @click="selectSingle(k)"
            :checked="allSelectedGoods.indexOf(item.lid) >= 0"
          />
        </div>
        <!-- 单选按钮结束 -->
        <van-swipe-cell>
          <a :href="`/details/${item.lid}`">
            <van-card
              :num="item.addCount"
              :price="item.price.toFixed(2)"
              :desc="item.title"
              :title="item.cname"
              class="goods-card"
              :thumb="item.img"
          /></a>
          <!-- 点击编辑 -->
          <!-- <span class="cartspanimg"><img @click="cartadd" class="cartimg"  src="../assets/img/home/cart/edit.png" alt=""></span> -->
          <!-- 第二行选择数量开始 -->
          <div class="addcount_pp">
            <div class="addcountp_p">数量选择</div>
            <div class="addcount_button ">
              <button :data-i="k" @click="btnadd($event, item)">+</button>
              <input readonly :value="item.addCount" />
              <button :data-i="k" @click="btnminus($event, item)">-</button>
            </div>
          </div>
          <!-- 第二行选择数量结束 -->
          <!-- <span> </span> -->
          <template #right>
            <van-button
              @click="remove(item)"
              square
              text="删除"
              type="danger"
              class="delete-button"
            />
          </template>
        </van-swipe-cell>
        <!-- 点击显示加数量 -->
        <!-- <van-overlay v-show="show" @click="show = true"> -->
        <!-- <div class="wrapper" @click.stop> -->
        <!-- <div class="block" v-show="show"> -->
        <!-- 第一行开始 -->
        <!-- <div class="addcount_one">
                        <span><a :href="`/details/${item.lid}`"><img :src="item.img" alt=""></a></span>
                        <div class="addcount_p">
                            <p>{{item.cname}}</p>
                            <p>{{item.title}}</p>
                            <p>¥{{(item.price).toFixed(2)}}</p>
                        </div>
                    </div> -->
        <!-- 第一行结束 -->
        <!-- 第二行选择数量开始 -->
        <!-- <div class="addcount_pp">
                        <div class="addcountp_p">数量选择</div>
                        <div class="addcount_button ">
                            <button :data-i="k" @click="btnadd($event,item)"> + </button>
                            <input  readonly :value="item.addCount">
                            <button :data-i="k" @click="btnminus($event,item)"> - </button>
                        </div>
                    </div> -->
        <!-- 第二行选择数量结束 -->
        <!-- 点击确定开始 -->
        <!-- <div class="cart_button"> -->
        <!-- <button @click="cancel()">取消</button> -->
        <!-- <div>
                            <button @click="sure(item)">确定</button>
                        </div> -->
        <!-- </div> -->
        <!-- 点击确定结束 -->
        <!-- </div> -->
        <!-- </div> -->
        <!-- </van-overlay>-->
      </div>
      <!-- 购物车循环结束 -->
      <!-- 再去逛逛开始 -->
      <div class="go"><a href="/">东西太少了，点我再去逛逛~</a></div>
      <!-- 再去逛逛结束 -->
    </div>
    <!-- 如果购物车为空显示的页面 -->
    <div class="cartemperty cart_outdiv" v-else>
      <a href="/"><img src="../assets/img/home/cart/1597905785.png" alt=""/></a>
    </div>
    <!-- <div> {{total1}}</div> -->
    <!-- 结算 -->

    <van-submit-bar
      :price="totalPrice"
      button-text="提交订单"
      @submit="onSubmit"
    >
      <div class="submit" v-show="!this.$store.state.car.length == 0">
        <div>
          <input
            class="input"
            type="checkbox"
            @click="selectAll()"
            :checked="
              this.$store.state.car.length === allSelectedGoods.length &&
                this.$store.state.car.length
            "
          />
          <span>全选</span>
        </div>
      </div>
    </van-submit-bar>

    <!-- </div> -->
  </div>
</template>

<script>
// 引入底部
import { Dialog } from "vant";
// Dialog({ message: '' });
export default {
  data() {
    return {
      //声明数组保存配件数组对象
      peijian: [],
      // 声明变量保存数量
      n: 0,
      // 声明变量储存加入购物车的产品信息
      goodsInfo: "",
      //  total1:0
      isshow: false,
      show: false,
      // value:1,
      // isEmperty:fasle,
      //控制全选
      allChecked: true,
      //存放被选择的数据
      allSelectedGoods: [],
    };
  },
  methods: {
    // 删除购物车
    remove(i) {
      Dialog.confirm({
        title: "删除",
        message: "您确定要删除该商品吗？",
      })
        .then(() => {
          this.$store.state.car = this.$store.state.car.filter((item) => {
            return i != item;
          });
          //    console.log(this.$store.state.car)
          localStorage.setItem("car", JSON.stringify(this.$store.state.car));
        })
        .catch(() => {
          // on cancel
        });
    },

    // 点击减号，数量-1
    btnminus(e, item) {
      console.log(e.target);
      if (item.addCount > 1) {
        item.addCount--;
        // 将变量后的值赋给缓存中的addCount
        this.$store.state.car[e.target.dataset.i].addCount = item.addCount;
        console.log(this.$store.state.car);
        // 得到最新的对象，把对象解析为json字符串，然后保存到本地缓存
        let shopcar = JSON.stringify(this.$store.state.car);
        localStorage.setItem("car", shopcar);
        // 将移除对象后的新数组赋值给store里面缓存的car数组
        this.$store.state.car = this.$store.state.car;
      }
    },
    //点击加号，数量+1
    btnadd(e, item) {
      item.addCount++;
      // 将变量后的值赋给缓存中的addCount
      this.$store.state.car[e.target.dataset.i].addCount = item.addCount;
      console.log(this.$store.state.car);
      // 得到最新的对象，把对象解析为json字符串，然后保存到本地缓存
      let shopcar = JSON.stringify(this.$store.state.car);
      localStorage.setItem("car", shopcar);
      // 将移除对象后的新数组赋值给store里面缓存的car数组
      this.$store.state.car = this.$store.state.car;
    },
    sure(item) {
      // this.$store.state.car.addCount=item.addCount;
      this.show = false;
    },

    onSubmit() {
      // 接收返回值
      // this.total1 = this.total()
    },
    cartadd() {
      this.show = true;
    },
    //点击单选按钮
    selectSingle(k) {
      if (event.currentTarget.checked) {
        this.allSelectedGoods.push(this.$store.state.car[k].lid);
      } else {
        for (var i = 0; i < this.allSelectedGoods.length; i++) {
          if (this.$store.state.car[k].lid === this.allSelectedGoods[i]) {
            this.allSelectedGoods.splice(i, 1);
            this.allChecked = false;
            break;
          }
        }
      }
      console.log(this.allSelectedGoods);
    },
    //点击全选按钮
    selectAll() {
      //event.currentTarget.checked表示点击完后该选择框的状态
      if (!event.currentTarget.checked) {
        this.allSelectedGoods = [];
      } else {
        this.allSelectedGoods = []; //先置空，然后再重新添加，不然数组里会有重复！因为有可能点击全选之前已经选择了几个单选按钮。也就是数组里已经添加过了对应的id。
        this.$store.state.car.forEach((v, k) => {
          this.allSelectedGoods.push(v.lid);
        });
      }
      console.log(this.allSelectedGoods);
    },
  },
  watch: {},
  mounted() {
    // 监听submit总价
    this.onSubmit();
  },
  // 计算属性
  computed: {
    // total() {
    //   let sum = 0;
    //   for (var i of this.$store.state.car) {
    //     sum += i.price * i.addCount * 100;
    //   }
    //   return sum;
    // },
    //totalPrice计算总价
    totalPrice() {
      var totalprice = 0;
      //加入选择框以后的计算总价
      this.$store.state.car.forEach((v, k) => {
        if (this.allSelectedGoods.indexOf(v.lid) !== -1) {
          totalprice += v.price * v.addCount * 100;
        }
      });
      return totalprice;
    },
  },
};
</script>

<style scoped>
.cart_outdiv {
  width: 95%;
  padding-top: 3.45rem;
  margin: 0 auto;
  position: relative;
  padding-bottom: 3.45rem;

   /* width: 100%;   */
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
}
/* 第一个优惠券样式 */ /* 换购的样式 */
.Coupons {
  padding: 0.8rem 0rem;
}
.Exchange {
  padding-bottom: 1rem;
}
.Coupons span,
.Exchange span {
  line-height: 0.46rem;
  font-size: 0.75rem;
  /* padding: 2rem 0rem; */
}
.Coupons span:first-child,
.Exchange span:first-child {
  border: 1px solid #f00;
  border-radius: 3rem;
  padding: 0.1rem 0.5rem;
  color: #fff;
  background-color: #f00;
}
.Coupons span:nth-child(2),
.Exchange span:nth-child(2) {
  color: #888;
  padding-left: 1.2rem;
}
.Coupons span:last-child,
.Exchange span:last-child {
  text-align: right;
  line-height: 0.46rem;
  font-weight: 700;
  padding-left: 1.5rem;
}
span a {
  color: #f0250f;
}
.shopcarts {
  width: 100%;
  /* height: 7rem; */
  overflow: hidden;
  margin: 0 auto;
  position: relative;
}
.goods-card {
  margin: 0;
  background-color: white;
}
.delete-button {
  height: 100%;
}
van-swipe-cell {
  position: relative;
}
.cartspanimg {
  width: 50%;
  display: inline-block;
  width: 1rem;
  position: fixed;
  z-index: 100;
  top: 5px;
  right: 15px;
}
.cartimg {
  width: 100%;
}
.addcount {
  width: 100%;
}
.wrapper {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  position: fixed;
  z-index: 100;
  background-color: rgba(0, 0, 0, 0.3);
}

.block {
  width: 85%;
  /* padding: 2rem 0; */
  /* height: 50%; */
  background-color: #fff;
}
.addcount_one {
  width: 100%;
  margin: 0 auto;
  padding: 1.5rem 0.5rem;
  border-bottom: 1px solid #ddd;
  overflow: hidden;
}
.addcount_one img {
  width: 30%;
  border-radius: 0.5rem;
  float: left;
}
.addcount_one div,
.addcount_pp div:first-child {
  float: left;
  overflow: hidden;
}
p {
  margin-bottom: 0rem !important;
  padding-bottom: 0.5rem;
  margin: 0 auto;
}
.addcount_p,
.addcountp_p {
  font-size: 0.4rem;
  /* float: left; */
  padding-left: 1rem;
  padding-top: 3%;
}
.addcount_p p:nth-child(2),
.addcountp_p {
  color: #888;
}
.addcount_pp div:first-child {
  padding: 1rem 0.5rem;
}
.van-stepper button,
.van-stepper input {
  float: right;
  padding-left: 2rem !important;
  overflow: hidden;
}
.addcount_pp {
  overflow: hidden;
  padding: 0.5rem 0;
}
.cart_button {
  width: 100%;
  margin: 0 auto;
  overflow: hidden;
}
.cart_button div {
  width: 50%;
  margin: 0 auto;
  padding-bottom: 0.5rem;
}
.cart_button button {
  width: 100%;
  height: 2.5rem;
  border: none;
  margin: 0 auto;
}
/* .cart_button button:first-child{
    background: #888;
    color: #fff;
} */
.cart_button button:first-child {
  background: #ffe32a;
  border-radius: 3rem;
}
.addcount_button {
  overflow: hidden;
  padding: 0.8rem 1rem;
}
.addcount_button input {
  width: 1.5rem;
  text-align: center;
  border: none;
}
.addcount_button button {
  background-color: #ffe32a;
  border: 0;
  border-radius: 20%;
  color: #000;
}
.addcount_button button,
.addcount_button input {
  float: right;
}
.cartemperty {
  width: 100%;
  padding-top: 3.4rem;
  margin: 0 auto;
}
.cartemperty img {
  width: 100%;
}
input[type="checkbox"],
input[type="radio"] {
  border-radius: 50%;
}
.go {
  text-align: center;
  padding: 2rem 0;
}
.go > a {
  color: #888;
  font-size: 0.8rem;
}
</style>
