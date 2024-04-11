<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<header class="my-header">
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
</header>
<style>
    .list-group-item {
        border-right: 1px solid #ccc; /* 수직선 스타일 지정 */
        padding-right: 10px; /* 오른쪽 여백 추가 */
    }
</style>
<body style="padding-top: 100px; background-color: rgb(254, 247, 222);">
    <div class="container">
        <h1 class="mt-5">마이페이지</h1>
        <main>
        <%
        try (Connection connection = MyWebContextListener.getConnection();) {
            String userId = (String) session.getAttribute("userId");
            Statement stmt = connection.createStatement();
            // 회원 정보 가져오기
            String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
            ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);
            if (userInfoRs.next()) {
                String id = userInfoRs.getString("id");
                String password = userInfoRs.getString("pw");
                String userName = userInfoRs.getString("user_name");
                String phone = userInfoRs.getString("phone");
                String address = userInfoRs.getString("address");
                String addressDetail = userInfoRs.getString("address_detail");
        %>
        <div class="my-4">
            <h2>회원 정보</h2>
            
<ul class="list-group">
    <li class="list-group-item">
        <strong>아이디:</strong> <%=id%>
    </li>
    <li class="list-group-item">
        <strong>패스워드:</strong> <%=password%>
    </li>
    <li class="list-group-item">
        <strong>이름:</strong> <%=userName%>
    </li>
    <li class="list-group-item">
        <strong>핸드폰:</strong> <%=phone%>
    </li>
    <li class="list-group-item">
        <strong>주소:</strong> <%=address%> <%=addressDetail%>
    </li>
</ul>
            <a href="/mypage/EditUserInfo.jsp?type=address" class="btn btn-primary mt-3" style="background-color: rgb(88, 185, 117); border-color: rgb(88, 185, 117);">회원정보수정</a>
            <br>
            <br>
        </div>
        <div class="row">
        <div class="col-md-6">
            <h2>작성한 산책 아르바이트 공고 목록</h2>
            <table class="table table-striped" style="background-color: white; text-align: center;">
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성 날짜</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    // 사용자가 작성한 글 가져오기
                    String userPostsQuery = "SELECT * FROM dogwalker WHERE id = '" + userId + "' ORDER BY today_date DESC";
                    ResultSet userPostsRs = stmt.executeQuery(userPostsQuery);
                    while (userPostsRs.next()) {
                        int postId = userPostsRs.getInt("num");
                        String title = userPostsRs.getString("title");
                        String todayDate = userPostsRs.getString("today_date");
                    %>
                    <tr>
                        <td><a href="/mypage/ViewPost.jsp?postId=<%=postId%>"><%=title%></a></td>
                        <td><%=todayDate%></td>
                        <td><a href="#" onclick="confirmDelete('<%=postId%>')" class="btn btn-danger" style="background-color: rgb(237, 111, 98); border-color: rgb(237, 111, 98);">삭제</a></td>
                    </tr>
                    <%
                    }
                    userPostsRs.close();
                    %>
                </tbody>
            </table>
        </div>
        <div class="col-md-6">
            <h2>작성한 게시글 목록</h2>
            <table class="table table-striped" style="background-color: white; text-align: center;">
                <thead>
                    <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성 날짜</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    String boardReadingSql = "SELECT * FROM board WHERE id = '" + userId + "' ORDER BY postdate DESC";

                    try (ResultSet boardReadingRs = stmt.executeQuery(boardReadingSql);) {
                        while (boardReadingRs.next()) {
                            String category = boardReadingRs.getString("category");
                            String title = boardReadingRs.getString("title");
                            String postdate = boardReadingRs.getString("postdate");
                            int idx = boardReadingRs.getInt("idx");
                    %>
                    <tr>
                        <td><%=category%></td>
                        <td><a href="/boardReading.jsp?idx=<%=idx%>"><%=title%></a></td>
                        <td><%=postdate%></td>
                        <td><a href="#" onclick="confirmDeletee('<%=idx%>')" class="btn btn-danger" style="background-color: rgb(237, 111, 98); border-color: rgb(237, 111, 98);">삭제</a></td>
                    </tr>
                    <%
                    }
                    }
                    %>
                </tbody>
            </table>
        </div>
       
   <c:choose>
    <c:when test="${not empty posts}">
    <div class="row mb-4">
        <div class="col-md-12">
            <h2>작성한 카풀 목록</h2>
            <table class="table table-striped" style="background-color: white; text-align: center;">
                <thead>
                    <tr>
                        <th>출발지</th>
                        <th>도착지</th>
                        <th>제목</th>
                        <th>등록 시간</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${posts}" var="carpoolPost">
                        <tr>
                            <td>${carpoolPost.startInput} (${carpoolPost.startRoadInput})</td>
                            <td>${carpoolPost.endInput} (${carpoolPost.endRoadInput})</td>
                            <td><a href='/viewPost?id=${carpoolPost.id}'>${carpoolPost.title}</a></td>
                            <td>${carpoolPost.createdAt}</td>
                            <td>
                                <c:if test="${sessionScope.userId eq carpoolPost.userId}">
                                    <button onclick="confirmDeletePost(${carpoolPost.id})" class="btn btn-danger" style="background-color: rgb(237, 111, 98); border-color: rgb(237, 111, 98);">삭제</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        </div>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
        </div>
        <!-- Remaining code for the chat room -->
        <!-- Add Bootstrap styles and structure similar to the above sections -->
        <% } else {
            // 회원 정보가 없는 경우
            out.println("회원 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
        }
        %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- jQuery AJAX script remains unchanged -->
    <script>
        function confirmDelete(postId) {
            var confirmResult = confirm("정말로 삭제하시겠습니까?");
            if (confirmResult) {
                $.ajax({
                    url : "/mypage/DeletePost.jsp",
                    type : "POST",
                    data : {
                        postId : postId
                    },
                    success : function(response) {
                        alert("글이 성공적으로 삭제되었습니다.");
                        window.location.reload();
                    },
                    error : function(xhr, status, error) {
                        alert("삭제 중 오류가 발생했습니다.");
                    }
                });
            }
        }

        function confirmDeletee(idx) {
            var confirmResult = confirm("정말로 삭제하시겠습니까?");
            if (confirmResult) {
                $.ajax({
                    url : "/boardDeleteServlet.do",
                    type : "GET",
                    data : {
                        idx : idx
                    },
                    success : function(response) {
                        alert("글이 성공적으로 삭제되었습니다.");
                        window.location.reload();
                    },
                    error : function(xhr, status, error) {
                        alert("삭제 중 오류가 발생했습니다.");
                    }
                });
            }
        }
        function confirmDeletePost(idx) {
        	var confirmResult = confirm("정말로 삭제하시겠습니까?");
            if (confirmResult) {
                $.ajax({
                    url : "/deletePost",
                    type : "GET",
                    data : {
                        id : idx
                    },
                    success : function(response) {
                        alert("글이 성공적으로 삭제되었습니다.");
                        window.location.href = "/mypage.jsp";
                    },
                    error : function(xhr, status, error) {
                        alert("삭제 중 오류가 발생했습니다.");
                    }
                });
            }
        }
    </script>
</body>
</html>
