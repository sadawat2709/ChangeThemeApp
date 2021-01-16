import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
 final  Function changetheme;
 HomeScreen(this.changetheme);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout()
  {
    FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      appBar: AppBar(
        actions: [   
                     
                     DropdownButtonHideUnderline(
                      child: DropdownButton(
              
                      icon: Icon(Icons.more_vert), 
                      items: [
                        
                          DropdownMenuItem(
                          value: "Theme",
                          child: Text("Theme")),
                          DropdownMenuItem(value:"Logout",child: Text("Logout"))
                              ],
                      onChanged: (itemIdentifier)
                      {
                         if(itemIdentifier=='Theme')
                         {
                              widget.changetheme();
                         }
                         if(itemIdentifier=='Logout')
                         {
                               logout();
                         }
                      },),)],
        title: Text("Informatic",style: TextStyle(fontWeight:FontWeight.bold ),),),);
  
  }
}