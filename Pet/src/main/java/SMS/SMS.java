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

    public SingleMessageSentResponse sendSMS() {
        // SMS 메시지를 생성합니다.
        Message message = new Message();
        message.setFrom("01023229753"); // 발신번호
        message.setTo("01023229753");   // 수신번호 (실제로는 사용자 입력값을 사용)

        // 5자리 랜덤 숫자 생성 및 설정
        int randomNumber = (int)(Math.random() * 90000) + 10000; // 10000 ~ 99999 사이의 숫자
        String textMessage = "인증번호는 " + randomNumber + "입니다.";
        System.out.println(textMessage);
        message.setText(textMessage);

        // 메시지를 발송하고 응답을 받습니다.
        return this.messageService.sendOne(new SingleMessageSendingRequest(message));
    }


    /*
    // 메인 메소드
    public static void main(String[] args) {
        SMS sms = new SMS();
        SingleMessageSentResponse smsResponse = sms.sendSMS();
        System.out.println(smsResponse);
    }*/
}
