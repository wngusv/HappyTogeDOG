package SignIn;

import lombok.Builder;
import lombok.Data;

@Data

@Builder
public class User {

	String Id;
	String Password;
	String Name;
	String PhoneNumber;
	String address;

}