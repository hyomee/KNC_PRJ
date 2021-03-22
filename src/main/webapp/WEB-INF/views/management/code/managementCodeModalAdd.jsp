<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 공통코드 관리 등록 모달 -->
<div class="modal fade management_code" id="modalAddCommonCode" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">공통코드 등록</h3>
		</div>
		<div class="modal-body" id="divModalCommonCode">
			<form id="frmModalCommonCode" name="frmModalCommonCode">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>
						<span class="ess-mark">*</span>언어
						</th>
						<td>
							<select id="langType" name="langType" class="form-control required">
							</select>
						</td>
						<th>
						<span class="ess-mark">*</span>그룹코드
						</th>
						<td>
							<input type="text" id="commonGroupCd" name="commonGroupCd" class="form-control form-control-sm required">
						</td>
					</tr>	
					<tr>
						<th>
						<span class="ess-mark">*</span>공통코드
						</th>
						<td>
							<input type="text" id="commonCd" name="commonCd" class="form-control form-control-sm required">
						</td>
						<th>
						<span class="ess-mark">*</span>코드명
						</th>
						<td>
							<input type="text" id="commonCdNm" name="commonCdNm" class="form-control form-control-sm required">
						</td>
					</tr>
					<tr>
						<th>
						설명1
						</th>
						<td colspan="3">
							<input type="text" id="codeDesc1" name="codeDesc1" class="form-control form-control-sm">
						</td>
					</tr>	
					<tr>
						<th>
						설명2
						</th>
						<td colspan="3">
							<input type="text" id="codeDesc2" name="codeDesc2" class="form-control form-control-sm">
						</td>
					</tr>										
					<tr>
						<th>
						설명3
						</th>
						<td colspan="3">
							<input type="text" id="codeDesc3" name="codeDesc3" class="form-control form-control-sm">
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
