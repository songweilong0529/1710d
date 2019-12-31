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
<script type="text/javascript">
 function fenye(pageNum) {
	$("[name=pageNum]").val(pageNum);
	$("form").submit();
}
function add() {
	location="add.jsp";
} 
function upd(gid) {
	location="update.jsp?gid="+gid;
}
function dele(gid) {
	if(confirm("确认要删除吗？")){
		location="dele.do?gid="+gid;
	}
}
function quan(own) {
	$("[name=check]").prop("checked",own.checked);
}
function delepath() {
	if(confirm("确认要删除吗？")){
	var gids=$("[name=check]:checked").map(function() {
		 return this.value;
	}).get().join();
   location="deles.do?gids="+gids;
	}
}
function xq(gid) {
	location="xq.do?gid="+gid;
}
</script>
</head>
<body>
<form action="listGoods.do" method="post">
  <input type="hidden" value="${con.pageNum}" name="pageNum">
  商品名称:<input type="text" name="gname" value="${con.gname}">
  <button>查询</button>
</form>
<table>
     <tr>
         <td><input type="checkbox" onclick="quan(this)"></td>
         <td>商品编号</td>
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
         <td>操作
          <button onclick="add()">添加</button>
         </td>
     </tr>
     <c:forEach items="${list}" var="g" varStatus="count">
      <tr>
          <td><input type="checkbox" name="check" value="${g.gid}"></td>
          <td>${count.count+page.startRow-1}</td>
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
          <td>
            <button onclick="xq(${g.gid})">详情</button>
            <button onclick="dele(${g.gid})">删除</button>
            <button onclick="upd(${g.gid})">修改</button>
          </td>
      </tr>
     </c:forEach>
     <tr>
        <td colspan="15">
          <button onclick="fenye(1)">首页</button>
          <button onclick="fenye(${page.prePage==0?'1':page.prePage})">上一页</button>
          <button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
          <button onclick="fenye(${page.pages})">尾页</button>&nbsp;&nbsp;
                               当前${page.pageNum}/${page.pages}页,共${page.total}条数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <button onclick="delepath()">批量删除</button>                    
        </td>
     </tr>
</table>
</body>
</html>