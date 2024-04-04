package carpool;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardData {
	  private String title;
      private String content;
      private String mapState;
      private String id;
}
