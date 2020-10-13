// const express = require('express')

// let app=express();
// app.listen(8080, ()=>{
// 	console.log('Server Listening on Port 8080')
// })



const express = require('express')

let app=express()


let port=5050
app.listen(port,()=>{
	console.log('Server Listening on Port:',port)
})

app.get('/login',(req,res)=>{
	res.send('Welcome to My Login Pagel')
})


const mysql=require('mysql')
let pool=mysql.createPool({
	host:'127.0.0.1',
	port:'3306',
	user:'root',
	password: '',
	database: 'iweb',
	connectionLimit:10,
})

app.get('/course/newest', (req, res)=>{
	// 向数据库服务器发送查询请求,获得必需的课程数据
	let sql='SELECT cid,cname,iw_course.pic,price,tname,tid FROM iw_course,iw_teacher WHERE iw_course.teacher_id=iw_teacher.tid ORDER BY cid DESC LIMIT 0,12'
	pool.query(sql, (err, result)=>{
		if(err){      //数据库操作执行错误
		console.log('数据库查询失败!')
			throw err
		}
		// 说明数据库操作顺利完成,查询结果保存在result中
		console.log('数据库查询成功!')
		res.send(result)
		// console.log(result)
	})
	// 将数据库返回的课程输出发送给客户端
	// res.send([{cid:3},{cid:9},{cid:5}])
})
