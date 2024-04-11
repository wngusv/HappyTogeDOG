<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<header class="my-header">
	<meta charset="UTF-8">
	<title>산책 아르바이트</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
/* 페이징 버튼의 배경색과 텍스트 색상 변경 */
.page-link {
	background-color: #ffffff; /* 배경색 변경 */
	color: rgb(111, 94, 66); /* 텍스트 색상 변경 */
}

/* 활성화된 페이징 버튼의 배경색과 텍스트 색상 변경 */
.page-item.active .page-link {
	background-color: rgb(111, 94, 75); /* 활성화된 버튼의 배경색 변경 */
	color: #ffffff; /* 활성화된 버튼의 텍스트 색상 변경 */
	border-color: transparent;
}
</style>
	<body style="padding-top: 150px; background-color: rgb(254, 247, 222);">
		<%
		request.setAttribute("pageTitle", "산책 아르바이트");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
</header>

<main>
	<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="walk-jobs.jsp" method="get">
                <div class="form-row align-items-end">
                    <!-- 지역 콤보박스 -->
                    <div class="form-group col-md-2" style="margin-top: 20px;">
                        <label for="filterLocation" class="d-block">지역</label>
                        <select class="form-control" id="filterLocation" name="filterLocation">
								<option value=""
									<%=(request.getParameter("filterLocation") == null) ? "selected" : ""%>>전체</option>
								<option value="서울"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("서울"))
		? "selected"
		: ""%>>서울</option>
								<option value="경기"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("경기"))
		? "selected"
		: ""%>>경기</option>
								<option value="인천"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("인천"))
		? "selected"
		: ""%>>인천</option>
								<option value="부산"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("부산"))
		? "selected"
		: ""%>>부산</option>
								<option value="대구"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("대구"))
		? "selected"
		: ""%>>대구</option>
								<option value="대전"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("대전"))
		? "selected"
		: ""%>>대전</option>
								<option value="경남"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("경남"))
		? "selected"
		: ""%>>경남</option>
								<option value="전남"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("전남"))
		? "selected"
		: ""%>>전남</option>
								<option value="충남"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("충남"))
		? "selected"
		: ""%>>충남</option>
								<option value="광주"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("광주"))
		? "selected"
		: ""%>>광주</option>
								<option value="울산"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("울산"))
		? "selected"
		: ""%>>울산</option>
								<option value="경북"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("경북"))
		? "selected"
		: ""%>>경북</option>
								<option value="전북"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("전북"))
		? "selected"
		: ""%>>전북</option>
								<option value="충북"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("충북"))
		? "selected"
		: ""%>>충북</option>
								<option value="강원"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("강원"))
		? "selected"
		: ""%>>강원</option>
								<option value="제주"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("제주"))
		? "selected"
		: ""%>>제주</option>
								<option value="세종"
									<%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("세종"))
		? "selected"
		: ""%>>세종</option>
								<!-- 추가 지역 옵션들 -->
							</select>
						</div>

						<!-- 근무요일 콤보박스 -->
						 <div class="form-group col-md-2" style="margin-top: 20px;">
                        <label for="filterDay" class="d-block">근무요일</label>
                        <select class="form-control" id="filterDay" name="filterDay">
								<option value=""
									<%=(request.getParameter("filterDay") == null) ? "selected" : ""%>>전체</option>
								<option value="평일"
									<%=(request.getParameter("filterDay") != null && request.getParameter("filterDay").equals("평일")) ? "selected"
		: ""%>>평일</option>
								<option value="주말"
									<%=(request.getParameter("filterDay") != null && request.getParameter("filterDay").equals("주말")) ? "selected"
		: ""%>>주말</option>
							</select>
						</div>

						<!-- 근무시간 콤보박스 -->
						  <div class="form-group col-md-2" style="margin-top: 20px;">
                        <label for="filterTime" class="d-block">근무시간</label>
                        <select class="form-control" id="filterTime" name="filterTime">
								<option value=""
									<%=(request.getParameter("filterTime") == null) ? "selected" : ""%>>전체</option>
								<option value="오전"
									<%=(request.getParameter("filterTime") != null && request.getParameter("filterTime").equals("오전")) ? "selected"
		: ""%>>오전</option>
								<option value="오후"
									<%=(request.getParameter("filterTime") != null && request.getParameter("filterTime").equals("오후")) ? "selected"
		: ""%>>오후</option>
							</select>
						</div>

					 <div class="form-group col-md-2" style="margin-top: 20px;">
                        <label for="filterSize" class="d-block">견종</label>
                        <select class="form-control" id="filterSize" name="filterSize">
								<option value=""
									<%=(request.getParameter("filterSize") == null) ? "selected" : ""%>>전체</option>
								<option value="소형견(7kg이하)"
									<%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("소형견(7kg이하)"))
		? "selected"
		: ""%>>소형견(7kg이하)</option>
								<option value="중형견(8kg이상)"
									<%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("중형견(8kg이상)"))
		? "selected"
		: ""%>>중형견(8kg이상)</option>
								<option value="대형견(16kg이상)"
									<%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("대형견(16kg이상)"))
		? "selected"
		: ""%>>대형견(16kg이상)</option>
								<option value="초대형견(45kg이상)"
									<%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("초대형견(45kg이상)"))
		? "selected"
		: ""%>>초대형견(45kg이상)</option>
							</select>
						</div>

						<!-- 검색 버튼 -->
						 <div class="form-group col-md-2">
                        <button type="submit" class="btn btn-primary" style="background-color: rgb(235, 111, 98); color: white; border-color: rgb(235, 111, 98); height: 38px;">검색</button>
                    </div>

						<!-- 급여 높은 순 버튼 -->
						  <div class="form-group col-md-2">
                        <a href="walk-jobs.jsp?sortBy=pay" class="btn btn-primary float-right" style="background-color: rgb(88, 184, 117); border-color: rgb(88, 184, 117);">▼ 급여 높은 순</a>
                    </div>

					</div>
				</form>


				<table class="table table-striped table-bordered fixed-layout-table"
					style="background-color: white; text-align: center;">
					<thead
						style="background-color: rgb(111, 94, 75); color: #ffffff; text-align: center;">
						<tr>
							<th>번호</th>
							<th>근무지</th>
							<th>제목</th>
							<th>견종</th>
							<th>근무 요일</th>
							<th>근무 시간</th>
							<th>급여</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						try (Connection connection = MyWebContextListener.getConnection();) {

							int recordsPerPage = 10;
							int currentPage = 1;
							if (request.getParameter("currentPage") != null) {
								currentPage = Integer.parseInt(request.getParameter("currentPage"));
							}
							int start = (currentPage - 1) * recordsPerPage;

							String filterLocation = request.getParameter("filterLocation");
							String filterDay = request.getParameter("filterDay");
							String filterTime = request.getParameter("filterTime");
							String filterSize = request.getParameter("filterSize");
							String query;
							PreparedStatement ps;

							// 정렬 파라미터 확인
							String sortBy = request.getParameter("sortBy");

							if (filterLocation != null && !filterLocation.isEmpty()) {
								query = "SELECT * FROM pet.dogwalker WHERE address LIKE ?";
								if (filterDay != null && !filterDay.isEmpty()) {
							query += " AND day=?";
								}
								if (filterTime != null && !filterTime.isEmpty()) {
							query += " AND time=?";
								}
								if (filterSize != null && !filterSize.isEmpty()) {
							query += " AND size=?";
								}
								if (sortBy != null && sortBy.equals("pay")) {
							query += " ORDER BY pay DESC"; // 급여가 높은 순으로 정렬
								} else {
							query += " ORDER BY num DESC";
								}
								query += " LIMIT ?, ?";
								ps = connection.prepareStatement(query);
								ps.setString(1, "%" + filterLocation + "%");
								int parameterIndex = 2;
								if (filterDay != null && !filterDay.isEmpty()) {
							ps.setString(parameterIndex++, filterDay);
								}
								if (filterTime != null && !filterTime.isEmpty()) {
							ps.setString(parameterIndex++, filterTime);
								}
								if (filterSize != null && !filterSize.isEmpty()) {
							ps.setString(parameterIndex++, filterSize);
								}
								ps.setInt(parameterIndex++, start);
								ps.setInt(parameterIndex++, recordsPerPage);
							} else {
								query = "SELECT * FROM pet.dogwalker";
								if (sortBy != null && sortBy.equals("pay")) {
							query += " ORDER BY pay DESC"; // 급여가 높은 순으로 정렬
								} else {
							query += " ORDER BY num DESC";
								}
								query += " LIMIT ?, ?";
								ps = connection.prepareStatement(query);
								ps.setInt(1, start);
								ps.setInt(2, recordsPerPage);
							}

							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("num")%></td>
							<td><%=rs.getString("address")%></td>
							<td><a
								href="dogwalking/dogwalking_board_read.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("title")%></a></td>
							<td><%=rs.getString("size")%></td>
							<td><%=rs.getString("day")%></td>
							<td><%=rs.getString("time")%></td>
							<td><%=rs.getInt("pay")%> 원</td>
							<td><%=rs.getTimestamp("today_date")%></td>
						</tr>
						<%
						}
						// 페이징 처리
						String countQuery = "SELECT COUNT(*) AS total FROM pet.dogwalker";
						PreparedStatement countPs = connection.prepareStatement(countQuery);
						ResultSet countRs = countPs.executeQuery();
						countRs.next();
						int totalRecords = countRs.getInt("total");
						int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
						%>
					</tbody>
				</table>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<%
								if (currentPage > 1) {
								%>
								<li class="page-item"><a class="page-link"
									href="walk-jobs.jsp?currentPage=<%=currentPage - 1%>"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<%
								}
								%>
								<%
								for (int i = 1; i <= totalPages; i++) {
								%>
								<li class="page-item <%=i == currentPage ? "active" : ""%>">
									<a class="page-link" href="walk-jobs.jsp?currentPage=<%=i%>"><%=i%></a>
								</li>
								<%
								}
								%>
								<%
								if (currentPage < totalPages) {
								%>
								<li class="page-item"><a class="page-link"
									href="walk-jobs.jsp?currentPage=<%=currentPage + 1%>"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
								<%
								}
								%>
							</ul>
						</nav>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-right">
						<c:choose>
							<c:when test="${sessionScope.userId != null}">
								<button type="button" class="btn btn-primary"
									style="background-color: rgb(235, 111, 98); color: white; margin-top: -95px; border-color: rgb(235, 111, 98);"
									onclick="location.href='dogwalking/form_new.jsp'">글쓰기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-primary"
									style="background-color: rgb(235, 111, 98); color: white; margin-top: -95px; border-color: rgb(235, 111, 98);"
									onclick="alert('로그인 후 이용해주세요.'); location.href='login.jsp'">글쓰기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<%
			} catch (Exception e) {
			out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
			}
			%>
		</div>
	</div>
</main>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>