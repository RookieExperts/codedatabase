<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="css/detailsmusic.css" />
</head>
<body>
		<div class="music-lgin">

			<div class="music-lgin-all">
				<!--左手-->
				<div class="music-lgin-left ovhd">
					<div class="music-hand">
						<div class="music-lgin-hara"></div>
						<div class="music-lgin-hars"></div>
					</div>
				</div>

				<!--脑袋-->
				<div class="music-lgin-dh">
					<div class="music-lgin-alls">
						<div class="music-lgin-eyeleft">
							<div class="music-left-eyeball yeball-l"></div>
						</div>
						<div class="music-lgin-eyeright">
							<div class="music-right-eyeball yeball-r"></div>
						</div>
						<div class="music-lgin-cl"></div>
					</div>
					<!--鼻子-->
					<div class="music-nose"></div>
					<!--嘴-->
					<div class="music-mouth music-mouth-ds"></div>
					<!--肩-->
					<div class="music-shoulder-l">
						<div class="music-shoulder"></div>
					</div>
					<div class="music-shoulder-r">
						<div class="music-shoulder"></div>
					</div>
					<!--消息框-->
					<div class="music-news">来了,老弟！</div>
				</div>

				<!--右手-->
				<div class="music-lgin-right ovhd">
					<div class="music-hand">
						<div class="music-lgin-hara"></div>
						<div class="music-lgin-hars"></div>
					</div>
				</div>

			</div>

			<!--1-->
			<div class="music-lgin-text">
				<input class="userno inputs" type="text" placeholder="用户号"/>
			</div>
			<!--2-->
			<div class="music-lgin-text">
				<input type="password" class="mima inputs" placeholder="密码" />
			</div>
			<!--3-->
			<div class="music-lgin-text">
				<input class="music-qd inputs" type="button" value="确定" />
			</div>

		</div>

		<script src="js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="js/json2.js"></script>
		<script type="text/javascript">
			//眼睛 密码部分
			$(".mima").focus(function() {
				$(".music-lgin-left").addClass("left-dh").removeClass("rmleft-dh");
				$(".music-lgin-right").addClass("right-dh").removeClass("right-rmdh");
				$(".music-hand").addClass("no");
			}).blur(function() {
				$(".music-lgin-left").removeClass("left-dh").addClass("rmleft-dh");
				$(".music-lgin-right").removeClass("right-dh").addClass("right-rmdh");
				$(".music-hand").removeClass("no");

			})
			//点击小人出来
			$(".userno").focus(function() {
				$(".music-lgin-all").addClass("block");
				//$(".music-news").addClass("no")
			})
			//点击小人消失

			//          $(".music-qd").focus(function(){
			//          	$(".music-lgin-all").removeClass("block")
			//          })


			//注册正则 简单判断
			 
            $('.music-qd').click(function(){
                if(($('.userno').val()=='')){
                    $(".music-news").html("请输入名称")      
                }else if(($('.mima').val()=='')){
                	$(".music-news").html("请输入密码")
                    $(".music-news").addClass("block")
                }else{
                	//alert('提交ajax')
                	$.ajax({
                		url:"${pageContext.request.contextPath}/loginForm",
                		dataType:"json",
                		type:"post",
                		contentType : "application/json",
                		data:JSON.stringify({userno : $('.userno').val(), password : $('.mima').val()}),
                		success: function(data){
                			//alert("0000");
                			if(data == 1){
                				 window.location.href ="${pageContext.request.contextPath}/main";
                			}else{
                				alert("用户名或密码错误")
                			}
                		}
                	});
                }      
            })
     

			
			
		</script>
</body>
</html>