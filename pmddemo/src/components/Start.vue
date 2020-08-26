<template>
  <div class="start" v-once v-if="isshow">
    <div>
      <div class="stardiv">
        <img src="../assets/img/new-user-popup.png" alt="" />
        <div class="span">
          <span @click="noshow">x</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isshow: true,
    };
  },
  methods: {
    noshow() {
      this.isshow = false;
    },
  },
};
</script>

<style scoped>
.start {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 2002;
  overflow: hidden;
}
.stardiv {
  width: 70%;
  height: 100%;
  margin: 12rem auto;
  object-fit: cover;
  position: relative;
}
.start div img {
  display: block;
  width: 100%;
  border-radius: 20px;
  margin: 0 auto;
}
.span {
  display: inline-block;
  font-size: 1.5rem;
  /* margin-top: -17rem ; */
  margin-left: 250px;
}
.span span {
  position: absolute;
  top: 0px;
  right: 10px;
}
</style>
