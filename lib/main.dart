import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/admin/admin_login.dart';
import 'package:food_app/admin/home_admin.dart';
import 'package:food_app/firebase_options.dart';

import 'package:food_app/pages/bottomnav.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/pages/login.dart';
import 'package:food_app/pages/onboard.dart';
import 'package:food_app/pages/signup.dart';
import 'package:food_app/widget/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    Stripe.publishableKey = publishableKey;
  } else {
    print('Stripe không hỗ trợ trên web.');
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Onboard(),
    );
  }
}
