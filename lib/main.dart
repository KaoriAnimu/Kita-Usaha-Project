import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(const KitaUsahaApp());
}

class KitaUsahaApp extends StatelessWidget {
  const KitaUsahaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KitaUsaha',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
