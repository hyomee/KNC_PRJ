<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 문의 사항 처리 모달 -->
<div class="modal fade product_management" id="modalProcess" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">문의 사항 처리</h3>
		</div>
		<div class="modal-body">
			<table class="table table-bordered mt-3">
				<colgroup>
					<col style="width:15%">
					<col style="width:35%">
					<col style="width:15%">
					<col style="width:35%">
				</colgroup>
				<tbody>
					<tr>
						<th>
						상담문의 ID
						</th>
						<td colspan="3" class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
							1000009876
						</td>
					</tr>
					<tr>
						<th>
						요청일자
						</th>
						<td class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
							2020-01-01
						</td>
						<th>
						접수일자
						</th>
						<td class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
						</td>
					</tr>
					<tr>
						<th>
						문의자
						</th>
						<td colspan="3" class="text-left">
							홍길동
							<!-- <input type="text" class="form-control form-control-sm"> -->
						</td>
					</tr>
					<tr>
						<th>
						이메일
						</th>
						<td colspan="3" class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
						</td>
					</tr>
					<tr>
						<th>
						핸드폰 번호
						</th>
						<td colspan="3" class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
							010-1234-5678
						</td>
					</tr>
					<tr>
						<th>
						전화번호
						</th>
						<td colspan="3" class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
							02-5678-1234
						</td>
					</tr>
					<tr>
						<th>
						문의 내용
						</th>
						<td colspan="3" class="text-left">
							<!-- <textarea class="question-box" rows="1" cols="1" placeholder="문의사항을 작성해주세요."></textarea> -->
							문의내용...
						</td>
					</tr>
				</tbody>
			</table>

			<table class="table table-bordered mt-3">
				<colgroup>
					<col style="width:15%">
					<col style="width:18%">
					<col style="width:15%">
					<col style="width:18%">
					<col style="width:15%">
					<col style="width:19%">
				</colgroup>
				<tbody>
					<tr>
						<th>
						처리일자
						</th>
						<td colspan="3" class="text-left">
							<!-- <input type="text" class="form-control form-control-sm"> -->
							2020-01-01
						</td>
						<th>
						문의 상태
						</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>완료</option>
							  <option>보류</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
						문의 대분류
						</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>옵션1</option>
							  <option>옵션2</option>
							</select>
						</td>
						<th>
						중분류
						</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>옵션1</option>
							  <option>옵션2</option>
							</select>
						</td>
						<th>
						소분류
						</th>
						<td>
							<select class="form-control form-control-sm">
							  <option>옵션1</option>
							  <option>옵션2</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
						처리결과
						</th>
						<td colspan="5" class="text-left">
							<!-- <textarea class="question-box" rows="1" cols="1" placeholder=""></textarea> -->
							처리결과...
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-primary" data-dismiss="modal">처리결과 등록</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->
