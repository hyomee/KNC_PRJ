<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사용자 등록 모달 -->
<div class="modal fade management_code" id="modalAddUser" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;width:650px;">
		<div class="modal-header">
			<h3 style="text-align:center">사용자 등록</h3>
		</div>
		<div class="modal-body" id="divModalUser">
			<form id="frmModalUser" name="frmModalUser">
			<table class="table table-bordered">
			<tbody>
				<tr>
					<th><span class="ess-mark">*</span>사용자 그룹</th>
					<td colspan="3">
						<select  id="userGroup" name="userGroup" class="form-control required">
						  <option value="1">운영그룹</option>
						  <option value="2">개발그룹</option>
						</select>
					</td>
				</tr>
				<tr>
					<tr>
						<th><span class="ess-mark">*</span>로그인 ID</th>
				 		<td class="text-left">
							<input type="text" id="userId" name="userId" class="form-control required" />
						</td>
						<th><span class="ess-mark">*</span>로그인 암호</th>
						<td class="text-left">
							<input type="password" id="password" name="password" class="form-control required" />
						</td>
					</tr>
				<tr>
					<th><span class="ess-mark">*</span>사용자명</th>
					<td class="text-left">
						<input type="text" id="userName" name="userName" class="form-control required" />
					</td>
					<th>연락처</th>
					<td>
						<input type="text" id="mtelNo" name="mtelNo" class="form-control" />
					</td>					
				</tr>
				<tr>
					<th>메일주소</th>
					<td class="text-left">
						<input type="text" id="eMail" name="eMail" class="form-control email"  />
					</td>
					<th>상태</th>
					<td>
						<select id="useYn" name="useYn" class="form-control">
						  <option value="Y">활성</option>
						  <option value="N">비활성</option>
						</select>
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
