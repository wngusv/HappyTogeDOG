<%@page import="board.contentDAO"%>
<%@page import="Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="board.contentDTO"%>
<%@ include file="/floating-banner.jsp"%>
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
/* 테이블의 <th> 요소 배경색과 텍스트 색상 변경 */
.table-fixed th {
    background-color: rgb(111, 94, 75); /* 배경색 변경 */
    color: white; /* 텍스트 색상 변경 */
}

.custom-green-button {
	background-color: rgb(149, 204, 143); /* 버튼 배경색 */
	border-color: transparent; /* 버튼 테두리 색상 */
	color: black; /* 버튼 내 텍스트 색상 */
}

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

#print {
	float: right; /* 버튼을 오른쪽으로 정렬 */
	padding: 5px 10px; /* 패딩을 조정하여 버튼 크기를 조절 */
	font-size: 0.9rem; /* 글자 크기 줄이기 */
	margin-top: 20px; /* 상단 여백 */
}

/* 공유 버튼 및 인쇄 버튼 컨테이너 스타일 */
.print-container {
	text-align: right;
	margin-top: 20px;
}

.print-container a, .print-container input {
	display: inline-block; /* 인라인 블록으로 설정 */
	margin-right: 10px; /* 오른쪽 여백 */
}

/* 반응 버튼과 카운트를 가운데 정렬 */
.reactions {
	text-align: center;
}

/* 댓글 입력 섹션 스타일 */
.comment-section {
	border: 1px solid #ddd; /* 테두리 */
	padding: 15px; /* 내부 패딩 */
	background-color: #f9f9f9; /* 배경색 */
	margin-top: 30px; /* 위 여백 */
}

/* 댓글 작성자 아이디 라벨 스타일 */
.comment-section .user-id {
	 background-color: #004225; /* 진한 녹색 배경 */
    color: white; 
    padding: 5px 10px; /* 패딩 유지 */
    border-radius: 5px; /* 모서리 둥글기 유지 */
    font-size: 0.8rem; /* 폰트 크기 유지 */
    display: inline-block; /* 디스플레이 유형 유지 */
    margin-bottom: 10px; /* 아래 여백 유지 */
}

/* 댓글 입력 박스 스타일 */
.comment-section textarea {
	width: 100%; /* 너비 100% */
	border: none; /* 테두리 없앰 */
	border-radius: 4px; /* 모서리 둥글기 */
	margin-top: 5px; /* 위 여백 */
	padding: 10px; /* 내부 패딩 */
	font-size: 1rem; /* 폰트 크기 */
}

/* 댓글 입력 박스 포커스 시 */
.comment-section textarea:focus {
	outline: none; /* 포커스 아웃라인 제거 */
	box-shadow: 0 0 5px rgba(81, 203, 238, 1); /* 그림자 효과 */
}

/* 댓글 작성 버튼 스타일 */
.comment-section button {
	float: right; /* 오른쪽 정렬 */
	background-color: gray; /* 배경색 */
	color: white; /* 텍스트 색상 */
	border: none; /* 테두리 없앰 */
	border-radius: 3px; /* 모서리 둥글기 */
	padding: 5px 15px; /* 패딩 */
	margin-top: 18px; /* 위 여백 */
	font-size: 0.7rem; /* 폰트 크기 */
	cursor: pointer; /* 커서 포인터 모양 */
}

/* 부트스트랩 클래스에 적용되는 스타일을 오버라이드하기 위한 CSS */
.table-fixed {
	table-layout: fixed;
	width: 100%;
}

/* 클래스를 통해 열 너비를 조정 */
.col-user {
	width: 13%;
}

.col-comment {
	width: 57%;
}

.col-date {
	width: 15%;
}

.col-like, .col-dislike {
	width: 10%;
}

/* 버튼 포커스 시 테두리 제거 */
.reaction-button:focus {
	outline: none;
	box-shadow: none;
}

