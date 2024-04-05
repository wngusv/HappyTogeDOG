package carpool;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Post {
	private int id;
	private String title;
	private String content;
	private String userId; // 작성자 ID
	private String createdAt; // 생성 시간
	private String mapstate;
}