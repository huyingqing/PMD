#设置客户端连接服务器为utf-8
set names utf8;
#丢弃数据库pmdcake，如果存在
drop database if exists pmdcake;
#创建数据库pmdcake，设置储存编码为utf-8
create database pmdcake charset=utf8;
#进入数据库pmdcake
use pmdcake;
#创建首页数据列表

/*导航栏地址*/
CREATE TABLE address(
	aid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
	address varchar(64), #地址
	addren varchar(64) #英文地址
);

/*导航栏所有产品项*/
CREATE TABLE products(
	pid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
	products varchar(64) #所有蛋糕
);

/*蛋糕口味筛选*/
CREATE TABLE taste(
	tid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
	taste varchar(64) #口味
);

/*场景筛选*/
CREATE TABLE scene(
	tid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
  sort varchar(12) ,#分类
	scene varchar(64) #场景
);


/*用户信息*/
CREATE TABLE users(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),#用户名
  upwd VARCHAR(32),#密码
	user_name VARCHAR(32),#昵称
	gender INT, #性别  0-女  1-男
	birth VARCHAR(32),#生日
  email VARCHAR(64),#邮箱
  phone VARCHAR(16),#电话
  avatar VARCHAR(128)   #头像图片路径
);
/*首页轮播广告商品*/
CREATE TABLE cakecarousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64)
);
/*首页三排图片*/
CREATE TABLE threepictrue(
	tid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128)
);
/*首页本季推荐下的图片*/
CREATE TABLE bigpicture(
	tid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128)
);
/*商品列表头部口味*/
CREATE TABLE protaste(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  sort varchar(12) ,#分类
  taste VARCHAR(128)
);



-- /*小食详情*/
-- CREATE TABLE cracker(
--   lid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
-- 	cname varchar(120) ,#蛋糕名称
--   title varchar(120) ,#英文标题
--   price decimal(6,2), #价格
--   img varchar(128) #图片路径
-- );

/*配件*/
CREATE TABLE peijian(
  lid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
  img varchar(128),#配件1
  title varchar(120),#标题
  price decimal(6,2) #价格
);

/*蛋糕口味筛选*/
insert into taste values
(null,"拿破仑系列"),
(null,"奶油系列"),
(null,"莫斯系列"),
(null,"芝士系列"),
(null,"巧克力系列"),
(null,"咖啡系列"),
(null,"坚果系列"),
(null,"水果系列"),
(null,"冰淇淋系列");

/*导航栏地址*/
insert into address values
(null,"杭州市",'HangZhou'),
(null,"上海市",'ShangHai'),
(null,"苏州市",'SuZhou'),
(null,"北京市",'BeiJing');

/*导航栏所有产品项*/
insert into products values
(null,"所有蛋糕"),
(null,"所有小食"),
(null,"所有配件");



/*场景筛选*/
insert into scene values
(null,1,"生日"),
(null,2,"聚会"),
(null,3,"情侣"),
(null,4,"儿童"),
(null,5,"长辈"),
(null,6,"下午茶");

/*配件*/
insert into peijian values
(null,"http://localhost:3005/img/xaingqing/peijian/pj1.jpg","炫彩趣味礼包",39.90),
(null,"http://localhost:3005/img/xaingqing/peijian/pj2.jpg","缤纷欢乐礼包",29.90),
(null,"http://localhost:3005/img/xaingqing/peijian/pj3.jpg","生日牌",5.00),
(null,"http://localhost:3005/img/xaingqing/peijian/pj4.jpg","数字蜡烛",3.00);

/*蛋糕详情*/
CREATE TABLE list(
  lid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
  tastesort varchar(12) ,#蛋糕分类
  sencesort varchar(12) ,#饼干分类
	cname varchar(120) ,#蛋糕名称
  title varchar(120) ,#英文标题
  price decimal(6,2),#价格
  reserve varchar(64),#预定时间
  category varchar(64),#口味
  adetails varchar(64),#详情
  bdetails varchar(64),#详情
  cdetails varchar(64),#详情
  sweet varchar(64),#甜味
  tableware varchar(64),#标配餐具
  size varchar(64),#尺寸
  Storage varchar(64),#提示
  Sweight varchar(64),#分量
  shelfTime date,#上架时间
  img varchar(128),#图片路径
  swipers varchar(255),#详情轮播图片路径
  jianjie varchar(128),#简介
  jjen varchar(128),#简介
  spec  varchar(128),#规格
  flag varchar(255),#旗子
  image varchar(128),#详情图
  islndex bool #1>是,0>不是 是否为首页推荐
);


