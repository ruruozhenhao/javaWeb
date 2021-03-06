<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="img/logo2.png" />
	</div>
	<div class="col-md-5">
		<img src="img/header.png" />
	</div>
	<div class="col-md-3" style="padding-top: 20px">
		<ol class="list-inline">
			<c:if test="${empty user }">
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">注册</a></li>
			</c:if>
			<c:if test="${!empty user }">
				<li><a style="color: red;">Welcom ${user.uname }</a></li>
				<li><a href="#">exit</a></li>
			</c:if>
			<li><a href="cart.jsp">购物车</a></li>
			<li><a href="order_list.jsp">我的订单</a></li>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">首页</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<%--动态显示数据库中的分类列表--%>
				<ul class="nav navbar-nav" id="menu">

					<%--	<li><a href="#">电脑办公</a></li>--%>
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group" style="position: relative">
						<input id="search" type="text" class="form-control" placeholder="Search"
							onkeyup="searchWord(this)">
						<div id="showDiv" style="display:none; position: absolute; background: #fff; z-index: 10; width: 206px; border: 0px solid #ccc;">
						</div>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>

	
	<%--发送Ajax单独查询分类导航--%>
	<script type="text/javascript">
			
		//当header.jsp加载完毕后，就去服务器端获取所有的category数据
		<%-- 
		$(function () {
				var content="";
				$.post(
				    /*访问数据*/
				    "${pageContext.request.contextPath}/product?method=categoryList",
					/*接收数据*/
					function (data) {
						for (var i=0;i<data.length;i++){
						    content+="<li><a href='${pageContext.request.contextPath}/product?method=productList&cid="+data[i].cid+"'>"+data[i].cname+"</a> </li>";
						}
						//将拼接好的li放置到ul中
						$("#menu").html(content);

                    },
					/*数据类型*/
					"json"
				);

                }
			);
			
			--%>
			function overFn(obj) {
				$(obj).css("background", "#DBEAF9");
			}
			
			function outFn(obj) {
				$(obj).css("background", "#fff");
			}
			
			function clickFn(obj) {
				$("#search").val($(obj).html());
				$("#showDiv").css("display", "none");
			}
			
			
			function searchWord(obj) {
				var word = $(obj).val();
				var content = "";
	    		$.post(
	        		"${pageContext.request.contextPath}/searchProduct",
	        		{"searchWord":word},
	        		function(data) {
	        			if (data != null && data.length > 0) {
							for (var i = 0; i < data.length; ++i) {
								content += "<div style='padding: 5px; cursor: pointer' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)'>"+ data[i] +"</div>";
							}
							$("#showDiv").html(content);
							$("#showDiv").css("display", "block");
	        			} else {
	        				$("#showDiv").css("display", "none");
	        			}
	        		},
	        		"json"
	        	);
			}

		</script>
		
	</nav>
</div>