
// #User model  for SignIn
class User{

  late String email;
  late String password;

  User({required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
    "email": email,
    "password" : password
  };
}

// #Account model for SignUp
class Account{
   late String email;
   late String number;
   late String address;

   Account({required this.email, required this.address, required this.number});

   Account.fromJson(Map<String, dynamic> json)
       : email = json["email"],
       number =  json["number"],
       address = json["address"];

   Map<String, dynamic> toJson() => {
     "email": email,
     "number": number,
     "address": address,
   };

}