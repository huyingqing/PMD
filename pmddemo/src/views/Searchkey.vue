<template>
  <div>
    <!-- <my-dheader></my-dheader> -->
    <my-header></my-header>
    <div class="cakediv">
      <!-- 引入回到顶部 -->
      <my-scroll></my-scroll>
      <!-- 第一个列表 -->
      <div class="listdiv">
        <div v-if="!this.searchs==[]">
          <ul class="listul">
            <li v-for="(item, index) of searchs" :key="index" class="lidtflot">
              <a :href="`/details/${item.lid}`"
                ><img lazy-load class="listimg" v-lazy="searchs[index].img" alt=""
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
        <div class="searchelse" v-else>
          <p>抱歉~没有找到相关产品~</p>
          <p><a href="/search">重新搜索</a></p>
        </div>
      </div>
    </div>
    <my-footer></my-footer>
  </div>
</template>

<script>
export default {
  // 接收search传过来的参数kw
  props: ["kw"],
  data() {
    return {
      // 保存蛋糕列表的数组
      searchs: [],
    };
  },
  methods: {
    search() {
      this.kw = this.$route.params.kw;
      this.axios.get("/searchkey?kw=" + this.kw).then((res) => {
        this.searchs = res.data.results;
        console.log(this.searchs);
        // if(res.data.results.length!==0){
        //     this.$toast({
        //         message: "对不起没有找到相关产品",
        //         position: "center",
        //         duration: 3000,
        //       });
        // }
      });
    },
  },
  created() {
    this.kw = this.$route.params.kw;
    this.search();
  },
  // 监听
  watch: {
    $route() {
      this.kw = this.$route.params.kw;
      this.axios.get("/searchkey?kw=" + this.$route.params.kw).then((res) => {
        this.searchs = res.data.results;
        console.log(this.searchs);
      });
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
.searchelse{
    padding: 10rem 0;
    text-align: center;
}
.searchelse p{
    font-size: 1rem;
    color: #999;
}
</style>
