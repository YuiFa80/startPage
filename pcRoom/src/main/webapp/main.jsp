<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here :: dynamic :: accessinfo</title>
<script>
</script>
<style>
	body			{background-image:url(image/background.png);
					background-position:left top;
					background-repeat:no-repeat;
					background-size:cover;}
	.titleName		{margin-left:36.5%;
					margin-top:1%;
					font-weight:bold;
					font-size:33pt;
					color:pink;}
	#top_left		{font-weight:bold;
					color:#FFF;}
	#top_right		{margin-left:80%;}
	#oneText		{float:left;}
	#twoText		{float:left;}
	#threeText		{float:left;}
	#fourText		{float:left;}
	#fiveText		{float:left;}
	#sixText		{float:left;}
	#sevenText		{position:absolute;
					margin-top:36%;
					margin-left:88%;}
	.mainTitle		{width:13%;
					margin-top:1%;
					margin-right:1.7%;}
	.subTitle		{font-size:25pt;
					margin-left:5%;
					text-align: center;
					background-color:#FFF;
					cursor:pointer;}
	.storeName		{text-align: right;
					color:#fff;}
	#sideText		{position:absolute;
					margin-top:20%;
					margin-left:40%;
					font-weight:bold;
					font-size:20;
					color:#fff;}
	
</style>
<script >
	function getList(Action,sNickName){
		const form = makeForm('', Action, 'post');
		const nickName = makeInputElement('hidden', 'nickName', sNickName, '');
		
		form.appendChild(nickName);
		document.body.appendChild(form);
		
		form.submit();
	}
	function makeForm(fname, faction, fmethod){
		const form = document.createElement("form");
		if(fname != ""){form.setAttribute("name", fname);}//if절 삭제, fname 파라메터 삭제 可??
		form.setAttribute("action", faction);
		form.setAttribute("method", fmethod);
		return form;
	}
	function makeInputElement(type, name, value, placeholder){
		const input = document.createElement("input");
		input.setAttribute("type", type);
		input.setAttribute("name", name);
		if(value != ""){input.setAttribute("value", value);}
		if(placeholder != ""){input.setAttribute("placeholder", placeholder);}
		
		return input;
	}
	
	function backButton(){
		self.close();
	}
</script>
</head>
<body>
	<div class="top">
		<span id="top_left">${accessInfo}님!안녕하세요!</span>
		<!-- <span id="top_right"><input type="button" id="but" value="로그아웃" onClick="AccessOut('${accessInfo}')"/></span> -->
	</div>
	<div class="titleName">[ &nbsp;&nbsp;피 / 시 / 방&nbsp;&nbsp;]</div>
	<div class="mainTitle Active" id="oneText"></div>
	<div class="mainTitle" id="twoText">
		<p class="subTitle" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">연수구</p>
		<div class="storeName">
			<p><span onClick="getList('indigo','${accessInfo}')">인디고 PC방</span></p>
			<p>AWM PC방</p>
			<p>아지트 PC방</p>
			<p>4TEN PC방</p>
			<p>사이버리아 PC방</p>
			<p>오셀롯 PC방</p>
			<p>헤라 PC방</p>
		</div>
	</div>
	<div class="mainTitle" id="threeText">
		<p class="subTitle" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">부평구</p>
		<div class="storeName">
			<p>5-STAR PC방</p>
			<p>오레오 PC방</p>
			<p>보야르 PC방</p>
			<p>3POP PC방</p>
			<p>본스 PC방</p>
			<p>독스 PC방</p>
			<p>시즌아이 PC방</p>
		</div>
	</div>
	<div class="mainTitle" id="fourText">
		<p class="subTitle" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">미추홀구</p>
		<div class="storeName">
			<p>하늘다리 PC방</p>
			<p>진 PC방</p>
			<p>여기 PC방</p>
			<p>더엑스 PC방</p>
			<p>킹덤 PC방</p>
			<p>긱스타 PC방</p>
			<p>비원 PC방</p>
		</div>
	</div>
	<div class="mainTitle" id="fiveText">
		<p class="subTitle" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">남동구</p>
		<div class="storeName">
			<p>놀이터 PC방</p>
			<p>메종드 PC방</p>
			<p>탑스타 PC방</p>
			<p>세븐 PC방</p>
			<p>아레나 PC방</p>
			<p>철구 PC방</p>
			<p>VRIZ PC방</p>
		</div>
	</div>
	<div class="mainTitle" id="sixText">
		<p class="subTitle" onmouseover="this.style.backgroundColor='skyblue';" onmouseout="this.style.backgroundColor='#FFF';">서구</p>
		<div class="storeName">
			<p>노블 PC방</p>
			<p>팬텀 PC방</p>
			<p>벤큐 PC방</p>
			<p>그레이 PC방</p>
			<p>아이센스 PC방</p>
			<p>URBAN PC방</p>
			<p>케이스타 PC방</p>
		</div>
	</div>
	<div class="mainTitle Active" id="sideText">
		<div class="storeName">
			<P>*INFOMATION*</P>
			<P>현재 접속 지역의</P>
			<P>"피씨방"을 클릭!</P>
		</div>
	</div>
	<div class="bottom" id="sevenText"><input type="button" id="bb" value="뒤로가기" onClick="backButton()"/></div>
</body>
<script>
	let menuZone = document.getElementsByClassName("mainTitle");
	let menuTitle = document.getElementsByClassName("subTitle");
	let menuItems = document.getElementsByClassName("storeName");
	
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
		const activeItems = document.querySelector('.mainTitle.Active .storeName');
		
		activeItems.style.display = "block"; 
	}
	activeItem();
</script>
</html>
