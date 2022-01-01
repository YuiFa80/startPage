<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body			{background-image:url(image/backgroundFriend.png);
					background-position:left top;
					background-repeat:no-repeat;
					background-size:cover;}
	#top_left		{font-weight:bold;
					color:#FFF;}
	#top_right		{margin-left:90%;}
	.titleName		{margin-left:36.5%;
					margin-top:1%;
					font-weight:bold;
					font-size:33pt;
					color:pink;}
	#sevenText		{position:absolute;
					margin-top:34.5%;
					margin-left:88%;}
	#sideLeft		{float:left;
					width:20%;
					margin-left:15%;
					margin-top:3%;
					padding-right:20%;}
	.textOneA		{margin-left:10%;
					margin-top:23%;
					background-color:#fff;
					cursor:pointer;}		
	.textTwo		{margin-left:10%;}
	#sideRight		{float:left;}
	#one			{text-align: center;
					font-weight:bold;
					font-size:20pt;
					background-color:#fff;
					margin-left:10%;}
	#two			{text-align: center;
					font-weight:bold;
					font-size:15pt;}
	#four			{text-align: center;
					font-weight:bold;
					font-size:15pt;}
	#six			{text-align: center;
					font-weight:bold;
					font-size:15pt;}
	.textTwo		{color:#fff;}
	
	
	
</style>
<script >
	function backButton(){
		history.go(-1);
	}
</script>
</head>
<body>
	<div class="top">
		<span id="top_left">[${nickName}]님!여기는&nbsp;[${pcRoomName}]&nbsp;입니다.!</span>
		<span id="top_right"><input type="button" id="but" value="로그아웃" onClick="AccessOut('${accessInfo}')"/></span>
	</div>
	<div class="titleName">[ &nbsp;&nbsp;피 / 시 / 방&nbsp;&nbsp;]</div>
	<div class="floatS" id="dumy"></div>
	<div class="floatS" id="sideLeft">
		<section>
			<div class="textOne Active" id="one">친&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구</div>
			<div class="textOne">
				
				<p class="textOneA" id="two" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;록</p>
				
				<div>
				<p class="textTwo" id="three">*친구 목록입니다.</p>
				</div>
			</div>
			<div class="textOne">
				
				<p class="textOneA" id="four" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;록</p>
				
				<div>
				<p class="textTwo" id="five">*친구 신청 및 등록을 할 수 있습니다.</p>
				</div>	
			</div>
			<div class="textOne">
				
				<p class="textOneA" id="six" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">거&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;절</p>
				
				<div>
				<p class="textTwo" id="seven">*친구 신청 거절 및 삭제가 가능합니다.</p>
				</div>
			</div>
		</section>
	</div>
	<div class="floatS" id="sideRight"></div>
	<div class="bottom" id="sevenText"><input type="button" id="bb" value="뒤로가기" onClick="backButton()"/></div>
</body>
<script>
	let menuZone = document.getElementsByClassName("textOne");
	let menuTitle = document.getElementsByClassName("textOneA");
	let menuItems = document.getElementsByClassName("textTwo");
	
	for(let titleIdx=0; titleIdx < menuTitle.length; titleIdx++){
		menuTitle[titleIdx].addEventListener("click", function(e){//이벤트 기능이 없는 곳에 이벤트 기능을 부여할때:addEventListener
		for(let zoneIdx=0;zoneIdx<menuZone.length;zoneIdx++){
			menuZone[zoneIdx].classList.remove("Active");
		}
		e.target.parentNode.classList.add("Active");
		activeItem();
		});
	}
	
	function activeItem(){
		for(let itemsIdx=0; itemsIdx<menuItems.length;itemsIdx++){
			menuItems[itemsIdx].style.display = "none";
		 }
		const activeItems = document.querySelector('.textOne.Active .textTwo');
		
		activeItems.style.display = "block"; 
	}
	activeItem();
</script>
</html>