import 'dart:developer';

import 'package:clients_debts/views/screens/clients_screen.dart';
import 'package:clients_debts/views/screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/clients_controller.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   Get.put(AddClientsController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('=========User is currently signed out!');
      } else {
        log('========User is signed in!');
      }
    });
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         popupMenuTheme: const PopupMenuThemeData(
          color: Colors.white,
        ),
       
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: HexColor('efeee5'),
        appBarTheme: AppBarTheme(backgroundColor: HexColor('efeee5')),
        cardTheme: const CardTheme(color: Colors.white),
       
        useMaterial3: true,
      ),
      home:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text("there Error");
          }
          // ignore: unnecessary_null_comparison
          if (snapshot.data == null) {
            return const LoginScreen();
          }
          if (snapshot.hasData) {
            log(snapshot.data.toString());
            return const ClientsScreen();
          }
          return const Text("");
        },
      ), 
    );
  }
}

