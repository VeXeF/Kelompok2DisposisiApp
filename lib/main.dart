// ignore_for_file: prefer_const_constructors

import 'package:DisApp/homepage.dart';
import 'package:DisApp/login.dart';
import 'package:DisApp/register.dart';
import 'package:DisApp/suratmasuk2.dart';
import 'package:DisApp/suratmasuk3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    MaterialApp( 
      title: 'DisApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SuratMasuk3(),
      routes: {
        '/login/': (context) => const LoginPage(),
        '/register/': (context) => const RegisterPage(),
        '/home/': (context) => const HomePage(userAccesstoken: null,)
      },
    ),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(milliseconds: 50 ));
}

Future<void> pop({bool? animated}) async {
  await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
}

class MainFile extends StatelessWidget {
  MainFile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const LoginPage();
        default:
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
