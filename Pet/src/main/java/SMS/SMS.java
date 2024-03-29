package SMS;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SMS {

    private final DefaultMessageService messageService;

    public SMS() {
        try {
            // API 초기화
            this.messageService = NurigoApp.INSTANCE.initialize("NCSTNMSLB6IIG3HA", "QSLAI9UIBAAUZQDVD5ALZOOG0UBGD3DN", "https://api.coolsms.co.kr");
            System.out.println("SMS service initialized successfully.");
        } catch (Exception e) {
            System.err.println("Error initializing SMS service: " + e.getMessage());
            throw new RuntimeException(e); // 초기화 실패시 앱 실행을 중단
        }
    }

    // 전화번호를 매개변수로 받는 sendSMS 메서드
    public int sendSMS(String phoneNumber) {
    	  try {
              int randomNumber = (int)(Math.random() * 90000) + 10000;
              String textMessage = "인증번호는 " + randomNumber + "입니다.";
              System.out.println(textMessage);

              Message message = new Message();
              message.setFrom("01095173408");

              // 전화번호 설정을 확인
              if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
                  System.err.println("Phone number is null or empty.");
                  return -1;
              }
              message.setTo(phoneNumber);

              message.setText(textMessage);
              this.messageService.sendOne(new SingleMessageSendingRequest(message));

              return randomNumber;
          } catch (Exception e) {
              System.err.println("Error sending SMS: " + e.getMessage());
              return -1;
          }
    }



}
