<%@page import="DTO.EduDTO"%>
<%@page import="DAO.EduDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
		
		<thead>
			<caption>
				<h2>교육검색페이지</h2>
			</caption>
			
			<tr>
				<td colspan="2">
				<input type="text" class="form-control" name="edu_info" placeholder="검색어를 입력하세요." >
				<button onClick="EduSearch()">검색</button></td>
			</tr>
				
			<tr>
				<td>
				<label for="area_label">지역 선택</label> 
				<select id="area_sel" name="mem_area">
					<option value="">전체지역</option>
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="인천">인천</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="세종">세종</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="전북">전북</option>
					<option value="전남">전남</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="제주">제주</option>
				</select>
				</td>
				
				<td>	
				<label for="part_label">분야 선택</label> 
				<select id="part_sel" name="mem_part">
					<option value="">전체분야</option>
					<option value="빅데이터">빅데이터</option>
					<option value="인공지능">인공지능</option>
					<option value="백엔드">백엔드</option>
					<option value="프론트엔드">프론트엔드</option>
					<option value="풀스택">풀스택</option>
					<option value="융합기술">융합기술</option>
					<option value="보안등">보안.네트워크.클라우드</option>
					<option value="콘텐츠제작">콘텐츠제작</option>
					<option value="자격과정">자격과정</option>
					<option value="블록체인">블록체인</option>
					<option value="기타">기타</option>
				</select>
				</td>
				
				<td>	
				<label for="kind_label">훈련 대상</label> 
				<select id="kind_sel" name="mem_kind">
					<option value="">전체유형</option>
					<option value="구직자내일">구직자 : 내일배움카드</option>
					<option value="구직자전략">구직자 : 국가기간전략산업직종</option>
					<option value="근로자">근로자 : 일반훈련</option>
					<option value="기업">근로자 : 기업훈련</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>순번</td>
				<td>교육과정</td>
				<td>기관명</td>
				
				<td>시작일</td>
				<td>종료일</td>
				
				<td>훈련비</td>
				<td>정원</td>
				<td>훈련대상</td>
			</tr>
			</thead>

			<tobody id="tbody"> 
 
 			</tobody>
		</table>
		
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>	
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function EduSearch() {

			$.ajax({
				url : "EduCon",
				type : "get",
				data : {
					"edu_info" : $('input[name=edu_info]').val(),
					// edu_name, edu_org
					
					"edu_addr" : $('#area_sel').val(),
					"edu_part" : $('#part_sel').val(),
					"edu_kind" : $('#kind_sel').val()
				},
				success : function(res) {
					console.log(res)

				},
				error : function() {
					alert("요청 실패!");
				}
			});

		}
	</script>
</body>
</html>