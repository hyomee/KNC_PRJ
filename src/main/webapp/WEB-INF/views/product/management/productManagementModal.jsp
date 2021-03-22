<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 상품구성정보관리 모달 -->
<div class="modal fade product_management" id="modalProdConfigInfo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">상품 구성정보 관리</h3>
		</div>
		<div class="modal-body">
			<form id="frmModalProdConfigInfo" name="frmModalProdConfigInfo">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>
						판매채널
						</th>
						<td>
							<select id="sel1" name="sel1" class="form-control form-control-sm">
							  
							</select>
						</td>
						<th>
						서비스 도메인
						</th>
						<td>
							<input type="text" id="svcDomain" name="svcDomain" class="form-control form-control-sm">
						</td>
						<th>
						주상품명
						</th>
						<td>
							<input type="text" id="prodName" name="prodName" class="form-control form-control-sm required">
						</td>
					</tr>
				</tbody>
			</table>		

			<table class="table table-bordered mt-3">
				<tbody>
					<tr>
						<th width="120">
						서비스그룹
						</th>
						<td>
							<select id="svcGroup" name="svcGroup" class="form-control form-control-sm">
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			
			<div class="row btn-center-box">
				<div class="col-7">
					<div class="no-row-space mt-2" style="max-height:270px;overflow-y:auto">
						<table class="table table-bordered" id="prodMgtInfoSourceDt">
							<thead>
								<tr>
									<th>
									구성항목코드
									</th>
									<th>
									구성항목명
									</th>
									<th>
									단위코드
									</th>
									<th>
									적용단위
									</th>
									<th>
									서비스요금
									</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 2021-02-18 버튼수정 -->
				<div class="col-1 btn-box-move">
					<a href="#" class="btn-right" onClick="ntcsObj.prodConfigRightArrow()"><h1><i class="fas fa-arrow-alt-circle-right"></i></h1></a>
					<a href="#" class="btn-left" onClick="ntcsObj.prodConfigLeftArrow()"><h1><i class="fas fa-arrow-alt-circle-left"></i></h1></a>
				</div>
				<div class="col-4">
					<div class="no-row-space mt-2" style="max-height:270px;overflow-y:auto">
						<table class="table table-bordered"  id="prodMgtInfoTargetDt">
							<thead>
								<tr>
									<th>
									구성항목코드
									</th>
									<th>
									구성항목명
									</th>
									<th></th>
									<th></th>
									<th style="text-align: center !important;"></th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		
			
		</div>	
		<div class="modal-footer">
		  <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnModalConfirm">적용</button><!-- 2021-02-17 적용버튼 추가 -->
		  <button type="button" class="btn btn-default" data-dismiss="modal" id="btnModalClose">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->
