<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 청구계정정보 모달 -->
<div class="modal fade product_management" id="billingAccountModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">청구계정 정보</h3>
		</div>
		<div class="modal-body">
		
			<table class="table table-bordered" id="listBaDataTable">
				<tbody>
					<tr width="120">
						<th>
						고객명
						</th>
						<td>
							<form id="" class="form-inline">
								<input type="text" id="srchCustName" name="srchCustName" class="form-control form-control-sm">
								<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
								<button type="button" class="btn btn-sm btn-primary ml-2"><i class="fas fa-search text-white"></i> 조회</button>
								</span>
							</form>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="row btn-center-box">
				<div class="col-12">
					<div class="no-row-space mt-2" style="max-height:270px;overflow-y:auto">
						<table class="table table-bordered" id="listBaTable">
							<thead>
								<tr>
									<th>
									청구주기
									</th>
									<th>
									청구서유형
									</th>
									<th>
									세금계산서 발행여부
									</th>
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
		  <button type="button" class="btn btn-primary" data-dismiss="modal">적용</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->