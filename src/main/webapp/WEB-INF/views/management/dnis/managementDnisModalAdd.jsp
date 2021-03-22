<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사용자 등록 모달 -->
<div class="modal fade management_code" id="modalAddDnis" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;width:650px;">
		<div class="modal-header">
			<h3 style="text-align:center">DNIS 등록</h3>
		</div>
		<div class="modal-body" id="divModalDnis">
			<form id="frmModalDnis" name="frmModalDnis">
			<table class="table table-bordered">
				<tbody>
						<th>
						<span class="ess-mark">*</span>DNIS
						</th>
						<td>
							<input type="text" id="dnis" name="dnis" class="form-control form-control-sm required">
						</td>
						<th>
						<span class="ess-mark">*</span>전화번호
						</th>
						<td>
							<input type="text" id="fullTelNo" name="fullTelNo" class="form-control form-control-sm required">
						</td>
					</tr>	
					<tr>
						<th>
							전화국번호
						</th>
						<td>
							<input type="text" id="prefixNo" name="prefixNo" class="form-control form-control-sm required">
						</td>
						<th>
							국번
						</th>
						<td>
							<input type="text" id="pofn" name="pofn" class="form-control form-control-sm required">
						</td>
					</tr>
					<tr>
						<th>
							라인번호
						</th>
						<td>
							<input type="text" id="lineNo" name="lineNo" class="form-control form-control-sm required">
						</td>
						<th>
							상태
						</th>
						<td class="text-left"><!-- 2021-02-05 라디오 버튼 왼쪽 정렬 -->
							<label class="form-radio-label">
								<input class="form-radio-input" type="radio" id="dnisStatus" name="dnisStatus" value="1">
								<span class="form-radio-sign">비사용</span>
							</label>
							<label class="form-radio-label ml-3">
								<input class="form-radio-input" type="radio" id="dnisStatus" name="dnisStatus" value="2">
								<span class="form-radio-sign">사용</span>
							</label>
						</td>	
					</tr>
									
				</tbody>
			</table>	
			</form>
			
		</div>	
		<div class="modal-footer">
		  <button type="button" class="btn btn-primary" id="btnModalConfirm">등록</button>
		  <button type="button" class="btn btn-default" id="btnModalClose" data-dismiss="modal">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->
