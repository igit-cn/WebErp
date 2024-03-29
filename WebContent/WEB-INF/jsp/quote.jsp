<%@page import="com.artwell.erp.common.BasicAction.MessageInfo"%>
<%@page import="com.artwell.erp.common.BasicAction.Privilege"%>
<%@page import="com.artwell.erp.techquote.entity.Quote"%>
<%@page import="com.artwell.erp.techquote.entity.Unit"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="s"  uri="/struts-tags" %>
<%@taglib prefix="custom" uri="/WEB-INF/tld/Function.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=request.getContextPath()+"/WebErp"%>">
<title>报价单页面</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/quote.css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/quote.js"></script>
</head>
<body>
<s:fielderror/>
<%@include file="/checkLogin.jsp" %>
<%
Unit WEIGHT =Unit.WEIGHT;
Unit MIN =Unit.MIN;
Unit CNY =Unit.CNY;
request.setAttribute("WEIGHT", WEIGHT);
request.setAttribute("MIN", MIN);
request.setAttribute("CNY", CNY);
%>
<div id="mainDiv">
  <form method="get" action="#">
	  <div id="buttonDiv">
		<% Privilege privilege= (Privilege)request.getAttribute("privilege");
		if(privilege!= null){%> 
			<%if(privilege.isEditor()){%>
				<input type="button" name="save" value="保存"/>
			<% }%> 
			<%if(privilege.isEditor()){%> 
				<input type="button" name="commit" value="提交"/>
			<% }%> 
			<%--
				<%if( privilege.isApprover()){%> 
					<input type="button" name="approval" value="审核"/>
				<% }%> 
			 --%>
			<%if( privilege.isViewer()){%> 
				<input type="button" name="download" value="下载excel"/>
			<% }%> 
		 <% }%> 
	   </div>
	<table border="1" style="border-collapse: collapse;">
		<tbody>
		<%--           如果request中 quotelist   先显示                            --%>
		    <tr><td class="title">样板单号</td>${custom:quoteHtml(quoteList,"quoteInfo.sampleOrderNo",true,null)} <td class="reserve" ><input value="" type="text" placeholder="扫描样板单号" name="quoteList[xx].quoteInfo.sampleOrderBarcode" onblur="quoteUtil.query(this,false,true)" /></td></tr>
			<tr><td class="title">版本</td>${custom:quoteHtml(quoteList,"quoteInfo.version",true,null)}<td ></td></tr>
		    <tr><td class="title">本廠款号</td>${custom:quoteHtml(quoteList,"quoteInfo.styleNo",false,null)}<td class="unedible"></td></tr>
			<tr><td class="title">客户</td>${custom:quoteHtml(quoteList,"quoteInfo.client",false,null)}<td class="unedible"></td></tr>
			<tr><td class="title">跟单员</td>${custom:quoteHtml(quoteList,"quoteInfo.merchandiser",false,null)}<td class="unedible"></td></tr>
			<tr><td class="title">客款号</td>${custom:quoteHtml(quoteList,"quoteInfo.clientStyleNo",false,null)}<td class="unedible"></td></tr>
			<tr><td class="title">款式</td>${custom:quoteHtml(quoteList,"quoteInfo.style",false,null)}<td class="unedible"></td></tr>
			<tr><td class="title">毛料成份</td>${custom:quoteHtml(quoteList,"quoteInfo.content",true,null)}<td ><input value="" type="text" name="quoteList[xx].quoteInfo.content" /></td></tr>
			<tr><td class="title">针型</td>${custom:quoteHtml(quoteList,"quoteInfo.gauge",true,null)}<td ><input value=""  type="text" name="quoteList[xx].quoteInfo.gauge" /></td></tr>
			<tr><td class="title">码数</td>${custom:quoteHtml(quoteList,"quoteInfo.size",true,null)}<td ><input value="" type="text" name="quoteList[xx].quoteInfo.size" /><label>码</label></td></tr>
			<tr><td class="title">織片克重</td>${custom:quoteHtml(quoteList,"panelWeight",true,WEIGHT)}<td ><input value=""  type="text" name="quoteList[xx].panelWeight" /><label>克/件</label></td></tr>
			<tr><td class="title">毛衣克重</td>${custom:quoteHtml(quoteList,"garmentWeight",true,WEIGHT)}<td ><input value=""  type="text" name="quoteList[xx].garmentWeight" /><label>克/件</label></td></tr>
			<tr><td class="title">电脑摇片工时</td>${custom:quoteHtml(quoteList,"knittingCost",true,null)}<td ><input value=""  type="text" name="quoteList[xx].knittingCost" /><span><select name="quoteList[xx].knittingUnitInt"><option value="1" selected="selected">分钟</option><option value="2">元</option></select></span></td></tr>
			<tr><td class="title">套口工时</td>${custom:quoteHtml(quoteList,"linkingMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].linkingMin" /><label>分钟</label></td></tr>
			<tr><td class="title">織下欄附件</td>${custom:quoteHtml(quoteList,"trimKnittingMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].trimKnittingMin" /><label>分钟</label></td></tr>
			<tr><td class="title">手钩</td>${custom:quoteHtml(quoteList,"handHookMin",true,MIN)}<td ><input value="" type="text" name="quoteList[xx].handHookMin" /><label>分钟</label></td></tr>
			<tr><td class="title">手撞</td>${custom:quoteHtml(quoteList,"handStitchingMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].handStitchingMin" /><label>分钟</label></td></tr>
			<tr><td class="title">繡花</td>${custom:quoteHtml(quoteList,"embroideryrMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].embroideryrMin" /><label>分钟</label></td></tr>
			<tr><td class="title">印花</td>${custom:quoteHtml(quoteList,"printingPrice",true,CNY)}<td ><input value=""  type="text" name="quoteList[xx].printingPrice" /><label>元</label></td></tr>
			<tr><td class="title">車布</td>${custom:quoteHtml(quoteList,"sewnMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].sewnMin" /><label>分钟</label></td></tr>
			<tr><td class="title">布包/手工鈕(每粒)</td>${custom:quoteHtml(quoteList,"buttonMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].buttonMin" /><label>分钟</label></td></tr>
			<tr><td class="title">特殊洗水</td>${custom:quoteHtml(quoteList,"specialWashingMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].specialWashingMin" /><label>分钟</label></td></tr>
			<tr><td class="title">後加處理</td>${custom:quoteHtml(quoteList,"postProcessPrice",true,CNY)}<td ><input value=""  type="text" name="quoteList[xx].postProcessPrice" value="6" /><label>元</label></td></tr>
			<tr><td class="title">哈梭</td>${custom:quoteHtml(quoteList,"coverStitchMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].coverStitchMin" /><label>分钟</label></td></tr>
			<tr><td class="title">工费</td>${custom:quoteHtml(quoteList,"costPrice",true,CNY)}<td ><input value=""  type="text" name="quoteList[xx].costPrice" /><label>元</label></td></tr>
			<tr><td class="title">辅料</td>${custom:quoteHtml(quoteList,"trimsMin",true,MIN)}<td ><input value=""  type="text" name="quoteList[xx].trimsMin" /><label>克/件</label> </td></tr>
			<tr><td class="title">状态</td>${custom:quoteHtml(quoteList,"quoteInfo.status",false,WEIGHT)}<td class="unedible"></td></tr>
			<tr><td class="title">最新报价时间</td>${custom:quoteHtml(quoteList,"quoteInfo.quoteDate",false,null)}<td class="unedible"></td></tr>
			
		</tbody>
	</table>
  </form>
</div>

	   <% MessageInfo messageInfo= (MessageInfo)request.getAttribute("messageInfo");
		if(messageInfo!= null){%> 
		  <div id="messageBox" class="messageBox"> 
		  <ul > <li><%=messageInfo.getMsg() %></li> </ul>
		  </div>
		  <script type="text/javascript">
			$("#messageBox").css("bottom","0px");
		    setTimeout("$('#messageBox').css('bottom','-200px');",3000);
		  </script>
		<% }else{%>
			 <div id="messageBox" class="messageBox"><ul > </ul></div>
		<%}%> 
 
</body>
</html>