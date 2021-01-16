import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/homeScreen.dart';
import './screens/loginScreen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
   
    @override
     _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme1 =false;
  void changetheme()
  {
    setState(() {
       theme1=!theme1;
    });
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme1?ThemeData.dark():ThemeData.light(),
      home:  StreamBuilder(
      // ignore: deprecated_member_use
          stream:FirebaseAuth.instance.onAuthStateChanged,
          builder: (context,userSnapshot){
                        if(userSnapshot.hasData)
                            {
                              return HomeScreen(changetheme);
}
        return LoginScreen();
      },
    ),
        );
        }
        }


