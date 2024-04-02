package SMS;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SMS {

    private final DefaultMessageService messageService;
    private static Properties properties = new Properties();
    
    public SMS() {
    	System.out.println("sms 프로퍼티 설정 파일을 읽습니다.");
    	InputStream inputStream = SMS.class.getResourceAsStream("api.properties");
    	try (BufferedInputStream br = new BufferedInputStream(inputStream)) {
			properties.load(br);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
    	
        try {
            // API 초기화
            this.messageService = NurigoApp.INSTANCE.initialize(properties.getProperty("KEY"), properties.getProperty("SECRET"), properties.getProperty("URL"));
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
              message.setFrom( properties.getProperty("PHONE"));

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
