/*iWeb在线课堂项目必需的数据库结构*/
/*SQL语句不区分大小写，习惯上：关键字都大写，非关键字都小写*/

#删除数据库iweb，如果它存在的话
DROP  DATABASE  IF  EXISTS  iweb; 
#重新创建数据库iweb
CREATE  DATABASE  iweb  CHARSET=UTF8;
#进入数据库iweb
USE  iweb;

#创建校区表
CREATE  TABLE  iw_school(
	sid INT PRIMARY KEY AUTO_INCREMENT, #校区编号(自增的主键)
	sname  VARCHAR(32), 		#名称
	pic  VARCHAR(128), 			#图片URL
	address  VARCHAR(64), 		#联系地址
	phone VARCHAR(32), 			#联系电话
	postcode CHAR(6), 			#邮编
	longitude  DECIMAL(9,6), 	#经度
	latitude  DECIMAL(8,6)		#纬度
);
INSERT INTO iw_school VALUES(NULL, '北京中关村中心', 'img/school/bjzgc.jpg', '北京市海淀区北三环西路甲18号（大钟寺附近）中鼎大厦B座7层', '010-62130963', '100098', 116.347527, 39.972529);
INSERT INTO iw_school VALUES(NULL, '北京天坛中心', 'img/school/bjtt.jpg', '北京市崇文区珠市口东大街6号珍贝大厦西侧3层达内科技', '010-67028668', '100050', 116.417928, 39.898673);
INSERT INTO iw_school VALUES(NULL, '北京广渠门中心', 'img/school/bjgqm.jpg', '北京市东城区广渠门东广渠家园25号楼启达大厦一层', '15321130620', '100010', 116.457211, 39.897629);
INSERT INTO iw_school VALUES(NULL, '北京清华园中心', 'img/school/bjgqm.jpg', '北京市东城区广渠门东广渠家园25号楼启达大厦一层', '15321130620', '100010', 116.457211, 39.897629);
INSERT INTO iw_school VALUES(NULL, '北京万寿路中心', 'img/school/bjgqm.jpg', '北京市东城区广渠门东广渠家园25号楼启达大厦一层', '15321130620', '100010', 116.457211, 39.897629);

#创建讲师表
CREATE TABLE iw_teacher(
	tid INT PRIMARY KEY AUTO_INCREMENT,	#讲师编号
	tname VARCHAR(64),					#姓名
	pic VARCHAR(128),					#照片URL
	skills VARCHAR(32),					#擅长的领域
	experience VARCHAR(1024),			#工作经历
	style VARCHAR(1024)					#授课风格
);

INSERT INTO iw_teacher VALUES(NULL,'成亮', 'img/teacher/cl.jpg', 'WEB全栈开发', '10年互联网开发经验， 精通HTML5，CSS3，js，vue，angualr 等网页前端技术及 php后端 开发；先后就职于多家 IT 互联网公司，曾任某网络公司技术主管，服务机构有首都师范大学、中国联通、中国石油、国家图书馆、中国摄影协会等。', '讲课诙谐幽默，深处浅出，深得学生喜爱。');
INSERT INTO iw_teacher VALUES(NULL,'李然', 'img/teacher/lr.jpg', '高级网页设计', '从事前端开发多年，参与 及主导研发过多个省级政府项目及海 外项目，参与 NEC，福特等大型企业 CRM 系统的研发。项目涉及金融，汽 车，电子等多个领域。于文思海辉专 职负责前端产品线培训时，积累了大量的教学经验。', '教学风格风趣幽默，细致严谨。善于以项目流程反推知识点讲解，深受学员好评。');
INSERT INTO iw_teacher VALUES(NULL,'张东', 'img/teacher/zd.jpg', 'JS高级编程', '美国PMP认证高级项目经理，微软认证解决方案开发专家。先后在中软国际、中国搜索、太极计算机担任高级开发工程师，架构师，项目经理。曾担任中央外汇管理中心、中国石油、二炮工程研究院、首都国际机场技术咨询顾问。', '一切从实际项目出发，快速入门，学以致用。讲课极富激情，语言表达精准，有感染力。案例丰富、直观，步骤细致，清晰。注重从学习到实际工作的快速转化。');
INSERT INTO iw_teacher VALUES(NULL,'吴华', 'img/teacher/wh.jpg', '移动APP开发', '曾就职于北京塞博维尔信息咨询公司，具备多年的互联网应用经验，精通PHP框架技术。在Web3.0前沿技术方面有着深入的研究，曾参与Shop EX核心模块开发。', '感情充沛，富有激情，容易引起学生们的共鸣。授课时能旁征博引，使学生从诸多的材料中得出结论，并且启迪学生的想象能力。');
INSERT INTO iw_teacher VALUES(NULL,'纪盈鑫', 'img/teacher/jyx.jpg', '前端框架开发', '曾就职于东软集团。参与开发家乐福，津津会员卡等多款上线app。拥有外包和产品两种开发经历。已指导并帮助学员上架多个项目到AppStore。授课风趣幽默，亲和力强。教学耐心，循序渐进，课堂气氛活跃。善于结合生活中的实例，把艰涩难懂的知识点传授给学员。', '授课风趣幽默，亲和力强。教学耐心，循序渐进，课堂气氛活跃。善于结合生活中的实例，把艰涩难懂的知识点传授给学员。');

