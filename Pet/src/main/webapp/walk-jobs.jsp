<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책 아르바이트</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body style="padding-top: 150px;">
	<header>
		<%
		request.setAttribute("pageTitle", "산책 아르바이트");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>

	<main>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>게시글 목록</h2>
					<form action="walk-jobs.jsp" method="get">
						<div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="filterLocation" class="d-block">지역</label> 
                                <select class="form-control" id="filterLocation" name="filterLocation">
                                    <option value="" <%=(request.getParameter("filterLocation") == null) ? "selected" : ""%>>전체</option>
                                    <option value="서울" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("서울")) ? "selected" : ""%>>서울</option>
                                    <option value="경기" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("경기")) ? "selected" : ""%>>경기</option>
                                    <option value="인천" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("인천")) ? "selected" : ""%>>인천</option>
                                    <option value="부산" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("부산")) ? "selected" : ""%>>부산</option>
                                    <option value="대구" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("대구")) ? "selected" : ""%>>대구</option>
                                    <option value="대전" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("대전")) ? "selected" : ""%>>대전</option>
                                    <option value="경남" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("경남")) ? "selected" : ""%>>경남</option>
                                    <option value="전남" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("전남")) ? "selected" : ""%>>전남</option>
                                    <option value="충남" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("충남")) ? "selected" : ""%>>충남</option>
                                    <option value="광주" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("광주")) ? "selected" : ""%>>광주</option>
                                    <option value="울산" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("울산")) ? "selected" : ""%>>울산</option>
                                    <option value="경북" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("경북")) ? "selected" : ""%>>경북</option>
                                    <option value="전북" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("전북")) ? "selected" : ""%>>전북</option>
                                    <option value="충북" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("충북")) ? "selected" : ""%>>충북</option>
                                    <option value="강원" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("강원")) ? "selected" : ""%>>강원</option>
                                    <option value="제주" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("제주")) ? "selected" : ""%>>제주</option>
                                    <option value="세종" <%=(request.getParameter("filterLocation") != null && request.getParameter("filterLocation").equals("세종")) ? "selected" : ""%>>세종</option>
								</select>
							</div>
<div class="form-group col-md-2">
                                <label for="filterDay" class="d-block">근무요일</label> 
                                <select class="form-control" id="filterDay" name="filterDay">
                                    <option value="" <%=(request.getParameter("filterDay") == null) ? "selected" : ""%>>전체</option>
                                    <option value="평일" <%=(request.getParameter("filterDay") != null && request.getParameter("filterDay").equals("평일")) ? "selected" : ""%>>평일</option>
                                    <option value="주말" <%=(request.getParameter("filterDay") != null && request.getParameter("filterDay").equals("주말")) ? "selected" : ""%>>주말</option>
                                </select>
                            </div>
 <div class="form-group col-md-2">
                                <label for="filterTime" class="d-block">근무시간</label> 
                                <select class="form-control" id="filterTime" name="filterTime">
                                    <option value="" <%=(request.getParameter("filterTime") == null) ? "selected" : ""%>>전체</option>
                                    <option value="오전" <%=(request.getParameter("filterTime") != null && request.getParameter("filterTime").equals("오전")) ? "selected" : ""%>>오전</option>
                                    <option value="오후" <%=(request.getParameter("filterTime") != null && request.getParameter("filterTime").equals("오후")) ? "selected" : ""%>>오후</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
    <label for="filterSize" class="d-block">견종</label>
    <select class="form-control" id="filterSize" name="filterSize">
        <option value=""  <%=(request.getParameter("filterSize") == null) ? "selected" : ""%>>전체</option>
        <option value="소형견(7kg이하)" <%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("소형견(7kg이하)")) ? "selected" : ""%>>소형견(7kg이하)</option>
        <option value="중형견(8kg이상)" <%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("중형견(8kg이상)")) ? "selected" : ""%>>중형견(8kg이상)</option>
        <option value="대형견(16kg이상)" <%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("대형견(16kg이상)")) ? "selected" : ""%>>대형견(16kg이상</option>
        <option value="초대형견(45kg이상)" <%=(request.getParameter("filterSize") != null && request.getParameter("filterSize").equals("초대형견(45kg이상)")) ? "selected" : ""%>>초대형견(45kg이상)</option>
    </select>
</div>
							 <div class="form-group col-md-2">
                                <button type="submit" class="btn btn-primary mt-4">검색</button>
                            </div>
						</div>
					</form>
 <div class="text-right mb-3">
    <!-- 급여가 높은 순으로 정렬하는 버튼, 필터 조건을 URL에 추가 -->
    <a href="walk-jobs.jsp?sortBy=pay&filterLocation=<%=request.getParameter("filterLocation") != null ? URLEncoder.encode(request.getParameter("filterLocation"), "UTF-8") : ""%>&filterDay=<%=request.getParameter("filterDay") != null ? URLEncoder.encode(request.getParameter("filterDay"), "UTF-8") : ""%>&filterTime=<%=request.getParameter("filterTime") != null ? URLEncoder.encode(request.getParameter("filterTime"), "UTF-8") : ""%>&filterSize=<%=request.getParameter("filterSize") != null ? URLEncoder.encode(request.getParameter("filterSize"), "UTF-8") : ""%>" class="btn btn-primary">급여 높은 순</a>

</div>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead class="thead-dark">
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
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%
							if (currentPage > 1) {
							%>
							<li class="page-item"><a class="page-link"
								href="walk-jobs.jsp?currentPage=<%=currentPage - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
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
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
							<%
							}
							%>
						</ul>
					</nav>
					<%
					} catch (Exception e) {
					out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
					}
					%>
				</div>
			</div>
		</div>
	</main>

	<footer class="footer mt-auto py-3">
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>