<template>
  <div>
    <my-dheader></my-dheader>
    <div class="login_div">
      <!-- 登录的页面 -->
      <table>
        <tr>
          <td class="title">手机验证码登录</td>
          <td class="title" @click="logintel">账号密码登录</td>
        </tr>
      </table>

      <table>
        <tr>
          <td colspan="2">
            <input
              class="telinput"
              type="tel"
              placeholder="请输入用户名或手机号码"
              maxlength="20"
              :state="userunamestate"
              v-model="username"
              @blur="checkusername()"
            />
          </td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td colspan="2">
            <input
              class="password_input"
              type="password"
              placeholder="请输入密码"
              :state="passwordstate"
              v-model="password"
              @blur="checkuserpassword()"
            />
          </td>
          <!-- <td></td> -->
        </tr>
        <!-- <tr>
                    <td>请输入验证码</td>
                    <td><button>点击发送验证码</button></td>
                </tr> -->
        <tr>
          <td colspan="2">
            <span><a href="/register">立即注册</a></span> |
            <span>忘记密码</span>
          </td>
          <!-- <td ></td> -->
        </tr>
        <tr>
          <td colspan="2"><span>其他登录方式</span></td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td colspan="2" class="imgright">
            <span
              ><img src="../assets/img/home/header/zhifubao.png" alt=""/></span
            ><span></span>
            <span><img src="../assets/img/home/header/weibo.png" alt=""/></span>
          </td>
          <!-- <td class="imgleft"></td> -->
        </tr>
        <tr>
          <td colspan="2"><button @click="login">立即登录</button></td>
          <!-- <td></td> -->
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 保存用户输入的用户名和密码
      username: "",
      password: "",
      // 保存用户名和密码状态
      userunamestate: "",
      passwordstate: "",
    };
  },
  methods: {
    // 点击显示账号密码登录
    logintel() {},
    // 正则校验输入的用户名格式
    checkusername() {
      let username = this.username;
      //校验用户名,用户名的规则为:字母、数字及下划线的组合,长度为6~12个字符
      let usernameRegExp = /^[0-9A-Za-z_]{6,20}$/;
      if (usernameRegExp.test(username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.usernameState = "error";
        this.$toast({
          message: "用户名格式不正确",
          position: "center",
          duration: 3000,
        });
        return false;
      }
    },
    // 正则校验输入的密码格式
    checkuserpassword() {
      let password = this.password;
      //校验密码,密码的规则为:字母、数字及下划线的组合,长度为8~20个字符
      let passwordRegExp = /^[0-9A-Za-z_]{6,20}$/;
      if (passwordRegExp.test(password)) {
        this.passwordState = "success";
        return true;
      } else {
        this.passwordState = "error";
        this.$toast({
          message: "密码格式不正确",
          position: "center",
          duration: 3000,
        });
        return false;
      }
    },
    // 登录验证数据库是否存在
    login() {
      if (this.checkusername() && this.checkuserpassword()) {
        //如果所有信息都为合法的信息,则进行提交;
        this.axios
          .post(
            "/login",
            "username=" + this.username + "&password=" + this.password
          )
          .then((res) => {
            if (res.data.code == 0) {
              // this.$messagebox("登录提示","对不起,用户名或密码错误");
              this.$toast({
                message: "用户名或密码错误",
                position: "center",
                duration: 3000,
              });
              return false;
            } else {
              // 将用户登录状态储存到webStorage中
              this.$store.commit("login_mutation", res.data.results);
              // 之所以要将用户的登录状态保存为true，是因为以防用户在登录之后刷新页面又出现登录的情况
              localStorage.setItem("isLogin", true);
              localStorage.setItem("uname", res.data.results.uname);
              this.$router.push("/");
            }
          });
      }
    },
  },
};
</script>

<style scoped>
.login_div {
  width: 98%;
  height: 100%;
  margin: 0 auto;
  /* border: 1px solid #999; */
  padding: 4rem 0rem;


  width: 100%;  
  margin: 0 auto;
  min-width:568 ;
  max-width: 736px;
}
table {
  width: 100%;
}
/* table tr{
    margin-bottom: 2rem;
} */
table td {
  /* border: 1px solid #999; */
  padding: 0.6rem 0.5rem;
  text-align: center;
}
table td input {
  width: 100%;
  height: 3rem;
  padding: 1.5rem 3rem;
  background-color: #7f7f7f;
}
table td button {
  width: 100%;
  height: 2.5rem;
  border: none;
  background-color: #ffe32a;
  border-radius: 0.3rem;
  color: #000;
}
.title {
  font-size: 1.0599rem;
  color: #7f7f7f;
  font-weight: 500;
}
.title:hover {
  color: #000;
}
.tdright {
  padding-left: 4rem;
  border-right: 1px solid #7f7f7f;
}
.tdleft {
  padding-right: 4rem;
}
td span,
span a {
  padding: 0 0.5rem;
  font-size: 0.8rem;
  color: #7f7f7f;
}
span a:hover {
  text-decoration: none;
  color: #000;
}
.telinput {
  background: url("../assets/img/home/header/tel.png") no-repeat left;
  background-size: 1.5rem;
  background-color: #eee;
  border: none;
  border-radius: 1rem;
  /* padding: 2rem 0; */
}
.password_input {
  background: url("../assets/img/home/header/suo.png") no-repeat left;
  background-size: 1.5rem;
  background-color: #eee;
  border-radius: 1rem;
  border: none;
}
</style>
