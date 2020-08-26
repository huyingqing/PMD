//引入Express模块
const express = require('express');

//引入body-parser模块
const bodyParser = require('body-parser');

//引入CORS模块
const cors = require('cors');

//引入MySQL模块
const mysql = require('mysql');


//创建MySQL连接池
const pool = mysql.createPool({
    //数据库服务器地址
    host:'127.0.0.1',
    //数据库用户名
    user:'root',
    //数据库用户密码
    password:'',
    //数据库服务器端口号
    port:3306,
    //数据库名称
    database:'pmdcake',
    //编码方式
    charset:'utf8',
    //连接限制
    connectionLimit:15
});

//创建Express实例
const server = express();

//将CORS作为Server的中间件使用
server.use(cors({
  origin:['http://127.0.0.1:8080','http://localhost:8080']
}));
// 托管静态资源
server.use(express.static('public'))

//将bodyParser作为server中间件使用
server.use(bodyParser.urlencoded({
    extended:false
}));

//请求拿到轮播图数据
server.get('/lunbo',(req,res)=>{
    // console.log('ok')
    let sql='select cid,img from cakecarousel';
    pool.query(sql,(err,results)=>{
        if(err) throw err;
        // console.log(results);
        res.send({massage:'找到轮播',code:1,results:results})
    })
})

// 拿到首页商品列表和蛋糕列表的信息
server.get('/list',(req,res)=>{
    let sql="select lid,img,cname,tastesort,sencesort,title,price from list";
    pool.query(sql,(err,results)=>{
        if(err) throw err;
        res.send({massage:'这是首页商品列表',code:1,results:results});
        // console.log(results)
    });
})

// // 拿到饼干列表的信息(作废)
// server.get('/cracker',(req,res)=>{
//     let sql="select * from cracker";
//     pool.query(sql,(err,results)=>{
//         if(err) throw err;
//         res.send({massage:'这是饼干列表',code:1,results:results});
//         console.log(results)
//     })
// })


// 拿到蛋糕列表中的轮播图
server.get('/details',(req,res)=>{
    console.log(req)
    // 声明变量，保存传递解析过来的lid
    let lid=req.query.lid;
    sql='select * from list where lid=?';
    pool.query(sql,[lid],(err,results)=>{
        if(err) throw err;
        res.send({massage:"这是详情页",code:1,results:results[0]})
        // console.log(results)
    })
})

// 拿到口味的分类
server.get('/listtaste',(req,res)=>{
	// console.log("ok")
	let sql="select sort,taste from protaste";
	pool.query(sql,(err,results)=>{
		if(err) throw err
		// res.send(results)
		res.send({message:'查询成功',code:1,results:results});
	})
});

// 拿到场景的分类
server.get('/listscene',(req,res)=>{
	// console.log("ok")
	let sql="select sort,scene from scene";
	pool.query(sql,(err,results)=>{
		if(err) throw err
		// res.send(results)
		res.send({message:'查询成功',code:1,results:results});
	})
});

// 根据口味分类获取商品信息
server.get('/cake',(req,res)=>{
    // 获取客户端地址栏参数
    let sort=req.query.sort;
    let sql="select * from list where tastesort=?";
    pool.query(sql,[sort],(err,results)=>{
        if (err) throw err;
        res.send({message:'查询成功',code:1,results:results})
    });
});

// 根据场景分类获取商品信息
server.get('/caker',(req,res)=>{
    // 获取客户端地址栏参数
    let sort=req.query.sort;
    let sql="select * from list where sencesort=?";
    pool.query(sql,[sort],(err,results)=>{
        if (err) throw err;
        res.send({message:'查询成功',code:1,results:results})
    });
})

//用户登录的接口post请求
server.post('/login',(req,res)=>{
	//声明变量保存用户输入的值
	let username=req.body.username;
	let password=req.body.password;
	//保存查询语句
	let sql="select uid,uname,upwd from users where uname=? and upwd=?";
	pool.query(sql,[username,password],(err,results)=>{
		if(err) throw err;
		console.log(results)
		if(results.length==0){
			res.send({message:'登录名或密码错误',code:0})
		}else{
			res.send({message:'登录成功',code:1,results:results[0]})
			}
	})
});


//用户注册的接口post请求
server.post('/register',(req,res)=>{
    //获取用户提交的用户名等信息
    let username = req.body.username;
    //以用户名为条件进行查找操作,如果用户存在,则产生合法的错误信息
    //如果用户不存在,则将用户的相关信息写入数据表 -- xzqa_author  
    let sql = 'SELECT COUNT(uid) AS count FROM users WHERE uname=?';
    pool.query(sql,[username],(err,results)=>{
        if(err) throw err;       
        if(results.count==0){
            res.send({message:'注册失败',code:0});
            console.log(results)
        } else {
            //获取密码信息
            let password = req.body.password;            
            //完成数据写入操作
            let sql = 'INSERT INTO users (uname,upwd) VALUES(?,?)';
            pool.query(sql,[username,password],(err,results)=>{
                if(err) throw err;
                res.send({message:'注册成功',code:1});
            });
        }
    })
});


// 请求配送地址
server.get('/addr',(req,res)=>{
    let sql='select address,addren from address';
    pool.query(sql,(err,results)=>{
        if(err) throw err;
        res.send({message:'查询成功',code:1,results:results})
    });
});

// 模糊关键字查询
server.get('/searchkey',(req,res)=>{
    // 声明变量保存用户输入的关键字
    let kw=req.query.kw;
    console.log(kw);
    // 使用迷糊查询，查询商品的名字
    let sql="select * from list where cname like '%" +kw+"%'";
    pool.query(sql,[kw],(err,results)=>{
        if(err) throw err;
        // 判断有无获取到的数组
        if(results.length>0){
            res.send({message:'查询成功',code:1,results:results})
        }else{
            res.send('0')
        }
    })
});

//指定服务器的监听端口号
server.listen(3005);