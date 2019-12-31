<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改界面</title>
<link rel="stylesheet"  href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
 <script type="text/javascript">
$(function() {
	var gid="${param.gid}";
   $.post("toupdate.do",{"gid":gid},function(obj){
	  $("[name=gid]").val(obj.gid); 
	  $("[name=gname]").val(obj.gname); 
	  $("[name=yname]").val(obj.yname); 
	  $("[name=biger]").val(obj.biger); 
	  $("[name=price]").val(obj.price); 
	  $("[name=sl]").val(obj.sl); 
	  $("[name=bq]").val(obj.bq); 
	  $(":radio").each(function() {
		if($(this).val()==obj.state){
			$(this).prop("checked",true);
		}
	}) 
	$.post("seleb.do",function(t){
		$.each(t,function(){
			if(this.bid==obj.bid){
				$("[name=bid]").append("<option selected value='"+this.bid+"'>"+this.bname+"</option>")
			}else{
				$("[name=bid]").append("<option  value='"+this.bid+"'>"+this.bname+"</option>")
			}
		});
	},"json")
	  $.post("selek.do",function(q){
		$.each(q,function(){
			if(this.kid==obj.kid){
				$("[name=kid]").append("<option selected value='"+this.kid+"'>"+this.kname+"</option>")
			}else{
				$("[name=kid]").append("<option value='"+this.kid+"'>"+this.kname+"</option>")
			}
		});
	},"json")
   },"json")
})
 </script>
</head>
<body>
<form action="update.do" method="post" enctype="multipart/form-data">
  <table>
      <tr>
          <td>商品名称</td>
          <td><input type="hidden" name="gid">
              <input type="text" name="gname"></td>
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
          <td colspan="10"><input type="submit" value="修改"></td>
      </tr> 
  </table>
</form>
</body>
</html>