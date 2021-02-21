<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="sidebar-wrapper scrollbar scrollbar-inner">
	<div class="sidebar-content">
		<ul class="nav nav-primary">
			<li class="nav-item">
				<a  href="/main" >
					<i class="fas fa-home"></i>
					<p>Home</p> 
				</a>
			</li>
			<li class="nav-item">
				<a data-toggle="collapse" href="#base">
					<i class="fas fa-user-alt"></i>
					<p>회원</p>
					<span class="caret"></span>
				</a>
				<div class="collapse" id="base">
					<ul class="nav nav-collapse">
						<li>
							<a href="/account">
								<span class="sub-item">회원관리</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="sub-item">영업관리</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<a data-toggle="collapse" href="#sidebarLayouts">
					<i class="fas fa-desktop"></i>
					<p>회의</p>
					<span class="caret"></span>
				</a>
				<div class="collapse" id="sidebarLayouts">
					<ul class="nav nav-collapse">
						<li>
							<a href="/Conference/Dashboard">
								<span class="sub-item">회의현황</span>
							</a>
						</li>
						<li>
							<a href="/Conference/Reservation">
								<span class="sub-item">회의예약</span>
							</a>
						</li>
						<li>
							<a href="/Conference/History">
								<span class="sub-item">회의이력</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item submenu">
				<a data-toggle="collapse" href="#forms">
					<i class="fas fa-user-friends"></i>
					<p>고객</p>
					<span class="caret"></span>
				</a>
				<div class="collapse" id="forms">
					<ul class="nav nav-collapse">
						<li>
							<a href="/Customer/Management">
								<span class="sub-item">고객관리</span>
							</a>
						</li>
						<li>
							<a href="/Customer/Contract">
								<span class="sub-item">계약관리</span>
							</a>
						</li>
						<li>
							<a href="/Customer/Service">
								<span class="sub-item">서비스관리</span>
							</a>
						</li>
						<li>
							<a href="/Customer/Rate">
								<span class="sub-item">요금관리</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<a data-toggle="collapse" href="#tables">
					<i class="fas fa-calendar-alt"></i>
					<p>예약</p>
					<span class="caret"></span>
				</a>
				<div class="collapse" id="tables">
					<ul class="nav nav-collapse">
						<li>
							<a href="/Reservation/Management">
								<span class="sub-item">예약관리</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item">
				<a data-toggle="collapse" href="#maps">
					<i class="fas fa-inbox"></i>
					<p>요금</p>
					<span class="caret"></span>
				</a>
				<div class="collapse" id="maps">
					<ul class="nav nav-collapse">
						<li>
							<a href="/Bill/Invoice">
								<span class="sub-item">청·수납 정보</span>
							</a>
						</li>
						<li>
							<a href="/Bill/HotBill">
								<span class="sub-item">실시간 요금 정보</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item" id="nav_charts" data-navitem="charts">
				<a data-toggle="collapse" href="#charts">
					<i class="fas fa-share-alt"></i>
					<p>상품</p>
					<span class="caret"></span>
				</a>
				<div class="collapse" id="charts" data-collapse="charts">
					<ul class="nav nav-collapse">
						<li>
							<a href="/Product/Management">
								<span class="sub-item">상품관리</span>
							</a>
						</li>
						<li>
							<a href="/Product/Configuration">
								<span class="sub-item">상품구성관리</span>
							</a>
						</li>
						<li>
							<a href="/Product/Rate">
								<span class="sub-item">요금관리</span>
							</a>
						</li>								
					</ul>
				</div>
			</li>
			<li class="nav-item active" id="nav_setting">
				<a data-toggle="collapse" href="#setting">
					<i class="fas fa-cog"></i>
					<p>관리</p>
					<span class="caret"></span>
				</a>
				<div class="collapse show" id="setting">
					<ul class="nav nav-collapse">
						<li>
							<a href="/management/user">
								<span class="sub-item">사용자관리</span>
							</a>
						</li>
						<li>
							<a href="/Management/DNIS">
								<span class="sub-item">DNIS관리</span>
							</a>
						</li>
						<li>
							<a href="/Management/BillItem">
								<span class="sub-item">요금항목관리</span>
							</a>
						</li>
						<li class="active">
							<a href="/management/code">
								<span class="sub-item">공통코드관리</span>
							</a>
						</li>			
					</ul>
				</div>
			</li>
		</ul>
	</div>
</div>