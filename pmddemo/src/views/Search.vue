<template>
  <div>
    <my-header></my-header>
    <!-- 搜索框开始 -->
    <div class="search">
      <div class="search_div">
        <div class="search_input">
          <input v-model="kw" type="text" placeholder="请输入关键词" />
        </div>
        <!-- 搜索框结束 -->
        <div class="taste_ul">
          <ul>
            <li v-for="(item, index) of tastes" :key="index">
              <p>{{ item.taste }}</p>
            </li>
          </ul>
        </div>
        <!-- 搜索按钮 -->
        <div class="search_button">
            <button @click="search">搜索</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 保存口味的数组
      tastes: [],
      //   声明保存关键字
        kw:"",
    };
  },
  methods:{
      search(){
        //   清除左右两端的空格
          clearTimeout(this.timer);
        //   使用防抖在固定的时间内，只能请求一次
        this.timer=setTimeout(()=>{
            // 非空判断
            if(this.kw.trim()!==""){
                console.log(`查询${this.kw}内容`);
                this.$router.push('/searchkey/'+this.kw)
            }else{
              this.$toast({
                message: "请输入您要搜索的商品",
                position: "center",
                duration: 3000,
              });
            }
        },500);


      }
  },
  mounted() {
    // 请求口味
    this.axios.get("/listtaste").then((res) => {
      this.tastes = res.data.results;
      console.log(this.tastes);
    });
  },
};
</script>

<style scoped>
.search {
  width: 100%;
  height: 100vh;
  background-color: #f5f5f5;
}
.search_div {
  padding-top: 8rem;
  width: 100%;
  /* height: 100%; */
  background-color: #fff;
}
.search_input {
  text-align: center;
}
input {
  text-align: center;
  border: none;
  color: #666;
}
.taste_ul,
.taste_ul ul {
  width: 100%;
  display: flex;
  overflow: hidden;
  text-align: center;
  justify-content: center;
}
.taste_ul ul li {
  float: left;
  padding: 1rem 0.3rem;
}
p {
  font-size: 0.3rem;
  color: #999;
}
.search_button{
    width: 100%;
    text-align: center;
    margin-top: 2rem;
    padding-bottom: 2rem;
}
.search_button>button{
    width: 80%;
    height: 2.5rem;
    border: none;
    border-radius: 2rem;
    background-color: #ffe32a;
    
}
</style>
