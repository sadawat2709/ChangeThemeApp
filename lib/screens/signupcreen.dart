import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import '../image/imagepicker.dart';
import '../models/userday.dart';

import './loginScreen.dart';
import 'package:flutter/services.dart';
import 'dart:io';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 //final _auth= FirebaseAuth.instance;
 final emailcontroller=TextEditingController();
 final pwdcontroller=TextEditingController();
 final repwdcontroller=TextEditingController();
  String email="";
  String password="";
  String repassword="";
  File image;
  bool isLogin=FirebaseAuth.instance.currentUser==null?false :true;
  File userpickImage;
  String downloadpic;
void _pickImage(File image)
  {
   userpickImage=image;
  }
uploadImage()  async
{  


  FirebaseStorage storage=FirebaseStorage.instance; 
    Reference ref1=storage.ref();
    UploadTask storage1=ref1.child("path").child(email+".JEPG").putFile(userpickImage);
    TaskSnapshot snapshot = await storage1;
    String downloadpic=await snapshot.ref.getDownloadURL();
  
   // String downloadpic="";
    return downloadpic;

                    }
                    void submit() async
                    {
                    try{
                        String  downloadPic= await uploadImage();
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email:email ,password:password).
                        then((signeduser) => UserDay().storeUser(email, password,downloadPic));
                         //print(email);
                        Navigator.pop(context);
                        
                    } 
                    on PlatformException catch (err) {
                          var message = 'An error occurred, pelase check your credentials!';
                    
                          if (err.message != null) {
                            message = err.message;
                          }
                          }
                          catch (err) {
                         print(err);
                          
                    
                          
                        }
                        
                        
                        }
                    
                    
                      @override
                      Widget build(BuildContext context) {
                        return 
                    
                           Material(
                            // key: _scaffoldKey,
                              child: Container
                              (
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(70),
                                 height: MediaQuery.of(context).size.height,
                                 width: MediaQuery.of(context).size.width,
                                  child:Column(
                                    children:<Widget>[
                                      Text("Flu-Mail",style: TextStyle(fontSize :40,fontWeight:FontWeight.bold),),
                                      SizedBox(height:20),
                                       UserImage(_pickImage),
                                      SizedBox(height:30),
                                      Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: TextField(
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                            hintText: "UserEmail",
                                            filled: true,
                                            border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(15),
                                            ),),
                                         onChanged: (value)
                                          {
                                            email=value;
                                          }),
                    
                                      ),
                                      SizedBox(height:3),
                                      Container(
                                       width: MediaQuery.of(context).size.width,
                                       child: TextField(
                                          onChanged: (value)
                                          {
                                            password=value;
                                          },
                                          obscureText: true,
                                          controller: pwdcontroller,
                                          
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            
                                            filled: true,
                                            border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(15),
                                            
                                        )),)
                                        ),
                                      SizedBox(height:5),
                                        Container(
                                      
                                        width: MediaQuery.of(context).size.width,
                    
                                        child: TextField(
                                          onChanged: (value) 
                                          {
                                            repassword=value;
                                          },
                                          controller: repwdcontroller,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                          hintText: "ReenterPassword",
                                          filled: true,
                                          border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(15),
                                          )),)),
                                      SizedBox(height:40),
                                      RaisedButton(
                                      onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                                        LoginScreen()
                              )) ; },
                                      child:Text(" you already have an account")),
                                      SizedBox(height:5),
                                      RaisedButton(onPressed:submit,child:Text("SignUp"))
                    
                                    ]
                                  )
                              )
                          //  appBar: AppBar(),
                           
                        );
                        
                      }
                    }
                
          
