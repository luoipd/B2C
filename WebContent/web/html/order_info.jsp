<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding = "UTF-8"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.*, Database.*, model.*"%>
<%@page include="model.*, Database.*" %>
<html>
<head>
<title>BC2商城</title>
<link href="../css/frame.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="../js/checkform.js"></script>
</head>

<body>
<div id="container">
	<div id="logalleft">
		<div id="logalright">
		<a href="register.jsp" target="_parent">[注册&nbsp;</a>] | 
		<a href="" target="_parent">王小静 已登录| 
		<a href="user_edit.jsp" target="_parent">个人信息维护</a> | 
		<a href="address_daohang.jsp"" target="_parent">地址簿</a> |
	 	<a href="home_nologin.jsp" target="_parent">退出</a>
		</div>
	</div>
	<div id="globallink">
		<ul>
			<li><a href="home.jsp">首页</a></li>
			<li><a href="credit_query.jsp">积分查询</a></li>
			<li><a href="item_search.jsp">商品搜索</a></li>
			<li><a href="favorite.jsp">收藏夹</a></li>
			<li><a href="cart_list.jsp">我的购物车</a></li>
			<li><a href="tradequery.jsp">交易查询</a></li>
			<li><a href="send_notes.jsp">送货说明</a></li>
			<li><a href="" class="nouseful">&nbsp;</a></li>
		</ul>
	</div>
	<div id="banner"></div>
	<%
	DB db = DB.getInstance();
	String queryString = request.getQueryString();
	Integer orderID = new Integer(queryString.split("=")[1]);
	ArrayList<NBOrderInfo> orderList = db.getNBOrderInfosByNBOrderID(orderID);
	NBOrder order = db.getNBOrder(orderID);
	String userEmail = (String)session.getAttribute("userEmail");
	NBUserAddress address = db.getNBUserAddressByID(order.getUserAddressID());
	Date orderDate = order.getOrderDate();
	
	
	
	%>
	<div id="main">
		<div id="search2">
			<div id="searchleft">
				<img src="../image/ico_site.jpg"  id="ico_site"/>
				网站路径：<a href="cart_list.jsp">购物车</a>&gt;&gt;<a href="#">订单详细信息</a>
			</div>
			<div id="searchright2">
			  <input type="text" name="product" id="textInput"/>
			  <input type="button" name="Submit" value="搜索" id="searchbutton" onClick="javascript:window.open('item_search_list.jsp','_parent','')">
			</div>
			<div id="searchright1">
			  <select name="category" id="searchrightcategory">
				<option value="5">所有类别</option>
                <option value="1">图书音像</option>
                <option value="2">时尚生活</option>
                <option value="3">饰品配件</option>
                <option value="4">数码产品</option>
              </select>
		  </div>
		</div>
		<div id="double1">
			<div id="doublehead1"><strong>配送信息</strong></div>
			<div id="doublecontent1">
			<form action="" method="post" enctype="multipart/form-data" name="form1">
				<table id="doublecontenttable3">
				 <tr>
					<td>订单号</td>
					<td><%=order.getOrderID() %></td>
            		<td>客户号</td>
					<td><%=userEmail %></td>
					<td>下单时间</td>
					<td><%=orderDate.getYear()%>-<%=orderDate.getMonth()%>-<%=orderDate.getDate() %>&nbsp;<%=orderDate.getHours() %>:<%=orderDate.getMinutes() %>:<%=orderDate.getSeconds() %> </td>
         		 </tr>
		  		 <tr>
           			<td>订单金额</td>
					<td><%=order.getPrice() %></td>
					<td>支付方式</td>
					<td>货到付款</td>
            		<td>送货方式</td>
					<td>送货上门</td>
			</tr>
			 <tr>
            	<td>收货人</td>
			    <td>王小静<%= %></td>
			    <td>收货人地址</td>
            	<td><%=address.getAddress() %></td>
				<td>订单状态</td>
				<td>已支付</td>
			</tr>
			 <tr>
            <td>收货人E-mail</td>
			<td><%=userEmail %></td>
			<td>收货人手机</td>
			<td><%=address.getMobilePhone() %></td>
					<td></td>
					<td></td>					
				 </tr>
				</from> 
            </table>
			</div></div>
			<div id="double2">
			<div id="doublehead2"><strong>商品信息</strong></div>
			<div id="doublecontent2">
			<form action="" method="post" enctype="multipart/form-data" name="form1">
				<table id="favorite">
				<thead>
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>折扣</th>
						<th>会员价</th>
						<th>数量</th>
					</tr>
				</thead>
				<tbody>
				  <tr>
            		<td>300254</td>
					<td><a href="item_info.jsp">大学物理学.第四册：波动与光学（第2版）</a></td>
					<td>￥10.00</td>
					<td>85折</td>
					<td>￥8.50</td>
					<td>1</td>
          		  </tr>
          		  <%
          		  	for (NBOrderInfo eachOrderInfo : orderList){
          		  		NBProduct product = db.getNBProductByID(eachOrderInfo.getProductID());
          		  		int discount = (int)(product.getDiscount()*100);
          		  		double vipPrice = product.getDiscount()* product.getPrice();
          		  %>
				  <tr>
            		<td><%= product.getId() %></td>
					<td><%= product.getName() %></td>
					<td>￥<%=String.format("%%.2f", product.getPrice()) %></td>
					<td><%=discount %>折</td>
					<td>￥<%=String.format("%.2f", vipPrice) %></td>
					<td><%=eachOrderInfo.getNumber() %></td>
          		  </tr>
          		  <%} %>
				 </tbody>
            </table>
			</form> 
  </div>

</div>
	<div id="footer">
		<span id="footerleft"> &nbsp;隐私权 | 版权 | 法律声明 | 电子邮件：admin@163.com </span>
		<span id="footerright"> B2C商城  Power by IBM &nbsp;</span>
	</div>
</body>
</html>
