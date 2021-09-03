

import 'package:hive/hive.dart';
import 'package:local_database_2/model/user_model.dart';

// #User service class
class HiveDBUser{

  var box = Hive.box("SignIn");

  void storeUser(User user){
    box.put("user", user.toJson());
  }
  
  User loadUser(){
    var user = User.fromJson(box.get("user"));
    return user;
  }

  void removeUser(){
    box.delete("user");
  }

  // #Account service class
}
 class HiveDBAccount{

  var box = Hive.box("SignUp");

  void storeAccount(Account account){
    box.put("account", account.toJson());
  }
  Account loadAccount(){
    var account = Account.fromJson(box.get("account"));
    return account;
  }

  void removeAccount(){
    box.delete("account");
  }
 }


