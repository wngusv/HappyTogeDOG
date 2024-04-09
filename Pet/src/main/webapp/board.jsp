<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Util.MyWebContextListener"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
  /* <td> 내의 모든 <a> 태그에 적용될 스타일 */
    .table td a {
        color: black; /* 텍스트 색상을 검정색으로 설정 */
        text-decoration: none; /* 밑줄 제거 */
    }

    .table td a:hover {
        text-decoration: underline; /* 마우스 오버시 밑줄 추가 */
    }
 /* 페이징 버튼의 배경색과 텍스트 색상 변경 */
        .page-link {
            background-color: #ffffff; /* 배경색 변경 */
            color: rgb(111, 94, 66); /* 텍스트 색상 변경 */
        }

        /* 활성화된 페이징 버튼의 배경색과 텍스트 색상 변경 */
        .page-item.active .page-link {
            background-color: rgb(111, 94, 75); /* 활성화된 버튼의 배경색 변경 */
            color: #ffffff; /* 활성화된 버튼의 텍스트 색상 변경 */
        }
        
 .fixed-layout-table {
        table-layout: fixed; /* 테이블 레이아웃을 고정된 너비로 설정 */
        width: 100%; /* 테이블의 전체 너비 설정 */
    }

    .fixed-layout-table th, .fixed-layout-table td {
        width: 20%; /* 각 열의 너비를 테이블 전체 너비의 20%로 설정 */
    }
.table th, .table td {
		background-color: white;
        text-align: center; /* 텍스트 가운데 정렬 */
    }
    
  /* 테이블의 <th> 요소 배경색 변경 */
    .table th {
        background-color: rgb(111, 94, 75);
        color: white; /* 텍스트 색상을 밝게 설정 (선택 사항) */
    }
.custom-button-color {
    background-color: rgb(235, 136, 106); /* R: 235, G: 136, B: 106 */
    border-color: rgb(235, 136, 106); /* 버튼 테두리 색상도 같게 설정 */
    color: white; /* 글씨 색상을 흰색으로 설정 */
}

.social-links {
   list-style: none; /* 리스트 스타일 없애기 */
   padding: 0; /* 패딩 제거 */
   margin: 0; /* 마진 제거 */
   display: flex; /* flexbox를 사용하여 요소들을 가로로 나열 */
   justify-content: flex-end; /* 요소들을 컨테이너의 오른쪽 끝으로 정렬 */
   align-items: center; /* 요소들을 중앙에 정렬 */
}

