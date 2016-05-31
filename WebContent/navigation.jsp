<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
 #navicon ul{
 margin-bottom: 5px;
 margin-top: 0px;
 box-shadow: 0px 1px 3px #888888;
 font-weight:bold;
  width: 735px;
  list-style-type: none;
  overflow: hidden;
  height: 27px;
  -moz-transition:all 0.5s ease-in;
  -webkit-transition:all 0.5s ease-in;
  -o-transition:all 0.5s ease-in;
  -ms-transition:all 0.5s ease-in;
   transition:all 0.5s ease-in;
 }
  #navicon ul li:hover{
  background-color: #3BA5A5;
  box-shadow: 8px 0px 3px #369999;
  
  }
    #navicon ul li a{
    	color: white;
    }
  #navicon ul li{
   color: white;
   width:85px;
   line-height: 25px;
   background-color: #525858;
   font-size:12px;
   padding-left: 15px;
   -moz-transition:all 0.2s ease-in;
   -webkit-transition:all 0.2s ease-in;
   -o-transition:all 0.2s ease-in;
   -ms-transition:all 0.2s ease-in;
   transition:all 0.2s ease-in;
   float: left;
   margin-left: 8px;
   margin-top: 0px;
   box-shadow: 1px 0px 3px rgba(0,0,0,0.5),-1px 0px 3px rgba(0,0,0,0.5);
  }
  a{
  text-decoration:none;
  }
  a:hover{
   color: white;
  }
</style>
<!-- 
	<img src="./image/artwell.jpg"  style="position: relative;float:right;margin-top: 0px;"/>
 -->
<nav id="navicon" style="position: relative;left: -40px;  clear:both;">
	<ul>
	<li><a href="<%=request.getContextPath() %>/techquote/quote">报价单页面</a></li>
	<li><a href="<%=request.getContextPath() %>/techquote/search">报价查询</a></li>
	</ul>
</nav>
