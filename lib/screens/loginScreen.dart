import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signupcreen.dart';
//import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _auth= FirebaseAuth.instance;
final emailcontroller=TextEditingController();
final pwdcontroller=TextEditingController();
String email="";
String password="";
void sign() async
{
 await _auth.signInWithEmailAndPassword(email: email, password: password);
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
}
@override
Widget build(BuildContext context) {
return Material(child: Container
          (
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(70),
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
              child:Column(
                children:<Widget>[
                  Text("Flu-Mail",style: TextStyle(fontSize :40,fontWeight:FontWeight.bold),),
                  SizedBox(height:120),
                  Container(
                  
                    width: MediaQuery.of(context).size.width,

                    child: TextField(
                      onChanged: (value)
                      {
                        email=value;
                      },
                      decoration: InputDecoration(
                        hintText: "UserEmail",
                        filled: true,
                        border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15),
                        
                    )),),

                  ),
                  SizedBox(height:20),
                  Container(
                  
                    width: MediaQuery.of(context).size.width,

                    child: TextField(
                        obscureText:true,
                      onChanged: (value)
                      {
                        password=value;
                      },
                    
                      decoration: InputDecoration(
                        hintText: "Password",
                         // obscureText:true,
                        filled: true,
                        border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15),
                        
                    )),)
                  

                  ),
                  SizedBox(height:100),
                  RaisedButton(
                  onPressed:(){
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SignUpScreen())) ;  
                  },child:Text("Create an account")),
                  SizedBox(height:20),
                  RaisedButton(onPressed: sign,child:Text("Login")),
                   ]
              )
          )
      //  appBar: AppBar(),
       
    );
  }
}