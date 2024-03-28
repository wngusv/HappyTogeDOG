package SMS;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SMS {

    private final DefaultMessageService messageService;

    public SMS() {
        // 김가영 API(각자 api로 하세여)
        this.messageService = NurigoApp.INSTANCE.initialize("NCSKIZHZFDZGQKXZ", "BH28ZNFRERVOMLBYBFVEUMPIGP05UJPV", "https://api.coolsms.co.kr");
    }

    public SingleMessageSentResponse sendSMS() {
        // SMS 메시지를 생성합니다.
        Message message = new Message();
        message.setFrom("01023229753");  // 실제 발신번호를 입력해야 합니다.
        message.setTo("01023229753");    // 전화번호 입력한 값 들고와야됨
        message.setText("뭘봐"); // 인증번호 랜덤 문자열 보내기

        // 메시지를 발송하고 응답을 받습니다.
        return this.messageService.sendOne(new SingleMessageSendingRequest(message));
    }

    // 메인 메소드는 예시로 작성됩니다. 실제 사용 시에는 이 부분을 적절히 조정하시기 바랍니다.
    public static void main(String[] args) {
        SMS sms = new SMS();
        SingleMessageSentResponse smsResponse = sms.sendSMS();
        System.out.println(smsResponse);
    }
}
