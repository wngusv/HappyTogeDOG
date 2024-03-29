package SMS;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SMS {

    private final DefaultMessageService messageService;

    public SMS() {
        // API 초기화
        this.messageService = NurigoApp.INSTANCE.initialize("NCSKIZHZFDZGQKXZ", "BH28ZNFRERVOMLBYBFVEUMPIGP05UJPV", "https://api.coolsms.co.kr");
    }

    // 전화번호를 매개변수로 받는 sendSMS 메서드
    public SingleMessageSentResponse sendSMS(String phoneNumber) {
        Message message = new Message();
        message.setFrom("01023229753"); // 발신번호, 실제 발신 가능한 번호로 설정해야 함
        message.setTo(phoneNumber); // 사용자로부터 전달받은 수신번호

        // 5자리 랜덤 숫자 생성
        int randomNumber = (int)(Math.random() * 90000) + 10000;
        String textMessage = "인증번호는 " + randomNumber + "입니다.";
        message.setText(textMessage);

        // 메시지 발송 및 결과 반환
        return this.messageService.sendOne(new SingleMessageSendingRequest(message));
    }


}
