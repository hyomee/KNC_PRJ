<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 고객명 모달 팝업 -->
<div class="modal fade product_management" id="custNameModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">고객명 조회</h3>
		</div>
		<div class="modal-body">
		
			<table class="table table-bordered">
				<tbody>
					<tr width="120">
						<th>
						고객명
						</th> 
						<td>
							<form id="" class="form-inline">
								<input type="text" id="srchCustName" name="srchCustName" class="form-control form-control-sm">
								<span class="pull-right"><!-- 2021-02-19 버튼 오른쪽 정렬 -->
								<button type="button" id="btnCustNameSearch" class="btn btn-sm btn-primary ml-2"><i class="fas fa-search text-white"></i> 조회</button>
								</span>
							</form>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="row btn-center-box">
				<div class="col-12">
					<div class="no-row-space mt-2" style="max-height:270px;overflow-y:auto">
						<table class="table table-bordered" id="listCustNameTable">
							<thead>
								<tr>
									<th>
									고객ID
									</th>
									<th>
									고객명
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
		  <button type="button" class="btn btn-primary" id="btnCustNmModalConfirm" data-dismiss="modal">적용</button>
		  <button type="button" class="btn btn-default" id="btnCustNmModalClose" data-dismiss="modal">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->