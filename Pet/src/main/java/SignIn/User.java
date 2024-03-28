package SignIn;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

   String Id;
   String Password;
   String Name;
   String PhoneNumber;
   String address;
   String address_detail;

}