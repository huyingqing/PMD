<template>

  <div class="addr">
    <my-header></my-header>
    <div class="addr_out">
      <!-- 图片 -->
      <div class="addr_out_img">
        <img src="../assets/img/home/header/1598263611(1).jpg" alt="" />
        <div class="addr_size">
          请选择您选择的城市
        </div>
      </div>
      <!-- 选择的城市 -->
      <div class="addr_country" v-for="(item, k) of addr" :key="k">
        <a @click="addresser(item)">
          <pre><span>{{item.address}}</span>     <span>{{item.addren}}</span>    <span>&gt;</span></pre>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
export default {
  data() {
    return {
      // 保存地址的数组
      addr: [],
      address: [],
    };
  },
  methods: {
    ...mapMutations(["setaddress"]),
    // 点击地址显示
    addresser(item) {
      this.setaddress(item.address);
      //console.log(item.address);
      this.$router.push("/");
      //localStorage.setItem('address',res.data.results[0].address);
    },
  },
  mounted() {
    // 监听地址
    this.axios.get("/addr").then((res) => {
      this.addr = res.data.results;
      console.log(this.addr);
    });
  },
};
</script>

<style scoped>
.addr {
  background-color: #d5e1eb;
  height: 100vh;
  width: 100%;  
 
}
.addr_out {
  width: 100%;
  padding-top: 3.45rem;
   margin: 0 auto;
  min-width:568 ;
  max-width: 736px;

}
.addr_out_img {
  width: 100%;
  padding-top: 3rem;
  margin: 0 auto;
  text-align: center;
  margin-bottom: 4rem;
}
.addr_out img {
  border-radius: 50%;
}
.addr_size {
  /* padding-top: 1rem; */
  margin-top: 1rem;
  font-size: 0.5rem;
  color: #fff;
}
pre {
  line-height: 3rem;
  margin: 0;
  text-align: center;
  font-size: 1.2rem;
  font-weight: 500;
  color: #423d3a;
}
.addr_country {
  width: 80%;
  height: 3rem;
  margin: 0 auto;
  background-color: #fff;
  margin-bottom: 1rem;
  border-radius: 3rem;
}
.addr_country:hover {
  background-color: #ffcd21;
}
a:hover {
  text-decoration: none;
}
</style>
