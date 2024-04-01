	package LocalStrays;

import java.util.List;

public class AnimalResponse {
	private Response response;

	public Response getResponse() {
		return response;
	}

	public void setResponse(Response response) {
		this.response = response;
	}

	public static class Response {
		private Header header;
		private Body body;

		public Header getHeader() {
			return header;
		}

		public void setHeader(Header header) {
			this.header = header;
		}

		public Body getBody() {
			return body;
		}

		public void setBody(Body body) {
			this.body = body;
		}
	}

	public static class Header {
		private int reqNo;
		private String resultCode;
		private String resultMsg;

		public int getReqNo() {
			return reqNo;
		}

		public void setReqNo(int reqNo) {
			this.reqNo = reqNo;
		}

		public String getResultCode() {
			return resultCode;
		}

		public void setResultCode(String resultCode) {
			this.resultCode = resultCode;
		}

		public String getResultMsg() {
			return resultMsg;
		}

		public void setResultMsg(String resultMsg) {
			this.resultMsg = resultMsg;
		}
	}

	public static class Body {
		private Items items;

		public Items getItems() {
			return items;
		}

		public void setItems(Items items) {
			this.items = items;
		}
	}

	public static class Items {
		private List<Animal> item;

		public List<Animal> getItem() {
			return item;
		}

		public void setItem(List<Animal> item) {
			this.item = item;
		}
	}
}