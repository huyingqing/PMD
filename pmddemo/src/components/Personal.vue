<template>
  <!--点击更多的显示 -->
  <div >
    <!-- <my-dheader></my-dheader> -->
    <!-- 一排 -->
    <div class="personal" v-show="iscenter">
      <ul>
        <!-- 第一个 -->
        <li>
          <img src="../assets/img/home/header/header1.png" alt="" />
          <p><a href="/cake">最新活动</a></p>
        </li>
        <li @click="center">
          <img src="../assets/img/home/header/header2.png" alt="" />
          <p>个人中心</p>
        </li>
        <li>
          <img
            class="ownlogo"
            src="../assets/img/home/header/header3.jpg"
            alt=""
          />
          <p>关于我们</p>
        </li>
        <li>
          <img src="../assets/img/home/header/header4.png" alt="" />
          <p>配送范围</p>
        </li>
      </ul>
      <!-- 点击关闭 -->
      <div class="personal_div">
        <span @click="close" >点我关闭</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      iscenter: true,
    };
  },
  methods: {
    center() {
      this.$router.push("/center");
    },
    close() {
      if (this.iscenter == true) {
        this.iscenter = false;
      }
    },
  },
};
</script>

<style scoped>

.personal {
  width: 100%;
  height: 100%;
  /* overflow: hidden; */
  position: fixed;
  z-index: 500;
  background-color: rgba(0, 0, 0, 0.3);
 

  
  /* margin: 0 auto;
  /* min-width:568 ; */
  /* max-width: 736px; */ 
   
}
.personal ul {
  width: 100%;
  margin: 0 auto;
  overflow: hidden;
  background-color: #fafafa;
  display: flex;
  flex-direction: row;
  justify-content: center;
   padding-top: 3.5rem;
}
.personal ul li {
  width: 100%;
  border-left: 1px solid #ddd;
  padding: 1rem 0.85rem;
  margin-left: 0;
  text-align: center;
}
.personal ul li img {
  width: 35%;
}
p ,a{
  margin: 0;
  margin-top: 0.8rem;
  font-size: 0.5rem;
  color: #666;
}
.personal_div {
  display: block;
  margin-top: 12rem;
  margin-left: 40%;
}
a:hover{
    text-decoration: none;
}
.personal_div span{
  border:1px solid #ffe32a;
  border-radius: 1rem;
  background-color: #ffe32a;
  font-size: 0.5rem;
  padding: 0.5rem 1rem;
  color: #000;
}
</style>
