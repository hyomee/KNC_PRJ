<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 문의 사항 접수 모달 -->
<div class="modal fade product_management" id="modalReceipt" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
	<div class="modal-content" style="font-size:12px;padding:20px;color:#222;">
		<div class="modal-header">
			<h3 style="text-align:center">문의 사항 접수</h3>
		</div>
		<div class="modal-body">
			<table class="table table-bordered mt-3">
				<tbody>
					<tr>
						<th width="120">
						상담문의 ID
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							1000009876
						</td>
					</tr>
					<tr>
						<th width="120">
						요청일자
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							2020-01-01
						</td>
					</tr>
					<tr>
						<th width="120">
						문의자
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							홍길동
						</td>
					</tr>
					<tr>
						<th width="120">
						이메일
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
						</td>
					</tr>
					<tr>
						<th width="120">
						핸드폰 번호
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							010-1234-5678
						</td>
					</tr>
					<tr>
						<th width="120">
						전화번호
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							02-5678-1234
						</td>
					</tr>
					<tr>
						<th width="120">
						문의 내용
						</th>
						<td>
							<!-- <textarea class="question-box" rows="1" cols="1" placeholder="문의사항을 작성해주세요."></textarea> -->
							문의내용...
						</td>
					</tr>
				</tbody>
			</table>

			<table class="table table-bordered mt-3">
				<tbody>
					<tr>
						<th width="120">
						접수일자
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							2020-01-01
						</td>
					</tr>
					<tr>
						<th width="120">
						담당자
						</th>
						<td>
							<!-- <input type="text" class="form-control form-control-sm"> -->
							홍길동
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-info" data-dismiss="modal">접수</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		</div>
	</div>
  </div>
</div>
<!-- 모달 -->