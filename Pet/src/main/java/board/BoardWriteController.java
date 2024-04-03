// 이거 없어도 되는 건ㄷ강

//package board;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//@WebServlet("/boardWrite.do")
//public class BoardWriteController extends HttpServlet {
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		 // 멀티파트 요청 확인
//        if (ServletFileUpload.isMultipartContent(request)) {
//            try {
//                DiskFileItemFactory factory = new DiskFileItemFactory();
//                ServletFileUpload upload = new ServletFileUpload(factory);
//
//                List<FileItem> formItems = upload.parseRequest(request);
//                String category = null;
//                String title = null;
//                String content = null;
//
//                if (formItems != null && !formItems.isEmpty()) {
//                    for (FileItem item : formItems) {
//                        if (item.isFormField()) {
//                            // 일반 폼 필드 처리
//                            String fieldName = item.getFieldName();
//                            String fieldValue = item.getString("UTF-8");
//
//                            if ("category".equals(fieldName)) {
//                                category = fieldValue;
//                            } else if ("title".equals(fieldName)) {
//                                title = fieldValue;
//                            } else if ("content".equals(fieldName)) {
//                                content = fieldValue;
//                            }
//                        } else {
//                            // 파일 처리
//                            String fileName = item.getName();
//                            // 파일 저장 로직 구현
//                        }
//                    }
//                }
//                
//                // 여기서 category, title, content, fileName을 사용하여 처리
//                // 예: 데이터베이스에 저장, 로직 실행 등
//
//            } catch (Exception e) {
//                throw new ServletException("파일 업로드 처리 중 오류 발생", e);
//            }
//        }
//        
//
//        // 응답에 대한 콘텐츠 타입 및 캐릭터 인코딩 설정
//        response.setContentType("text/html; charset=UTF-8");
//        
////		PrintWriter out = response.getWriter();
////		out.println("디비로 가라");
//	}
//
//}