/*蛋糕详情插入数据*/
insert into list values
(null,1,1,"约瑟玫瑰","Joséphine",398.00,"提前5小时预定","奶油、水果","口味基底：Whipping Cream","口感：绵软细腻","口味：奶油/水果","甜味：2","标配餐具(免费)5份","SIZE:15cm*13cm(直径*高）","若不及时食用，请放置0-10℃冷藏","1.3磅(591g)适合2-3人食","2020-7-20","http://localhost:3005/img/detail/1/new.jpg","http://localhost:3005/img/detail/1/1.jpg,http://localhost:3005/img/detail/1/2.jpg,http://localhost:3005/img/detail/1/3.jpg,http://localhost:3005/img/detail/1/4.jpg","见证无数情侣最甜蜜的一刻，从舌尖蔓延到心间的感动，今生今世唯一爱恋","Des rosettes pour les amoureux, une histoire d’amour, une romance unique de toute la vie.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/1/wap.jpg",true),
(null,6,2,"爱之风物诗","Poème d'amour",218.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/2/new.jpg","http://localhost:3005/img/detail/2/1.jpg,http://localhost:3005/img/detail/2/2.jpg,http://localhost:3005/img/detail/2/3.jpg,http://localhost:3005/img/detail/2/4.jpg","柑橘夹心的酸甜，搭配龙舌兰酒冻微微的苦辣感，酝酿甜蜜的醉意。君度酒调和白巧克力慕斯，漾起袅袅橙香。以巧克力爆谷米点缀君度奶油，为口感找到平衡。由口及心的爱意简单纯粹，又丰富无比。","La douceur et l'aigreur d’agrumes, combinées à la légère amertume de la tequila, brasse une griserie. Cointreau et mousse au chocolat blanc ajoutent une touche d'orange. Décorez avec de la crème Cointreau avec du riz soufflé au chocolat pour trouver l'équilibre. L'amour de la bouche et du cœur est s","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/2/wap.jpg",true),
(null,4,3,"男友力","Charmes masculins",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/3/new.jpg","http://localhost:3005/img/detail/3/1.jpg,http://localhost:3005/img/detail/3/2.jpg,http://localhost:3005/img/detail/3/3.jpg,http://localhost:3005/img/detail/3/4.jpg","香缇奶油如爱人的晚安吻，带来一场甜蜜的梦。榛子巧克力薄脆酱是梦中的漫天星光，撒在戚风蛋糕坯做的夜空里。巧克力榛子碎与黄油薄脆，柔滑中点缀着香醇，焦糖奶油融化，满口甜蜜爆发，激荡起绵绵的幸福感，男生也拥有爱甜的权利。","La crème chantilly est comme le baiser de la bonne nuit d'un amoureux, apportant un rêve doux. Le pain croustillant au chocolat et noisettes sont des étoiles du rêve, Saupoudrez dans le ciel nocturne de Chiffon. Noisettes au chocolat hachées et beurre croustillant, doux et parfumé de moelleux.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/3/wap.jpg",true),
(null,1,4,"甜愿·生日蛋糕","Choco ~ Mariage",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/4/new.jpg","http://localhost:3005/img/detail/4/1.jpg,http://localhost:3005/img/detail/4/2.jpg,http://localhost:3005/img/detail/4/3.jpg,http://localhost:3005/img/detail/4/4.jpg","承袭比利时大师工艺，将源自比利时的可可豆缔造美味的巧克力风味； 当冰爽的冰淇淋与浓郁的巧克力蛋糕邂逅，冰火交融，香滑甜蜜。","Grâce aux maîtres chocolatiers Belge, les sauveurs du chocolat belge ont fait le tour du monde. Un mariage parfait entre le fraîcheur de la glace et du gâteau au chocolat.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/4/wap.jpg",true),
(null,5,5,"阳光心芒","Gâteau de mangue",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/5/new.jpg","http://localhost:3005/img/detail/5/1.jpg,http://localhost:3005/img/detail/5/2.jpg,http://localhost:3005/img/detail/5/3.jpg,http://localhost:3005/img/detail/5/4.jpg","芒果果肉是蛋糕上的一簇星芒，闪烁着金色的甜，直抵心的深处。萃取茉莉绿茶原叶，藏下茶意绵绵，如同将花田、茶乡植入慕斯夹心。穿过朦胧的茗香，世界清澈岁月甜。","La pulpe de mangue est une étoile sur le gâteau.Scintillant de douceur dorée, droit au fond de mon cœur.Extraire les feuilles du jasmin, en cachant le thé, Comme les champs de fleurs, de thé se sont planté au coeur d’un mousse. En passant à travers le parfum de thé, le monde est clair et doux.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/5/wap.jpg",true),
(null,1,6,"浓巧·迷情冰淇淋蛋糕","Gâteau au rose et litchi",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/6/new.jpg","http://localhost:3005/img/detail/6/1.jpg,http://localhost:3005/img/detail/6/2.jpg,http://localhost:3005/img/detail/6/3.jpg,http://localhost:3005/img/detail/6/4.jpg","白巧克力慕斯邂逅荔枝的温润，玫瑰夹心香气萦萦，气息香甜而不腻，万般柔情在口中渐渐晕开。那千回百转的粉红心事，也悄悄爬上了脸颊。","La chaleur de la mousse au chocolat blanc et du litchi, avec un parfum de la rose, l'arôme est doux mais pas gras, et la tendresse s'estompe progressivement en bouche. Des milliers de pensées remontaient également à la joue.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/6/wap.jpg",true),
(null,7,1,"胖达乐园","Choco ~ Mariage",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/7/new.jpg","http://localhost:3005/img/detail/7/1.jpg,http://localhost:3005/img/detail/7/2.jpg,http://localhost:3005/img/detail/7/3.jpg,http://localhost:3005/img/detail/7/4.jpg","这是法国白兰地的一次重生以另一种脱胎换骨的形式，加上比利时黑巧克力的爽滑借着时间的指针，在舌尖，在心间，画出微醺的轨迹","Cognac, un spititueux provenant de raisin. Fusioné aux chocolat noir du Bruxelle.Un gout inoubliable et enrichissant.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/7/wap.jpg",true),
(null,8,2,"尼诺 ","Lotus Noir",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/8/new.jpg","http://localhost:3005/img/detail/8/1.jpg,http://localhost:3005/img/detail/8/2.jpg,http://localhost:3005/img/detail/8/3.jpg,http://localhost:3005/img/detail/8/4.jpg","精选蓝莓的清爽可口/芝士的香浓/优质奶油的醇厚起酥皮的香脆可口/内层轻乳芝士的松软层层美味/回味无穷","Myrtilles fraiches, bio, feuilletage au goût de beurre frais, marmelade de myrtilles, crème chantilly, et tout celà dans le plaisir du palais .","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/8/wap.jpg",true),
(null,9,3,"安逸兔","lapin détendu",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/9/new.jpg","http://localhost:3005/img/detail/9/1.jpg,http://localhost:3005/img/detail/9/2.jpg,http://localhost:3005/img/detail/9/3.jpg,http://localhost:3005/img/detail/9/4.jpg","蓝莓酸奶清爽酸甜，提拉米苏的绵密中荡漾咖啡香气，抹茶清新，草莓香甜，芒果的鲜美里释放出热带风情，香草芬芳，芝士浓郁，在七色冰淇淋之花盛开的夏日，享受七种沁人心脾的幸运。","Le yogourt aux myrtilles est rafraîchissant et sucré, tiramisu dégage un arôme de café, le matcha est frais, la fraise est sucrée, la saveur de la mangue libère une atmosphère tropicale. lorsque les fleurs de la crème glacée à sept couleurs fleurissent, profitez de sept chants passionnants.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/9/wap.jpg",true),
(null,1,4,"黛西的旅行","Voyage de Daisy",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/10/new.jpg","http://localhost:3005/img/detail/10/1.jpg,http://localhost:3005/img/detail/10/2.jpg,http://localhost:3005/img/detail/10/3.jpg,http://localhost:3005/img/detail/10/4.jpg","甜鲜温润的椰子慕斯，包裹活力清爽的菠萝啫喱，层次分明地取悦味蕾。在新鲜的菠萝中加入木瓜、椰子、车厘子，炒制成独特的热带风情，果粒夹心让口感清晰，风味饱满。3只“圆滚滚”在胖达乐园里尽情嬉戏，萌趣横生，一起度过清爽甜蜜的夏日时光。","Mousse de noix de coco douce, enveloppée de gel d'ananas frais et rafraîchissant, ravissant les papilles en couche par chouche. Ajoutez de la papaye, de la noix de coco et des cerises à l'ananas frais pour créer un style tropical unique. Des pulpes de fruits rend le goût clair et plein de saveur. 3","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/10/wap.jpg",true),
(null,2,5,"Finn的蘑菇星球","La planète champignon",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/11/new.jpg","http://localhost:3005/img/detail/11/1.jpg,http://localhost:3005/img/detail/11/2.jpg,http://localhost:3005/img/detail/11/3.jpg,http://localhost:3005/img/detail/11/4.jpg","以戚风蛋糕坯为基质，以奥利奥奶油为支撑，蘑菇星球成了宇宙中柔软而香暖的存在。榛子巧克力薄脆酱浅浅铺了两层，口感变得立体，而藏匿其中的跳跳糖，是Finn在旅途中的奇遇。整个星球用柠檬甘纳许包裹，温润，绵密，适合长出童话故事来。","À base de Chiffon cake et de crème Oreo. Les biscuits au chocolat aux noisettes sont répartis en deux couches, et la texture devient tridimensionnelle. Et cacher les pop rocks dedans est l'aventure de Finn. La planète entière est enveloppée dans une ganache au citron, douce et dense.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/11/wap.jpg",true),
(null,3,6,"卢克和咚咚冰淇淋蛋糕","Luke et dondon",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3005/img/detail/12/new.jpg","http://localhost:3005/img/detail/12/1.jpg,http://localhost:3005/img/detail/12/2.jpg,http://localhost:3005/img/detail/12/3.jpg,http://localhost:3005/img/detail/12/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/detail/12/wap.jpg",true),
(null,5,1,'拿破仑黑糖棒棒','Biscuits au sucre brun','78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/1.jpg',"http://localhost:3005/img/biscuits/1/1.jpg,http://localhost:3005/img/biscuits/1/2.jpg,http://localhost:3005/img/biscuits/1/3.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/1/wap.jpg",true),
(null,5,2,'厚厚杏仁吐司','Toast aux amandes','48.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/2.jpg',"http://localhost:3005/img/biscuits/2/1.jpg,http://localhost:3005/img/biscuits/2/2.jpg,http://localhost:3005/img/biscuits/2/3.jpg,http://localhost:3005/img/biscuits/2/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/2/wap.jpg",true),
(null,5,3,'奶香金砖吐司','Toast brique d','48.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/3.jpg',"http://localhost:3005/img/biscuits/3/1.jpg,http://localhost:3005/img/biscuits/3/2.jpg,http://localhost:3005/img/biscuits/3/3.jpg,http://localhost:3005/img/biscuits/3/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/3/wap.jpg",true),
(null,1,4,'马克西姆柠檬果香绿茶','Thé vert au citron','58.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/5.jpg',"http://localhost:3005/img/biscuits/5/1.jpg,http://localhost:3005/img/biscuits/5/2.jpg,http://localhost:3005/img/biscuits/5/1.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/5/wap.jpg",true),
(null,3,5,'马克西姆橙味果香红茶',"Thé noir à l'orange'",'58.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/6.jpg',"http://localhost:3005/img/biscuits/4/1.jpg,http://localhost:3005/img/biscuits/4/2.jpg,http://localhost:3005/img/biscuits/4/1.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/4/wap.jpg",true),
(null,4,6,'巧克力麻糬奶酥软欧面包',"Pain mochi au chocolat",'12.80',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/7.jpg',"http://localhost:3005/img/biscuits/6/1.jpg,http://localhost:3005/img/biscuits/6/2.jpg,http://localhost:3005/img/biscuits/6/3.jpg,","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/6/wap.jpg",true),
(null,5,1,'萝拉小朵（原味）',"fleurette(original",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/8.jpg',"http://localhost:3005/img/biscuits/7/1.jpg,http://localhost:3005/img/biscuits/7/2.jpg,http://localhost:3005/img/biscuits/7/3.jpg,","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/7/wap.jpg",true),
(null,4,2,'萝拉小朵（巧克力味）',"fleurette( choc)",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/9.jpg',"http://localhost:3005/img/biscuits/8/1.jpg,http://localhost:3005/img/biscuits/8/2.jpg,http://localhost:3005/img/biscuits/8/1.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/8/wap.jpg",true),
(null,2,3,'萝拉小朵（抹茶味）',"fleurette(Motcha)",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/10.jpg',"http://localhost:3005/img/biscuits/9/1.jpg,http://localhost:3005/img/biscuits/9/2.jpg,http://localhost:3005/img/biscuits/9/3.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/9/wap.jpg",true),
(null,5,4,'半熟芝士（原味）',"fromage semi-fermenté original",'48.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/11.jpg',"http://localhost:3005/img/biscuits/10/1.jpg,http://localhost:3005/img/biscuits/10/2.jpg,http://localhost:3005/img/biscuits/10/3.jpg,http://localhost:3005/img/biscuits/10/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/10/wap.jpg",true),
(null,4,5,'半熟芝士（草莓味）',"fromage semi-fermenté (fraise)",'48.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/12.jpg',"http://localhost:3005/img/biscuits/11/1.jpg,http://localhost:3005/img/biscuits/11/2.jpg,http://localhost:3005/img/biscuits/11/3.jpg,http://localhost:3005/img/biscuits/11/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/12/wap.jpg",true),
(null,8,6,'1/4牛奶生巧',"1/4 chocolat au lait",'58.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/13.jpg',"http://localhost:3005/img/biscuits/12/1.jpg,http://localhost:3005/img/biscuits/12/2.jpg,http://localhost:3005/img/biscuits/12/3.jpg,http://localhost:3005/img/biscuits/12/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/12/wap.jpg",true),
(null,3,1,'法香可颂',"Croissant français",'48.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/14.jpg',"http://localhost:3005/img/biscuits/13/1.jpg,http://localhost:3005/img/biscuits/13/2.jpg,http://localhost:3005/img/biscuits/13/3.jpg,http://localhost:3005/img/biscuits/13/4.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/13/wap.jpg",true),
(null,1,2,'一口安娜酥',"Gâteaux à l'ananas",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/15.jpg',"http://localhost:3005/img/biscuits/14/1.jpg,http://localhost:3005/img/biscuits/14/2.jpg,http://localhost:3005/img/biscuits/14/3.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/14/wap.jpg",true),
(null,6,3,'塔尼小红莓',"Dimsum aux canneberge",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/16.jpg',"http://localhost:3005/img/biscuits/15/1.jpg,http://localhost:3005/img/biscuits/15/2.jpg,http://localhost:3005/img/biscuits/15/3.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/15/wap.jpg",true),
(null,4,4,'知识小生',"Dimsum intelligent",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/17.jpg',"http://localhost:3005/img/biscuits/16/1.jpg,http://localhost:3005/img/biscuits/16/2.jpg,http://localhost:3005/img/biscuits/16/3.jpg","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/16/wap.jpg",true),
(null,2,5,'马克西姆摩卡黑巧克力制品豆',"Fèves moka au chocolat noir",'78.00',"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20",'http://localhost:3005/img/cracker/18.jpg',"http://localhost:3005/img/biscuits/17/1.jpg,http://localhost:3005/img/biscuits/17/2.jpg,http://localhost:3005/img/biscuits/17/1.jpg,","一匙之间，绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。","Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. Comme l'Antarctique rencontrent l'Arctique, vous vous met dans les contes de fées.","约2磅 —— 900g","http://localhost:3005/img/detail/country/2014081310595472691.jpg,法国淡奶油|http://localhost:3005/img/detail/country/2016102509565145977.jpg,比利时巧克力|http://localhost:3005/img/detail/country/2019041619355437788.jpg,新西兰牛奶","http://localhost:3005/img/biscuits/17/wap.jpg",true);

/*用户信息插入数据*/
insert into users values
(null,"xiaoming","123456","王小明",1,"1998-03-30","1324546451@qq.com","18123304138",null),
(null,"dingding","121212","丁丁",0,"1997-04-10","1515421542@qq.com","18454542141",null);

/*首页轮播广告商品*/
INSERT INTO cakecarousel VALUES
(NULL,'http://localhost:3005/img/lunbo/1.png','轮播广告商品1'),
(NULL,'http://localhost:3005/img/lunbo/2.png','轮播广告商品2'),
(NULL,'http://localhost:3005/img/lunbo/3.png','轮播广告商品3'),
(NULL,'http://localhost:3005/img/lunbo/4.jpg','轮播广告商品4');

/*首页三排图片*/
INSERT INTO threepictrue VALUES
(NULL,'http://localhost:3005/img/body/3.1.jpg'),
(NULL,'http://localhost:3005/img/body/3.2.jpg'),
(NULL,'http://localhost:3005/img/body/3.3.jpg');
/*首页本季推荐下的图片*/
INSERT INTO bigpicture VALUES
(NULL,'http://localhost:3005/img/body/body1.jpg'),
(NULL,'http://localhost:3005/img/body/body2.jpg');

/*商品列表头部口味*/
INSERT INTO protaste VALUES
(null,1,"拿破仑"),
(null,2,"奶油"),
(null,3,"莫斯"),
(null,4,"芝士"),
(null,5,"巧克力"),
(null,6,"咖啡"),
(null,7,"坚果"),
(null,8,"水果"),
(null,9,"冰淇淋");





