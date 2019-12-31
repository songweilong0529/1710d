<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示界面</title>
<link rel="stylesheet"  href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body>
<table>
     <tr>
         <td>商品名称</td>
         <td>英文名称</td>
         <td>商品品牌</td>
         <td>商品种类</td>
         <td>尺寸</td>
         <td>单价(元)</td>
         <td>数量</td>
         <td>标签</td>
         <td>商品图片</td>
         <td>商品状态</td>
     </tr>
     <c:forEach items="${list}" var="g" varStatus="count">
      <tr>
          <td>${g.gname}</td>
          <td>${g.yname}</td>
          <td>${g.bname}</td>
          <td>${g.kname}</td>
          <td>${g.biger}</td>
          <td>${g.price}</td>
          <td>${g.sl}</td>
          <td>${g.bq}</td>
          <td>
            <img alt="" src="load/${g.image}" style="width: 100px;height: 100px;">
          </td>
          <td>
           <c:if test="${g.state==0}">暂时缺货</c:if>
           <c:if test="${g.state==1}">有货</c:if>
          </td>
      </tr>
     </c:forEach>
</table>
</body>
</html>