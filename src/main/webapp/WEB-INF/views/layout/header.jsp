<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="main-header">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="white">
			
			<a href="/main" class="logo">
				<img src="/resources/images/logo.png" alt="navbar brand" class="navbar-brand">
			</a>
			<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon">
					<i class="icon-menu"></i>
				</span>
			</button> 
			<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
			<div class="nav-toggle">
				<button class="btn btn-toggle toggle-sidebar">
					<i class="icon-menu"></i>
				</button>
			</div>
		</div>
		<!-- End Logo Header -->

		<!-- Navbar Header -->
		<nav class="navbar navbar-header navbar-expand-lg" data-background-color="white">
			
			<div class="container-fluid">
				<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
					<li class="nav-item">
						<b>홍길동</b>님 반갑습니다.
					</li>
					<li class="nav-item">
						<span class="f16 text-muted"> &nbsp;<span id="year"></span>. <span id="month"></span>. <span id="date"></span> | <span id="day"></span>, <span id="hours"></span>:<span id="min"></span></span></h2>
						<script type="text/javascript"> 
						var clockStart = setInterval(function() {
						var today = new Date()
						var dayList = ['일', '월', '화', '수', '목', '금', '토']
						var hh = addZero(today.getHours())
						var mm = addZero(today.getMinutes())
						var ss = addZero(today.getSeconds())
						var YY = today.getFullYear()
						var MM = today.getMonth()+1
						var DD = today.getDate()
						var dd = dayList[today.getDay()].toUpperCase()
						document.getElementById('hours').innerText = hh
						document.getElementById('min').innerText = mm
						document.getElementById('month').innerText = MM
						document.getElementById('date').innerText = DD
						document.getElementById('year').innerText = YY
						document.getElementById('day').innerText = dd
						function addZero(num) {
						return (num < 10 ? '0'+num : ''+num)
						}
						}, 1000)
						</script>
					</li>
					<li class="nav-item dropdown hidden-caret">
					<a href="/login" class="btn btn-xs btn-default">로그아웃</a>
						<!--<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
							<div class="avatar-sm">
								<img src="/resources/images/profile.jpg" alt="..." class="avatar-img rounded-circle"> 
							</div>
						</a>
						<ul class="dropdown-menu dropdown-user animated fadeIn">
							<div class="dropdown-user-scroll scrollbar-outer">
								<li>
									<a class="dropdown-item" href="#">비밀번호 변경</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">로그아웃</a>
								</li>
							</div>
						</ul>-->
					</li>		
				</ul>
			</div>
		</nav>
		<!-- End Navbar -->
	</div>
