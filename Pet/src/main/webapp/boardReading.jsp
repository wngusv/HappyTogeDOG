<%@page import="Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- 부트스트랩 CSS 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.post-title {
	font-size: 2rem; /* 제목 크기 */
	color: #007bff; /* 제목 색상 */
}

.post-meta {
	font-size: 1rem; /* 메타 데이터 폰트 크기 */
	color: #6c757d; /* 메타 데이터 색상 */
}

.post-content {
	font-size: 1.2rem; /* 내용 폰트 크기 */
	margin-top: 20px; /* 상단 여백 */
}

.post-image {
	margin-top: 20px; /* 이미지 상단 여백 */
}
/* 버튼 스타일 */
.reaction-button {
	border: none;
	background-color: transparent;
	cursor: pointer;
	outline: none;
	padding: 5px;
}

/* 활성화된 버튼의 스타일 */
.reaction-button.active img {
	border: 2px solid #007bff;
	border-radius: 50%;
}

/* 횟수 라벨 스타일 */
.reaction-count {
	display: inline-block;
	min-width: 20px;
	padding: 2px 5px;
	text-align: center;
	background-color: #f0f0f0;
	border-radius: 10px;
	margin-left: 5px;
	font-size: 0.8rem;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<%
				String idx = request.getParameter("idx");
				if (idx != null && !idx.isEmpty()) {
					String sql = "SELECT * FROM board WHERE idx = ?";
					try (Connection conn = MyWebContextListener.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql)) {
						psmt.setInt(1, Integer.parseInt(idx));
						try (ResultSet rs = psmt.executeQuery();) {
					if (rs.next()) {
						String title = rs.getString("title");
						String id = rs.getString("id");
						String content = rs.getString("content");
						String sfile = rs.getString("sfile");
				%>
				<h2 class="post-title"><%=title%></h2>
				<div class="text-right">
					<p class="post-meta">
						작성자:
						<%=id%></p>
				</div>
				<div class="post-content">
					<%=content%>
				</div>
				<%
				if (sfile != null && !sfile.isEmpty()) {
				%>
				<img src="<%=sfile%>" alt="게시글 사진" class="img-fluid post-image">
				<%
				}
				%>
				<div class="reactions">
					<!-- 추천 버튼 -->
					<button id="suggestion-button" class="reaction-button"
						data-clicked="false">
						<img src="images/추천.PNG" alt="추천"
							style="height: 20px; width: 20px;">
					</button>
					<span id="suggestion-count" class="reaction-count">0</span>

					<!-- 비추천 버튼 -->
					<button id="notRecommended-button" class="reaction-button"
						data-clicked="false">
						<img src="images/비추천.PNG" alt="비추천"
							style="height: 20px; width: 20px;">
					</button>
					<span id="notRecommended-count" class="reaction-count">0</span>
				</div>

				<!-- 댓글쓰기 버튼 추가 -->
				<div class="comment-section">
					<!-- 댓글 입력 폼 -->
					<form action="/comment.do" method="post">
						<label for="comment-input">댓글</label>
						<textarea id="comment-input" name="comment" class="form-control"
							rows="3"></textarea>
						<button type="submit" class="btn btn-primary mt-2">댓글쓰기</button>
					</form>
				</div>

				<%
				}
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				} else {
				// idx가 없거나 비어 있는 경우
				out.println("<p>게시글을 찾을 수 없습니다.</p>");
				}
				%>
			</div>
		</div>
	</div>
	<!-- 부트스트랩 JavaScript 및 종속성 파일 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script>
var userId = '<%= (session.getAttribute("userId") != null) ? session.getAttribute("userId") : "" %>';
var postIdx = <%=idx%>; // 게시글 idx

function sendReaction(postId, type) {
	 // 로그인하지 않은 경우 알림을 표시하고 함수 실행을 중단합니다.
    if (userId === "") {
        alert("로그인 후 이용 가능합니다.");
        return;
    }
	 
    fetch('/comment.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'type=' + type + '&postIdx=' + postId
    })
    .then(response => response.json())
    .then(data => {
        if(data.status === 'success') {
            // 성공적으로 처리되었을 때의 로직
            console.log('Reaction updated successfully');
        } else {
            // 에러 처리
            console.error('Failed to update reaction');
        }
    })
    .catch(error => {
        // 네트워크 오류 처리
        console.error('Error:', error);
    });
}
	// 추천 버튼 클릭 이벤트 리스너
	document
			.getElementById('suggestion-button')
			.addEventListener(
					'click',
					function() {
						 // 로그인 체크
				        if (userId === "") {
				            alert("로그인 후 이용 가능합니다.");
				            return;
				        }
						 
						var suggestionCount = parseInt(document
								.getElementById('suggestion-count').textContent);
						var notRecommendedButton = document
								.getElementById('notRecommended-button');
						var notRecommendedCount = parseInt(document
								.getElementById('notRecommended-count').textContent);

						var suggestionClicked = this
								.getAttribute('data-clicked') === 'true';
						var notRecommendedClicked = notRecommendedButton
								.getAttribute('data-clicked') === 'true';

						if (notRecommendedClicked) {
							notRecommendedButton.setAttribute('data-clicked',
									false);
							document.getElementById('notRecommended-count').textContent = notRecommendedCount - 1;
						}

						this.setAttribute('data-clicked', !suggestionClicked);
						document.getElementById('suggestion-count').textContent = !suggestionClicked ? suggestionCount + 1
								: suggestionCount - 1;
						
						sendReaction(postIdx, '추천');
					});

	// 비추천 버튼 클릭 이벤트 리스너
	document
			.getElementById('notRecommended-button')
			.addEventListener(
					'click',
					function() {
						 // 로그인 체크
				        if (userId === "") {
				            alert("로그인 후 이용 가능합니다.");
				            return;
				        }
						 
						var notRecommendedCount = parseInt(document
								.getElementById('notRecommended-count').textContent);
						var suggestionButton = document
								.getElementById('suggestion-button');
						var suggestionCount = parseInt(document
								.getElementById('suggestion-count').textContent);

						var notRecommendedClicked = this
								.getAttribute('data-clicked') === 'true';
						var suggestionClicked = suggestionButton
								.getAttribute('data-clicked') === 'true';

						if (suggestionClicked) {
							suggestionButton
									.setAttribute('data-clicked', false);
							document.getElementById('suggestion-count').textContent = suggestionCount - 1;
						}

						this.setAttribute('data-clicked',
								!notRecommendedClicked);
						document.getElementById('notRecommended-count').textContent = !notRecommendedClicked ? notRecommendedCount + 1
								: notRecommendedCount - 1;
						
						sendReaction(postIdx, '비추천');
					});
</script>


</html>
