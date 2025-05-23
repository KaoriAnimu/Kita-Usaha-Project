import 'package:flutter/material.dart';
import 'package:kita_usaha_app/camera_audio.dart';
import 'package:kita_usaha_app/f_schedule.dart';
import 'package:kita_usaha_app/home.dart';
import 'package:kita_usaha_app/open_partner.dart';
import 'package:kita_usaha_app/regis_umkm.dart';
import 'package:kita_usaha_app/saty.dart';
import 'package:kita_usaha_app/smart_ads.dart';
import 'package:kita_usaha_app/success_bund.dart';
import 'package:kita_usaha_app/trade-insight.dart';
import 'package:kita_usaha_app/umkm.dart';
import 'package:kita_usaha_app/umkm_fes.dart';

import 'ads.dart';
import 'cc_kits.dart';
import 'coffeeshop.dart';
import 'create_account.dart';
import 'ig_feeds.dart';
import 'live_menu.dart';
import 'login_page.dart';
import 'logo_design.dart';
import 'margin_wiz.dart';
import 'stream_history.dart';
import 'stream_report.dart';
import 'video_ads.dart';

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
        '/coffeeshop': (context) => CoffeeShopPage(),
        '/ads': (context) => AdsPage(),
        '/igf': (context) => IGFeedsPage(),
        '/vads': (context) => VAdsPage(),
        '/lgds': (context) => LogoDesignPage(),
        '/mw': (context) => MarginWizardPage(),
        '/sb': (context) => PricingPage(),
        '/sa': (context) => SmartAdsPage(),
        '/saty': (context) => SmartAdsThankYouPage(),
        '/op': (context) => const OpenPartnershipPage(),
        '/umkm': (context) => const CreateUmkmPage(),
        '/uf': (context) => UMKMFesPage(),
        '/rum': (context) => RegUMKMPage(),
        '/fs': (context) => FSPage(),
        '/ts': (context) => const TSPage(),
      },
    );
  }
}