</style>
<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
</head>
<body style="background-color: rgb(254, 247, 222);">
	<%
	String idx = request.getParameter("idx");
	int recommendationCount = 0;
	int notRecommendationCount = 0;
	int postIdx = 0;

	if (idx != null && !idx.isEmpty()) {
		try {
			postIdx = Integer.parseInt(idx);

			String sqlRec = "SELECT COUNT(*) AS rec_count FROM comment WHERE post_idx = ? AND type = '추천'";
			String sqlNotRec = "SELECT COUNT(*) AS not_rec_count FROM comment WHERE post_idx = ? AND type = '비추천'";

			try (Connection conn = MyWebContextListener.getConnection();
			PreparedStatement psmtRec = conn.prepareStatement(sqlRec);
			PreparedStatement psmtNotRec = conn.prepareStatement(sqlNotRec)) {

		psmtRec.setInt(1, postIdx);
		psmtNotRec.setInt(1, postIdx);

		try (ResultSet rsRec = psmtRec.executeQuery()) {
			if (rsRec.next()) {
				recommendationCount = rsRec.getInt("rec_count");
			}
		}

		try (ResultSet rsNotRec = psmtNotRec.executeQuery()) {
			if (rsNotRec.next()) {
				notRecommendationCount = rsNotRec.getInt("not_rec_count");
			}
		}
			}

			contentDAO dao = new contentDAO();
			List<contentDTO> commentsList = dao.selectContents(String.valueOf(postIdx));
			request.setAttribute("commentsList", commentsList);

		} catch (NumberFormatException e) {
			// 숫자 변환 실패 시의 오류 처리
			e.printStackTrace();
			// 예: 오류 페이지로 리디렉션 또는 오류 메시지 출력
		} catch (SQLException e) {
			// SQL 예외 처리
			e.printStackTrace();
		}
	} else {
		// idxx가 null이거나 비어 있는 경우의 처리
		// 예: 오류 페이지로 리디렉션 또는 오류 메시지 출력
	}
	%>


	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<%
				// String idx = request.getParameter("idx");
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
				<h2 class="post-title" style="color: black;"><%=title%></h2>

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
				<img src="<%=request.getContextPath()%>/image/<%=sfile%>"
					alt="게시글 사진" class="img-fluid post-image">
				<%
				}
				%>

				<div class="reactions">

					<!-- 추천 버튼 -->
					<button type="button" id="suggestion-button"
						class="reaction-button"
						onclick="sendReaction('<%=postIdx%>', '추천')">
						<img src="images/강아지추천.PNG" alt="추천"
							style="height: 50px; width: 50px;">
					</button>

					<span id="suggestion-count" class="reaction-count"
						style="font-size: 20px;"><%=recommendationCount%></span>

					<!-- 비추천 버튼 -->
					<button type="button" id="notRecommended-button"
						class="reaction-button"
						onclick="sendReaction('<%=postIdx%>', '비추천')">
						<img src="images/강아지비추천.PNG" alt="비추천"
							style="height: 50px; width: 50px;">
					</button>

					<span id="notRecommended-count" class="reaction-count"
						style="font-size: 20px;"><%=notRecommendationCount%></span>
				</div>


				<!-- 공유, 인쇄 버튼 추가 -->
				<div class="print-container">
					<a href="#"
						onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						target="_blank" alt="Share on Naver"><img
						src="images/네이버 블로그 로고.PNG" width="25" alt="네이버 블로그 공유"></a> <a
						href="#"
						onclick="javascript:window.open('http://band.us/plugin/share?body='+encodeURIComponent(document.title)+encodeURIComponent('\r\n')+encodeURIComponent(document.URL)+'&route='+encodeURIComponent(document.URL), 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"
						target="_blank" alt="네이버 밴드 공유하기"><img
						src="images/네이버 밴드 로고.PNG" width="25px" alt='네이버 밴드 공유'></a> <a
						href="#"
						onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						target="_blank" alt="Share on Facebook"><img
						src="images/페북 로고.jpg" width="25" alt="페이스북 공유"></a> <a href="#"
						onclick="window.print(); return false;"><img
						src="images/인쇄.png" width="25" alt="인쇄"> </a>
				</div>
				<br>

				<!-- 댓글 섹션 -->
				<div class="comment-section">
					<!-- 댓글 입력 폼 -->
					<form action="/commentContent.do" method="post"
						onsubmit="return validateCommentForm()">
						<%
						String userId = (String) session.getAttribute("userId");
						%>
						<div class="user-id">
							<%=userId != null ? userId : "로그인 후 사용 가능합니다."%>
							<!-- 사용자 아이디 표시 -->
						</div>
						<!-- postIdx를 전송하기 위한 숨겨진 필드 -->
						<input type="hidden" name="postIdx" value="<%=idx%>">

						<textarea id="comment-input" name="comment" class="form-control"
							rows="3" placeholder="댓글을 입력하세요..."></textarea>
						<button type="submit" class="btn btn-primary mt-2"style="background-color: rgb(111, 94, 75); border-color: rgb(111, 94, 75);">등록</button>
					</form>
				</div>

				<br>
				<br>
				<br>
				<button type="button" class="custom-green-button"
					onclick="sortComments('latest')">최신순</button>
				<button type="button" class="custom-green-button"
					onclick="sortComments('mostLiked')">좋아요순</button>

				<table class="table table-fixed">
					<thead>
						<tr>
							<th class="col-user">사용자 이름</th>
							<th class="col-comment">댓글</th>
							<th class="col-date">날짜</th>
							<th class="col-like">좋아요</th>
							<th class="col-dislike">싫어요</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<contentDTO> comments = (List<contentDTO>) request.getAttribute("commentsList");
						if (comments != null) {
							for (contentDTO comment : comments) {
						%>
						<tr>
							<td><%=comment.getId()%></td>
							<td><%=comment.getContent()%></td>
							<td><%=comment.getContent_time()%></td>
							<td>
								<button type="button" class="reaction-button"
									onclick="handleReaction(<%=comment.getNum()%>, '좋아요')">
									<img src="images/강아지좋아요.PNG" alt="좋아요"
										style="height: 30px; width: 30px;">
								</button> <span id="like-count-<%=comment.getNum()%>"><%=comment.getLike()%></span>
							</td>

							<td>
								<button type="button" class="reaction-button"
									onclick="handleReaction(<%=comment.getNum()%>, '싫어요')">
									<img src="images/강아지싫어요.PNG" alt="싫어요"
										style="height: 30px; width: 30px;">
								</button> <span id="dislike-count-<%=comment.getNum()%>"><%=comment.getDislike()%></span>
							</td>

						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>

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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<%@ include file="/WEB-INF/footer.jsp"%>
</body>
<script>
var userId = '<%=(session.getAttribute("userId") != null) ? session.getAttribute("userId") : ""%>';
var postIdx = <%=idx%>; // 게시글 idx

//댓글 정렬 요청을 보내고 응답을 처리하는 함수
function sortComments(orderType) {
    fetch('/commentSortServlet.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'orderType=' + orderType + '&postIdx=' + postIdx
    })
    .then(response => response.json())
    .then(data => {
        updateTable(data); // 테이블 업데이트 함수 호출
    })
    .catch(error => console.error('Error:', error));
}

// 테이블을 업데이트하는 함수
function updateTable(comments) {
    var tableBody = document.querySelector('.table.table-fixed tbody');
    tableBody.innerHTML = '';

    comments.forEach(comment => {
        var row = '<tr>' +
                    '<td>' + comment.id + '</td>' +
                    '<td>' + comment.content + '</td>' +
                    '<td>' + comment.content_time + '</td>' +
                    '<td>' +
                        '<button type="button" class="reaction-button" onclick="handleReaction(' + comment.commentNum + ', \'좋아요\')">' +
                            '<img src="images/강아지좋아요.PNG" alt="좋아요" style="height: 30px; width: 30px;">' +
                        '</button>' + 
                        '<span id="like-count-' + comment.commentNum + '">' + comment.like + '</span>' +
                    '</td>' +
                    '<td>' +
                        '<button type="button" class="reaction-button" onclick="handleReaction(' + comment.commentNum + ', \'싫어요\')">' +
                            '<img src="images/강아지싫어요.PNG" alt="싫어요" style="height: 30px; width: 30px;">' +
                        '</button>' +
                        '<span id="dislike-count-' + comment.commentNum + '">' + comment.dislike + '</span>' +
                    '</td>' +
                  '</tr>';
        tableBody.innerHTML += row;
    });
}



function sendReaction(postId, type) {
    if (userId === "") {
        alert("로그인 후 이용 가능합니다.");
        return;
    }
    
    const params = new URLSearchParams();
    params.append('postIdx', postId);
    params.append('action', type);

    fetch('/comment.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params
    })
    .then(response => {
        if(response.ok) {
            return response.json();
        }
        throw new Error('Network response was not ok.');
    })
    .then(data => {
        if(data.status === 'success') {
            // 서버로부터 반환된 카운트로 페이지를 업데이트
            document.getElementById('suggestion-count').innerText = data.recommendationCount;
            document.getElementById('notRecommended-count').innerText = data.notRecommendationCount;
        } else {
            // 에러 처리
            console.error('Failed to update reaction');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}


   
function handleReaction(commentNum, reactionType) {
    if (!userId) {
        alert("로그인 후 사용 가능합니다.");
        window.location.href = 'login.jsp';
        return;
    }

    var url = '/likeOrDislike.do';
    var params = 'commentNum=' + commentNum + '&reactionType=' + reactionType + '&postIdx=' + postIdx;

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params
    })
    .then(response => response.json())
    .then(data => {
        if(data.status === 'success') {
            // 성공 처리: 업데이트된 좋아요와 싫어요 카운트로 페이지를 업데이트
            updateReactionCount(commentNum, data.newLikeCount, data.newDislikeCount);
        } else {
            // 실패 처리
            console.error('Failed to update ' + reactionType);
        }
    })
    .catch(error => {
        // 네트워크 오류 처리
        console.error('Error:', error);
    });
}

function updateReactionCount(commentNum, newLikeCount, newDislikeCount) {
    // 댓글에 대한 좋아요와 싫어요 카운트 업데이트
    var likeCountElement = document.getElementById('like-count-' + commentNum);
    var dislikeCountElement = document.getElementById('dislike-count-' + commentNum);

    if (likeCountElement) {
        likeCountElement.innerText = newLikeCount;
    }
    if (dislikeCountElement) {
        dislikeCountElement.innerText = newDislikeCount;
    }
}


function validateCommentForm() {
    var comment = document.getElementById('comment-input').value.trim();

    // 사용자가 로그인하지 않았거나 댓글 입력란이 비어있는 경우
    if (!userId) {
        alert("로그인 후 이용 가능합니다.");
        window.location.href = 'login.jsp';
        return false; // 폼 제출 중단
    } else if (!comment) {
        alert("댓글을 입력해주세요.");
        return false; // 폼 제출 중단
    }

    return true; // 유효성 검증 통과, 폼 제출 계속
}

</script>


</html>