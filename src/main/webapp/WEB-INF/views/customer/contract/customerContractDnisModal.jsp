<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 회의연결번호 팝업 모달 -->
<div class="modal fade product_management" id="dnisModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">회의연결번호 (DNIS)</h3>
		</div>
		<div class="modal-body">
		
			<div class="row btn-center-box">
				<div class="col-12">
					<div class="no-row-space mt-2" style="max-height:270px;overflow-y:auto">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>
									연결번호
									</th>
									<th>
									전화번호
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
		  <button type="button" class="btn btn-primary" data-dismiss="modal">적용</button><!-- 2021-02-17 적용버튼 추가 -->
		  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->