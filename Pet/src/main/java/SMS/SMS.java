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
 // SMS.java 수정
    public int sendSMS(String phoneNumber) {
        int randomNumber = (int)(Math.random() * 90000) + 10000;
        String textMessage = "인증번호는 " + randomNumber + "입니다.";
        
        Message message = new Message();
        message.setFrom("01023229753");
        message.setTo(phoneNumber);
        message.setText(textMessage);
        
        this.messageService.sendOne(new SingleMessageSendingRequest(message));
        return randomNumber; // 생성된 랜덤 인증번호 반환
    }



}
