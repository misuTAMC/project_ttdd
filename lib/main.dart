import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAlPf29itctx6XJ84ESYmIBDMwV_VKSyrM",
        appId: "1:264286272522:web:ac308477878b527642f3f3",
        messagingSenderId: "264286272522",
        projectId: "tinhtoandidong-d59ac",
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAlPf29itctx6XJ84ESYmIBDMwV_VKSyrM",
        appId: "1:264286272522:web:ac308477878b527642f3f3",
        messagingSenderId: "264286272522",
        projectId: "tinhtoandidong-d59ac",
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WelComeScreen(),
      ),
    );
  }
}
