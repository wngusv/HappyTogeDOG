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
	private String uprCd;
	private String orgCd;
	private String orgdownNm;

	@Override
	public String toString() {
		return "LocalGovernment [uprCd=" + uprCd + ", orgCd=" + orgCd + ", orgdownNm=" + orgdownNm + "]";
	}
}