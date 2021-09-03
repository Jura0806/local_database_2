import 'package:flutter/material.dart';
import 'package:local_database_2/model/user_model.dart';
import 'package:local_database_2/services/user_service.dart';

import 'home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static final String id = "account_page";

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final _emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

   void doSignUp(){
   String email = _emailController.text.toString().trim();
   String number = numberController.text.toString().trim();
   String address = addressController.text.toString().trim();

   var account = Account(email: email, number: number, address: address);

   HiveDBAccount().storeAccount(account);

   var account2 = HiveDBAccount().loadAccount();

   print(account2.email);
   print(account2.number);
   print(account2.address);

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, left: 30),
            color: Colors.teal ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("Welcome", style: TextStyle(color: Colors.tealAccent.withOpacity(.5), fontSize: 20),),
                SizedBox(height: 10,),
                Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 35, right: 35, bottom: 20, top: 20),
                height: MediaQuery.of(context).size.width *1.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    Text("Email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    creatSignIn(hintText: "Email", controller: _emailController),
                    SizedBox(height: 35,),
                    Text("Number ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    creatSignIn(hintText: "Phone Number",controller: numberController),
                    SizedBox(height: 35,),
                    Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    creatSignIn(hintText: "your Address",controller: addressController),
                    SizedBox(height: 30,),
                    Center(child: Text("Forget Password ?", style: TextStyle(color: Colors.grey.shade300, fontSize: 18),)),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: doSignUp,
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.lerp(BorderRadius.circular(10), BorderRadius.circular(10), 20),
                          color: Colors.teal,
                        ),
                        child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 33*MediaQuery.of(context).size.width/100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: .7, color: Colors.grey.shade200,
                              )
                          ),
                        ),
                        Text("      OR      ", style: TextStyle(color: Colors.grey.shade300),),
                        Container(
                          width: 33*MediaQuery.of(context).size.width/100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: .7, color: Colors.grey.shade200,
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("f", style: TextStyle(color: Colors.indigo, fontSize: 23, fontWeight: FontWeight.bold),),
                        SizedBox(width: 55,),
                        Container(child: Image.asset("assets/images/twitter.png", height: 17,)),
                        SizedBox(width: 55,),
                        Container(child: Image.asset("assets/images/insta.png", height: 15,)),
                      ],
                    ),
                    SizedBox(height: 45,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?", style: TextStyle(color: Colors.grey.shade300, fontSize: 17),),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, HomePage.id);
                          },
                          child: Text("SignIn", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget creatSignIn({hintText, controller}){
    return  Container(
      child: TextField(
        controller: controller,
        showCursor: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade300),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
