import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class UserDay
{
  
  storeUser(email,password,profilepic)
  {
  
   // ignore: deprecated_member_use
   Firestore.instance.collection('users').document(email).setData({
    'email':email,
     'password':password, 
     'profilepic':profilepic 
   });
  }
}