.social-links li {
   margin-left: 10px; /* 링크들 사이의 간격 설정 */
}
</style>
<body style="padding-top: 150px; background-color: rgb(254, 247, 222);">
   <header>
      <%
      request.setAttribute("pageTitle", "게시판");
      %>
      <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
   </header>
 
   <main>
      <div class="container">
         <section class="strays-info">
         <%      String userId = (String) session.getAttribute("userId");
         String town = null;
       String sql_neighborhood = "SELECT CASE WHEN address LIKE '%시%' THEN LEFT(address, LOCATE('시', address)) WHEN address LIKE '%군%' THEN LEFT(address, LOCATE('군', address)) WHEN address LIKE '%구%' THEN LEFT(address, LOCATE('구', address)) END AS neighborhood FROM user WHERE id = ? AND (address LIKE '%시%' OR address LIKE '%군%' OR address LIKE '%구%')";
       try (Connection conn = MyWebContextListener.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql_neighborhood)) {
          stmt.setString(1, userId);

          try (ResultSet rs = stmt.executeQuery();) {
             if (rs.next()) {
                town = rs.getString("neighborhood");
             }
          }
       } catch (SQLException e) {
          e.printStackTrace();
       }
       // town 값이 null이 아닌 경우 town 출력, null인 경우 공백 출력
    String displayTown = (town != null) ? town : "";
    %>
            <h2 style="text-align: right;"><%=displayTown %> 자유게시판</h2>
            <!-- 검색 폼 -->
            <form action="board.jsp" method="get">
               <input type="text" name="find" 
                  value="<%=request.getParameter("find") != null ? request.getParameter("find") : ""%>">
               <input type="submit" class="btn btn-default" value="검색">
            </form>
            <input type="button" class="btn btn-sm custom-button-color" value="글쓰기"
               onclick="location.href='boardWrite.jsp';">

            <button type="button" class="btn btn-default" onclick="sortByNewest()">최신순</button>
            <button type="button" class="btn btn-default" onclick="sortByRecommendation()">추천순</button>


            <!-- 부트스트랩을 사용한 테이블 스타일 -->
            <table class="table table-striped table-hover fixed-layout-table">
               <thead>
                  <tr>
                     <th width=100>
                        <!-- 카테고리 선택 폼 -->
                        <form action="board.jsp" method="get">
                           <select name="categoryFilter" onchange="this.form.submit()">
                              <option value="">전체</option>
                              <option value="소통">소통</option>
                              <option value="긴급">긴급</option>
                              <option value="후기">후기</option>
                           </select>
                        </form>

                     </th>
                     <th>제목</th>
                     <th>아이디</th>
                     <th>작성시간</th>
                     <th>추천순</th>

                  </tr>
               </thead>
               <tbody>
                  <!-- 테이블 데이터 행 -->
                  <%
            
                
                  String find = request.getParameter("find"); // 검색 버튼을 눌렀을 때 입력한 문자열
                  int pagee = 1;
                  int pageeSize = 10;
                  if (request.getParameter("pagee") != null) {
                     pagee = Integer.parseInt(request.getParameter("pagee"));
                  }

                  String categoryFilter = request.getParameter("categoryFilter");
                  String sql = "SELECT b.idx, b.category, b.title, b.id, b.postdate, "
                           + "COUNT(DISTINCT c.id) AS 추천수, COUNT(DISTINCT cc.num) AS comment_count " 
                           + "FROM board b "
                           + "LEFT JOIN comment c ON b.idx = c.post_idx AND c.type = '추천' "
                           + "LEFT JOIN comment_content cc ON b.idx = cc.post_idx "
                           + "WHERE b.town = ? ";

                  boolean whereAdded = false;

                  if (find != null && !find.isEmpty()) {
                     sql += "AND REPLACE(b.title, ' ', '') LIKE ? ";
                     whereAdded = true;
                  }

                  if (categoryFilter != null && !categoryFilter.isEmpty()) {
                     if (!whereAdded) {
                        sql += "AND ";
                        whereAdded = true;
                     }
                     sql += "b.category = ? ";
                  }

                  String sort = request.getParameter("sort");
                  String orderBy = "b.postdate DESC"; // 기본 정렬

                  if ("recommendation".equals(sort)) {
                     orderBy = "추천수 DESC, b.postdate DESC";
                  } else if ("newest".equals(sort)) {
                     orderBy = "b.postdate DESC";
                  }

                  sql += "GROUP BY b.idx ORDER BY " + orderBy + " LIMIT ?, ?";

                  try (Connection conn = MyWebContextListener.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

                     int paramIndex = 1;
                     stmt.setString(paramIndex++, town);

                     if (find != null && !find.isEmpty()) {
                        stmt.setString(paramIndex++, "%" + find.replace(" ", "") + "%");
                     }
                     if (categoryFilter != null && !categoryFilter.isEmpty()) {
                        stmt.setString(paramIndex++, categoryFilter);
                     }

                     stmt.setInt(paramIndex++, (pagee - 1) * pageeSize);
                     stmt.setInt(paramIndex, pageeSize);

                     try (ResultSet rs = stmt.executeQuery();) {
                        while (rs.next()) {
                  %>
                  <tr>
                     <td><%=rs.getString("category")%></td>
                     <td><a href="boardReading.jsp?idx=<%=rs.getInt("idx")%>">
                           <%=rs.getString("title")%> <%
 if (rs.getInt("comment_count") > 0) {
 %> (<%=rs.getInt("comment_count")%>) <%
 }
 %>

                     </a></td>

                     <td><%=rs.getString("id")%></td>
                     <td><%=rs.getTimestamp("postdate").toString()%></td>
                     <td><%=rs.getInt("추천수")%></td>
                  </tr>

                  <%
                  }
                  }

                  } catch (Exception ex) {
                  out.println("오류가 발생했습니다. " + ex.getMessage());
                  }
                  %>

               </tbody>
            </table>
            <%
            // 총 게시물 수 계산하기 위한 쿼리
            String countSql = "SELECT COUNT(*) FROM board WHERE town = ?";
            if (find != null && !find.isEmpty()) {
               countSql += " AND REPLACE(title, ' ', '') LIKE ?";
            }
            if (categoryFilter != null && !categoryFilter.isEmpty()) {
               countSql += " AND category = ?";
            }
            try (Connection conn = MyWebContextListener.getConnection(); PreparedStatement stmt = conn.prepareStatement(countSql)) {
               stmt.setString(1, town);
               int paramIndex = 2;
               if (find != null && !find.isEmpty()) {
                  stmt.setString(paramIndex++, "%" + find.replace(" ", "") + "%");
               }
               if (categoryFilter != null && !categoryFilter.isEmpty()) {
                  stmt.setString(paramIndex++, categoryFilter);
               }

               try (ResultSet rs = stmt.executeQuery();) {
                  if (rs.next()) {
                     int totalPosts = rs.getInt(1);
                     int totalPages = (int) Math.ceil((double) totalPosts / pageeSize);
                     
                     out.println("<div class='text-center'>"); // 중앙 정렬을 위한 div 태그 시작
                     out.println("<nav aria-label='Page navigation example'>");
                     out.println("<ul class='pagination justify-content-center'>");

                     // 이전 페이지 링크
                     if (pagee > 1) {
                         out.println("<li class='page-item'><a class='page-link' href='board.jsp?pagee=" + (pagee - 1) + "'>&laquo;</a></li>");
                     }

                     // 페이지 번호 링크
                     for (int i = 1; i <= totalPages; i++) {
                         String pageLink = "board.jsp?pagee=" + i;
                         if (categoryFilter != null && !categoryFilter.isEmpty()) {
                             pageLink += "&categoryFilter=" + URLEncoder.encode(categoryFilter, "UTF-8");
                         }

                         if (i == pagee) {
                             out.println("<li class='page-item active'><a class='page-link' href='" + pageLink + "'>" + i + "</a></li>");
                         } else {
                             out.println("<li class='page-item'><a class='page-link' href='" + pageLink + "'>" + i + "</a></li>");
                         }
                     }

                     // 다음 페이지 링크
                     if (pagee < totalPages) {
                         out.println("<li class='page-item'><a class='page-link' href='board.jsp?pagee=" + (pagee + 1) + "'>&raquo;</a></li>");
                     }
                     out.println("</ul>");
                     out.println("</nav>");
                     out.println("</div>"); // div 태그 종료
                  }
               }
            } catch (Exception ex) {
               out.println("오류가 발생했습니다: " + ex.getMessage());
            }
            %>

         </section>

      </div>
   </main>

   <footer>
      <div class="container">
         <p>&copy; 2024 Pet. 모든 권리 보유.</p>
      </div>
   </footer>
</body>
<script>
window.onload = function() {
    var categorySelect = document.getElementsByName("categoryFilter")[0];
    var selectedCategory = "<%=categoryFilter%>";
    // JSP 코드를 사용하여 서버에서 선택된 카테고리를 가져옵니다.

    // 선택된 카테고리가 있으면 해당 카테고리를 선택 상태로 설정합니다.
    if (selectedCategory) {
        for (var i = 0; i < categorySelect.options.length; i++) {
            if (categorySelect.options[i].value === selectedCategory) {
                categorySelect.selectedIndex = i;
                break;
            }
        }
    }
};

function sortByRecommendation() {
    var currentUrl = window.location.href;
    var newUrl = new URL(currentUrl);
    newUrl.searchParams.set('sort', 'recommendation');
    console.log("Sort by recommendation:", newUrl.href); // 로그 기록
    window.location.href = newUrl.href;
}

function sortByNewest() {
    var currentUrl = window.location.href;
    var newUrl = new URL(currentUrl);
    newUrl.searchParams.set('sort', 'newest');
    console.log("Sort by newest:", newUrl.href); // 로그 기록
    window.location.href = newUrl.href;
}
</script>

</html>
