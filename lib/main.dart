import 'package:flutter/material.dart';
import 'package:kita_usaha_app/camera_audio.dart';
import 'package:kita_usaha_app/home.dart';

import 'cc_kits.dart';
import 'create_account.dart';
import 'live_menu.dart';
import 'login_page.dart';
import 'stream_history.dart';
import 'stream_report.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const CreateAccountPage(),
        '/home': (context) => const HomeMenuPage(),
        '/livemenu': (context) => LiveShoppingPage(),
        '/cameraaudio': (context) => CameraAudioSettingPage(),
        '/streamreport': (context) => StreamReportPage(),
        '/streamhistory': (context) => StreamHistoryPage(),
        '/cckits': (context) => CCKitsPage(),
      },
    );
  }
}
