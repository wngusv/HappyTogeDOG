package LocalSite;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LocalGovernment {
	private String uprCd; //시도 코드
	private String orgCd; //시군구 코드
	private String orgdownNm; //시군구 이름

	@Override
	public String toString() {
		return "LocalGovernment [uprCd=" + uprCd + ", orgCd=" + orgCd + ", orgdownNm=" + orgdownNm + "]";
	}
}