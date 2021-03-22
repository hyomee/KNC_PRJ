<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 납부계정정보 팝업 모달 -->
<div class="modal fade product_management" id="paymentAccountModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">납부계정 정보</h3>
		</div>
		<div class="modal-body">
		
			<table class="table table-bordered">
				<tbody>
					<tr width="120">
						<th>
						고객명
						</th>
						<td>
							<form id="frmSearch" name="frmSearch" class="form-inline">
								<input type="text" class="form-control form-control-sm">
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
						<table class="table table-bordered" id="listPaTable">
							<thead>
								<tr>
									<th>
									납부자명
									</th>
									<th>
									결제방법
									</th>
									<th>
									단위코드
									</th>
									<th>
									결제일자
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