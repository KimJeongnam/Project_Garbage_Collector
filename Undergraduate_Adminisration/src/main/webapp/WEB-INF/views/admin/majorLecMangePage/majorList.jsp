<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="x_panel">
	<div class="x_title">
		<h2>
			학과<small></small>
		</h2>
		<div class="clearfix"></div>
	</div>
	<div class="x_content">
		<div class="row form-inline">
			<label>단과대: <select class="form-control input-sm"
				id="collegeSelector">
					<option selected="selected" value="0">전체</option>
			</select>
			</label>
		</div>
		<table class="table table-striped jambo_table bulk_action">
			<thead>
				<tr class="headings">
					<th class="text-center">학과코드</th>
					<th class="text-center">단과대</th>
					<th class="text-center">학과명</th>
					<th class="text-center">학년별 최대 인원수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-center">A8157</td>
					<td class="text-center">공과대</td>
					<td class="text-center">컴퓨터공학과</td>
					<td class="text-center">120</td>
				</tr>
				<tr>
					<td class="text-center">A8158</td>
					<td class="text-center">무도대학</td>
					<td class="text-center">유도학과</td>
					<td class="text-center">150</td>
				</tr>
				<tr>
					<td class="text-center">A8159</td>
					<td class="text-center">무도대학</td>
					<td class="text-center">유도학과</td>
					<td class="text-center">150</td>
				</tr>
				<tr>
					<td class="text-center">A8110</td>
					<td class="text-center">무도대학</td>
					<td class="text-center">유도학과</td>
					<td class="text-center">150</td>
				</tr>
			</tbody>
		</table>
		<input type="button" class="btn btn-primary" onclick="openMajorAdd();"
			value="신규">
	</div>
</div>