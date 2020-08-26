<template>
  <div>
    <my-header></my-header>
    <div class="cakediv">
      <!-- 引入回到顶部 -->
      <my-scroll></my-scroll>
      <!-- 第一个列表 -->
      <div class="listdiv">
        <ul class="listul">
          <li v-for="(item, index) of lists" :key="index" class="lidtflot">
            <a :href="`/details/${item.lid}`"
              ><img lazy-load class="listimg" v-lazy="item.img" alt=""
            /></a>
            <div>
              <span class="listspan">{{ item.cname }}</span>
            </div>
            <div>
              <span class="listtitle">{{ item.title }}</span>
            </div>
            <span class="listspan ">¥{{ item.price.toFixed(2) }}</span>
            <span class="listshopping"
              ><a :href="`/details/${item.lid}`"
                ><van-icon name="shopping-cart-o"
              /></a>
            </span>
          </li>
        </ul>
      </div>
    </div>
    <my-footer></my-footer>
  </div>
</template>

<script>
export default {
  props: ["sort"],
  data() {
    return {
      // sort:1,
      // 保存列表的数组
      lists: [],
    };
  },
  methods: {
    onload() {
      this.axios.get("/cake?sort=" + this.sort).then((res) => {
        this.lists = res.data.results;
        console.log(this.lists);
      });
    },
  },
  // 监听
  mounted() {
    this.onload();
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
.cakediv {
  width: 100%;
  padding-top: 50px;
  padding-bottom: 70px;
}
.listdiv {
  width: 100%;
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
  margin-top: -30px;
  margin-right: 4px;
}
a {
  color: #000;
}
</style>
