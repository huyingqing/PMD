<template>
  <div >
    <my-header></my-header>
    <div class="cakediv cakebig">
      <!-- 引入回到顶部 -->
      <my-scroll></my-scroll>
      <!-- 第一个列表 -->
      <div class="listdiv">
        <ul class="listul">
          <li v-for="(item, index) of cake" :key="index" class="lidtflot">
            <a :href="`/details/${item.lid}`"
              ><img lazy-load class="listimg" v-lazy="cake[index].img" alt=""
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
  data() {
    return {
      // 保存蛋糕列表的数组
      cake: [],
    };
  },
  methods: {},
  // 监听
  mounted() {
    this.axios.get("/list").then((res) => {
      this.cake = res.data.results.slice(0, 12);
      console.log(this.cake);
    });
  },
};
</script>

<style scoped>
.cakebig{
  width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
}
.cakediv {
  width: 100%;
  /* min-width:568 ;
  max-width: 736px; */
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
