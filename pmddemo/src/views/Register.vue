<template>
  <div>
    <my-dheader></my-dheader>
    <div class="login_div">
      <!-- 注册的页面 -->
      <table>
        <tr>
          <td colspan="2">
            <input
              class="telinput"
              type="tel"
              placeholder="手机号码"
              maxlength="20"
              v-model="pusername"
              :state="puserunamestate"
              @blur="checkUsername()"
              :disabled="isAgree !== true"
            />
          </td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td colspan="2">
            <input
              class="password_input"
              type="password"
              placeholder="设置密码"
              v-model="ppassword"
              :state="ppasswordState"
              @blur="checkPassword()"
              :disabled="isAgree !== true"
            />
          </td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td colspan="2" class="tr_td_p">
            <p class="td_p">
              密码长度为8～20个字符，同时包含大小写字母、数字和特殊字符
            </p>
          </td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td colspan="2">
            <input
              class="password_input"
              type="password"
              placeholder="确认密码"
              v-model="ppassword2"
              :state="ppassword2State"
              @blur="checkConPassword()"
              :disabled="isAgree !== true"
            />
          </td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td
            colspan="2"
            class=" zhucetd yiyouzhanghao tdinput "
            @click="agree()"
          >
            <span class="borderr" style="margin-top:-4px" v-if="istongyi"></span
            ><span v-else class="borderr2" style="margin-top:-4px"></span>
            《MCAKE购物协议》
          </td>
          <!-- <td class=""></td> -->
        </tr>
        <tr>
          <td colspan="2" class="td_p">
            <a href="/login">已有账号，立即登录</a>
          </td>
          <!-- <td></td> -->
        </tr>
        <tr>
          <td colspan="2"><button @click="register">立即注册</button></td>
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
      //保存用户注册的用户名
      pusername: "",
      //保存用户注册的密码
      ppassword: "",
      //保存用户注册名状态
      puserunamestate: "",
      //保存用户注册密码状态
      ppasswordState: "",
      //保存确认密码
      ppassword2: "",
      //保存确认密码的状态
      ppassword2State: "",
      // 点击同意才可以填写
      isAgree: false,
      istongyi: true,
    };
  },
  methods: {
    // 点击同意协议后才能操作
    agree() {
      if (this.isAgree == false) {
        this.isAgree = true;
        this.istongyi = false;
      } else if (this.isAgree == true) {
        this.isAgree = false;
        this.istongyi = true;
      }
    },
    // 如果有账号，点击跳转

    // 点击显示账号密码登录
    logintel() {},
    // 注册名格式验证
    checkUsername() {
      let username = this.pusername;
      //校验用户名,用户名的规则为:字母、数字及下划线的组合,长度为6~12个字符
      let usernameRegExp = /^[0-9A-Za-z_]{6,12}$/;
      if (usernameRegExp.test(username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.puserunamestate = "error";
        this.$toast({
          message: "用户名格式不正确，请设为6～20个字符",
          position: "center",
          duration: 3000,
        });
        return false;
      }
    },
    // 注册密码格式验证
    checkPassword() {
      let password = this.ppassword;
      //校验密码,密码的规则为:字母、数字及下划线的组合,长度为8~20个字符
      let passwordRegExp = /^[0-9A-Za-z_]{6,20}$/;
      if (passwordRegExp.test(password)) {
        this.passwordState = "success";
        return true;
      } else {
        this.ppasswordState = "error";
        this.$toast({
          message: "请输入合法密码",
          position: "center",
          duration: 3000,
        });
        return false;
      }
    },
    // 注册确认密码格式验证
    checkConPassword() {
      let password2 = this.ppassword2;
      if (password2 == this.ppassword) {
        this.ppassword2State = "success";
        return true;
      } else {
        this.ppassword2State = "error";
        this.$toast({
          message: "设置密码不一致，请重新输入",
          position: "center",
          duration: 3000,
        });
        return false;
      }
    },
    // 全部验证成功后点击注册
    register() {
      if (
        this.checkUsername() &&
        this.checkPassword() &&
        this.checkConPassword()
      ) {
        //如果所有信息都为合法的信息,则进行提交;
        //post提交写法，get写法：/register/uname=?&upwd=?
        this.axios
          .post(
            "/register",
            "username=" + this.pusername + "&password=" + this.ppassword
          )
          .then((res) => {
            //res才是服务器返回的信息
            if (res.data.code == 0) {
              //注册失败
              //   this.$messagebox("注册提示","对不起,用户已存在");
              this.$toast({
                message: `对不起,用户名已存在`,
                position: "center",
                duration: 3000,
              });
              return false;
            } else {
              //注册成功
              //   this.$router.push('/product');
              this.$toast({
                message: `注册成功`,
                position: "center",
                duration: 3000,
              });
              return false;
              //   this.headeblock()
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
.td_p {
  font-size: 0.1rem;
  color: #7f7f7f;
  margin-bottom: 0rem !important;
}
.tr_td_p {
  padding: 0;
}
.borderr,
.borderr2 {
  cursor: pointer;
  display: inline-block;
  width: 20px;
  height: 20px;
  border: 2px solid #ffe32a;
  border-radius: 50%;
  margin-right: -4px;
  text-align: center;
  vertical-align: middle;
}
.borderr2 {
  background-color: #ffe32a;
}
a {
  padding: 0 0.5rem;
  font-size: 0.8rem;
  color: #7f7f7f;
}
a:hover {
  text-decoration: none;
  color: #000;
}
</style>