#创建课程类别表
CREATE  TABLE  iw_course_type(
	tid INT PRIMARY KEY AUTO_INCREMENT,	#类别编号
	tname VARCHAR(16)					#类别名称
);
INSERT INTO iw_course_type VALUES(NULL, '基础课程');
INSERT INTO iw_course_type VALUES(NULL, '核心课程');
INSERT INTO iw_course_type VALUES(NULL, '进阶课程');

#创建课程表——提示：此处的课程属性仍有欠缺！
CREATE TABLE iw_course(
	cid INT PRIMARY KEY AUTO_INCREMENT,	#课程编号
	cname VARCHAR(64),	#课程名称
	pic VARCHAR(128),	#介绍性图片
	teacher_id INT,		#讲师编号，注意：此处不能保存讲师姓名
	duration VARCHAR(16),	#课程时长
	start_time VARCHAR(16),	#开课时间
	#注意：一门课程可能在多个校区开课，此处无法保存多个校区信息
	price DECIMAL(8,2),		#价格
	details VARCHAR(4096)	#课程详细介绍
);

INSERT INTO iw_course VALUES(NULL, '微信小程序开发','img/course/01.jpg', 5, '5天', '每月底开课', 599, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'Unity地形环境搭建','img/course/02.jpg', 4, '100天', '每周一开课', 400, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'UI控件之基本控件','img/course/03.jpg', 3, '20', '每周五开课', 200, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '微信小程序概述','img/course/04.jpg', 2, '3天', '每月初开课', 199, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '手机图标绘制','img/course/05.jpg', 1, '10天', '每周一开课', 399, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'jQuery操作DOM','img/course/06.jpg', 5, '15天', '每月底开课', 450, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '一周上手小程序','img/course/07.jpg', 4, '13天', '每周二开课', 800, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '零基础手绘教程','img/course/08.jpg', 3, '10天', '每周四开课', 999, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'Linux系统管理','img/course/09.jpg', 3, '1天', '每周一三五开课', 150, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '视频剪辑课程','img/course/10.jpg', 3, '20天', '每月底开课', 299, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');

INSERT INTO iw_course VALUES(NULL, '数据分析与可视化','img/course/11.jpg', 5, '15天', '每月底开课', 599, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '好看的插画动起来','img/course/12.jpg', 5, '10天', '每月初开课', 299, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '魔术效果制作','img/course/13.jpg', 1, '10天', '每周二四开课', 200, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'UI设计职位解读','img/course/14.jpg', 1, '8天', '每月底开课', 1599, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '红帽认证课程','img/course/15.jpg', 1, '8天', '每周一开课', 2399, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'WEB前端课程forUI','img/course/16.jpg', 2, '7天', '每月底开课', 1899, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '红帽认证工程师','img/course/17.jpg', 3, '3天', '每周五开课', 6099, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'WEB前端基础精品课','img/course/18.jpg', 5, '10天', '每周日开课', 2199, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'PS入门基础课','img/course/19.jpg', 3, '20天', '每周一开课', 1999, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '前端开发框架','img/course/20.jpg', 3, '10天', '每周二四六开课', 299, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');

INSERT INTO iw_course VALUES(NULL, 'MongoDB','img/course/21.jpg', 5, '15天', '每周六日开课', 199, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '微信小程序开发','img/course/22.jpg', 2, '10天', '每周一开课', 299, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'Shell脚本编程','img/course/23.jpg', 2, '14天', '每周三开课', 260, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'EME之微信运营','img/course/24.jpg', 4, '20天', '每月底开课', 2300, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'JAVA项目实战','img/course/25.jpg', 4, '22天', '每月初开课', 100, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'Hadoop','img/course/26.jpg', 2, '10天', '每周一三开课', 2000, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'QTP功能测试','img/course/27.jpg', 1, '10天', '每天开课', 3000, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, 'Linux平台部署网站','img/course/28.jpg', 3, '10天', '每周日开课', 1800, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '学画超萌披萨','img/course/29.jpg', 5, '15天', '每月底开课', 299, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');
INSERT INTO iw_course VALUES(NULL, '一节课绘制魔童小哪吒','img/course/30.jpg', 2, '15天', '每月底开课', 99, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');

INSERT INTO iw_course VALUES(NULL, 'MySQL存储过程','img/course/31.jpg', 5, '3天', '每周三开课', 999, '<p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p><p>本课程详细讲解了HTML5的各个方面，课程从环境搭建开始，依次讲述了HTML5新元素、Canvas、SVG、Audio、GPS定位、拖拽效果、WEB存储、App Cache、HTML5 多线程和HTML5消息推送等内容。</p>');

#创建校区开课表，记录哪个校区开设了哪些课程——典型的“多对多映射”
CREATE TABLE iw_school_course(
	scid INT PRIMARY KEY AUTO_INCREMENT, #开课编号
	school_id INT,		#校区编号
	course_id INT		#课程编号
);
INSERT INTO iw_school_course VALUES(NULL, 5, 1);
INSERT INTO iw_school_course VALUES(NULL, 3, 1);
INSERT INTO iw_school_course VALUES(NULL, 2, 1);
INSERT INTO iw_school_course VALUES(NULL, 1, 2);
INSERT INTO iw_school_course VALUES(NULL, 2, 2);
INSERT INTO iw_school_course VALUES(NULL, 2, 3);
INSERT INTO iw_school_course VALUES(NULL, 4, 3);
INSERT INTO iw_school_course VALUES(NULL, 5, 3);
INSERT INTO iw_school_course VALUES(NULL, 1, 4);
INSERT INTO iw_school_course VALUES(NULL, 2, 4);
INSERT INTO iw_school_course VALUES(NULL, 4, 4);
INSERT INTO iw_school_course VALUES(NULL, 1, 5);
INSERT INTO iw_school_course VALUES(NULL, 2, 6);
INSERT INTO iw_school_course VALUES(NULL, 4, 7);
INSERT INTO iw_school_course VALUES(NULL, 1, 7);
INSERT INTO iw_school_course VALUES(NULL, 5, 7);
INSERT INTO iw_school_course VALUES(NULL, 1, 8);
INSERT INTO iw_school_course VALUES(NULL, 2, 8);
INSERT INTO iw_school_course VALUES(NULL, 2, 9);
INSERT INTO iw_school_course VALUES(NULL, 1, 10);
INSERT INTO iw_school_course VALUES(NULL, 3, 11);
INSERT INTO iw_school_course VALUES(NULL, 3, 12);
INSERT INTO iw_school_course VALUES(NULL, 5, 13);
INSERT INTO iw_school_course VALUES(NULL, 5, 14);
INSERT INTO iw_school_course VALUES(NULL, 2, 15);
INSERT INTO iw_school_course VALUES(NULL, 2, 16);
INSERT INTO iw_school_course VALUES(NULL, 1, 16);
INSERT INTO iw_school_course VALUES(NULL, 1, 17);
INSERT INTO iw_school_course VALUES(NULL, 3, 17);
INSERT INTO iw_school_course VALUES(NULL, 4, 18);
INSERT INTO iw_school_course VALUES(NULL, 1, 18);
INSERT INTO iw_school_course VALUES(NULL, 5, 18);
INSERT INTO iw_school_course VALUES(NULL, 1, 19);
INSERT INTO iw_school_course VALUES(NULL, 2, 19);
INSERT INTO iw_school_course VALUES(NULL, 2, 20);
INSERT INTO iw_school_course VALUES(NULL, 2, 21);
INSERT INTO iw_school_course VALUES(NULL, 3, 22);
INSERT INTO iw_school_course VALUES(NULL, 2, 23);
INSERT INTO iw_school_course VALUES(NULL, 4, 23);
INSERT INTO iw_school_course VALUES(NULL, 4, 24);
INSERT INTO iw_school_course VALUES(NULL, 5, 25);
INSERT INTO iw_school_course VALUES(NULL, 1, 25);
INSERT INTO iw_school_course VALUES(NULL, 2, 25);
INSERT INTO iw_school_course VALUES(NULL, 3, 26);
INSERT INTO iw_school_course VALUES(NULL, 2, 27);
INSERT INTO iw_school_course VALUES(NULL, 4, 27);
INSERT INTO iw_school_course VALUES(NULL, 1, 27);
INSERT INTO iw_school_course VALUES(NULL, 3, 28);
INSERT INTO iw_school_course VALUES(NULL, 2, 28);
INSERT INTO iw_school_course VALUES(NULL, 4, 29);
INSERT INTO iw_school_course VALUES(NULL, 1, 29);
INSERT INTO iw_school_course VALUES(NULL, 3, 30);
INSERT INTO iw_school_course VALUES(NULL, 2, 30);
INSERT INTO iw_school_course VALUES(NULL, 4, 30);
INSERT INTO iw_school_course VALUES(NULL, 1, 31);
INSERT INTO iw_school_course VALUES(NULL, 3, 31);
INSERT INTO iw_school_course VALUES(NULL, 2, 31);

#创建用户信息表——提示：此处的用户属性仍有欠缺
CREATE TABLE iw_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,	#用户编号
	email VARCHAR(64),		#邮箱
	phone VARCHAR(32),		#电话
	password VARCHAR(128)	#登录密码
);
INSERT INTO iw_user VALUES(NULL,'ding@tedu.cn','13501111111', password('123456'));
INSERT INTO iw_user VALUES(NULL,'dang@tedu.cn','13502222222', password('123456'));
INSERT INTO iw_user VALUES(NULL,'dou@tedu.cn','13503333333', password('abc666'));
INSERT INTO iw_user VALUES(NULL,'ya@tedu.cn','13504444444', password('abc888'));

#创建购物车表
#创建订单表
#创建收获地址表
#创建用户收藏夹表
#.......
