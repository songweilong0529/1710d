<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加界面</title>
<link rel="stylesheet"  href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
 <script type="text/javascript">
  $(function() {
	$.post("seleb.do",function(obj){
		$.each(obj,function(){
			$("[name=bid]").append("<option value='"+this.bid+"'>"+this.bname+"</option>")
		});
	},"json")
})
  $(function() {
	$.post("selek.do",function(obj){
		$.each(obj,function(){
			$("[name=kid]").append("<option value='"+this.kid+"'>"+this.kname+"</option>")
		});
	},"json")
})
 </script>
</head>
<body>
<form action="add.do" method="post" enctype="multipart/form-data">
  <table>
      <tr>
          <td>商品名称</td>
          <td><input type="text" name="gname"></td>
      </tr>
      <tr>
          <td>英文名称</td>
          <td><input type="text" name="yname"></td>
      </tr>
      <tr>
          <td>商品品牌</td>
          <td><select name="bid">
            <option value="-1">请选择商品品牌</option>
          </select></td>
      </tr>
      <tr>
          <td>商品种类</td>
          <td><select name="kid">
            <option value="-1">请选择商品种类</option>
          </select></td>
      </tr>   
      <tr>
          <td>尺寸</td>
          <td><input type="text" name="biger"></td>
      </tr> 
      <tr>
          <td>单价(元)</td>
          <td><input type="text" name="price"></td>
      </tr> 
      <tr>
          <td>数量</td>
          <td><input type="text" name="sl"></td>
      </tr> 
      <tr>
          <td>标签</td>
          <td><input type="text" name="bq"></td>
      </tr> 
      <tr>
          <td>商品状态</td>
          <td><input type="radio" name="state" value="0">暂时缺货
              <input type="radio" name="state" value="1">有货</td>
      </tr> 
      <tr>
          <td>商品图片上传</td>
          <td><input type="file" name="myFile"></td>
      </tr> 
      <tr>
          <td colspan="10"><input type="submit" value="提交"></td>
      </tr> 
  </table>
</form>
</body>
</html>