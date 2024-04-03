package board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUtil {

	// 파일 업로드
	public static String uploadFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException{
		Part part = req.getPart("oFile");
		String partHeader = part.getHeader("content-disposition");
		String[] phArr = partHeader.split("filename=");
		String originalFileName = phArr[1].trim().replace("\"", "");
		if(!originalFileName.isEmpty()) {
			part.write(sDirectory+ File.separator +originalFileName);
		}
		return originalFileName;
	}
	
	// 파일명 변경 메소드
	public static String renameFile(String sDirectory, String fileName) {
	    int lastDotIndex = fileName.lastIndexOf(".");
	    String ext = ""; // 확장자 기본값은 빈 문자열로 설정

	    if (lastDotIndex != -1) {
	        // 확장자가 존재하면 추출
	        ext = fileName.substring(lastDotIndex);
	    }

	    // 새 파일명 생성 (현재 날짜와 시간을 사용)
	    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	    String newFileName = now + ext; // 확장자 추가

	    // 파일명 변경
	    File oldFile = new File(sDirectory + File.separator + fileName);
	    File newFile = new File(sDirectory + File.separator + newFileName);
	    oldFile.renameTo(newFile);
	    
	    return newFileName;
	}

}
