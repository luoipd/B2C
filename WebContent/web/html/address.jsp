<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding = "UTF-8"%>
<html>
<head>
<title>BC2商城</title>
<link href="../css/frame.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="../js/checkform.js"></script>
</head>

<body>
<%@ include file="header.jsp" %>
	<div id="banner"></div>
	<div id="main">
		<div id="search2">
			<div id="searchleft">
				<img src="../image/ico_site.jpg"  id="ico_site"/>
				网站路径：<a href="home.jsp">首页</a>&gt;&gt;<a href="address.jsp"> 地址簿</a>
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
		</div>
		<div id="double1">
			<div id="doublehead1"><strong>地址簿列表</strong></div>
			<div id="doublecontent1">
				<table id="doublecontenttable1">
				<thead>
					<tr>
						<th></th>
						<th>商品名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				  <tr>
					<td>
						<input type="radio" name="radiobutton" value="radiobutton" checked="checked">
					</td>		
					<td>
					北京市海淀区翠微路甲5号
					</td>
					<td>
					<a href="address_edit.jsp"><img src="../image/bt_change.gif"  class="picture"/></a>&nbsp;
					<a href="#" onClick="javascript:confirm('确定删除？')"><img src="../image/bt_delete2.gif" class="picture"/></a>
					</td>	
          		  </tr>
				  <tr>
					<td>
					<input type="radio" name="radiobutton" value="radiobutton">
					</td>
					<td>
					北京市朝阳区北四环中路229号海泰大厦</td>
					<td>
					<a href="address_edit.jsp"><img src="../image/bt_change.gif"  class="picture"/></a>&nbsp;
					<a href="#" onClick="javascript:confirm('确定删除？')"><img src="../image/bt_delete2.gif" class="picture"/></a>
					</td>
				  </tr>
				  <tr>
				  <td></td><td></td>
				  <td>
				  <a href="order_confirm.jsp"><img src="../image/qydzb1.GIF" alt="配送至该地址"  class="picture"></a>
				  </td>
				  </tr>
				 </tbody>
            </table>
			</div>
			</div>
			<div id="double2">
			<div id="doublehead2"><strong>添加地址簿</strong></div>
			<div id="doublecontent2">
			<form action="" method="post" enctype="multipart/form-data" name="form1">
				<table id="itemsearch">
				   <tr>
					<th class="itemsearchth" >姓&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;名：</th>
            		<td class="itemsearchtd1">
					<input type="text" name="name" class="inputtext" onFocus="nextfield='password'" value="" maxlength="25"/>
					</td>
					<td class="itemsearchtd2">
						<span class="red">*&nbsp;必输项<span class="red"></td>
          		 </tr>
				 <tr>
				 <th class="itemsearchth">本地/外地：</th>
            		<td class="itemsearchtd1">
						<select name="province">
                    		<option>请选择</option>
                    		<option>本地</option>
							<option>外地</option>                 
                  		</select>
					</td>
					<td class="itemsearchtd2">&nbsp;</td>
          		 </tr>
				 <tr>
				 <th class="itemsearchth"><span class="inputHeader">通讯地址：</span></th>
            		<td class="itemsearchtd1">
				<input type="text" class="inputtext" name="address" onFocus="nextfield='name'" value="" maxlength="25">
					</td>
					<td class="itemsearchtd2">
						<span class="red">*&nbsp;必输项<span class="red">
					</td>
          		 </tr>
				 <tr>
				 <th class="itemsearchth"><span class="inputHeader">邮政编码：</span></th>
            		<td class="itemsearchtd1">
					<input type="text" class="inputtext" name="postcode" onFocus="nextfield='sex'" value="" maxlength="25">
					</td>
					<td class="itemsearchtd2">&nbsp;</td>
          		 </tr>
				 <tr>
				 <th class="itemsearchth"><span class="inputHeader">手机号码：</span></th>
            		<td class="itemsearchtd1">
	              <input type="text" class="inputtext" name="phone" onFocus="nextfield='sex'" value="" maxlength="25">
					</td>
					<td class="itemsearchtd2">
						<span class="red">*&nbsp;必输项<span class="red">
					</td>
          		 </tr>
				 <tr>
				 <th></th>
				 	<td><input type="button" class="bt2" name="button2" value="提交" onClick="checkaddressform()">
						&nbsp;<input type="reset" class="bt2" name="button1" value="重填" onClick="clear()">
					</td>
				 </tr>
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
