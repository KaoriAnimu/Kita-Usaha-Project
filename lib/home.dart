import 'package:flutter/material.dart';

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(title: 'Live Shopping', icon: 'assets/live_shopping.png'),
      MenuItem(
          title: 'Content Creator Kits', icon: 'assets/content_creator.png'),
      MenuItem(title: 'Trade Insight', icon: 'assets/trade_insight.png'),
      MenuItem(title: 'Margin Wizard', icon: 'assets/margin_wizard.png'),
      MenuItem(title: 'The Circle', icon: 'assets/the_circle.png'),
      MenuItem(title: 'UMKM Festival', icon: 'assets/umkm_festival.png'),
      MenuItem(title: 'Success Bundle', icon: 'assets/success_bundle.png'),
      MenuItem(title: 'Smart Ads', icon: 'assets/smart_ads.png'),
      MenuItem(title: 'Open Partnership', icon: 'assets/open_partnership.png'),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/kitausaha_logo.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.store,
                              size: 40, color: Colors.grey);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF8E24AA),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '"USAHA LEBIH MUDAH,\nBERKEMBANG LEBIH CEPAT"',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('My Account clicked')),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 1),
                                    decoration: BoxDecoration(
                                      color: Colors.cyan.shade400,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                    child: const Text(
                                      'My Account',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Sign Out clicked')),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 1),
                                    decoration: const BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                    ),
                                    child: const Text(
                                      'Sign Out',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: menuItems.map((item) {
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${item.title} clicked!')),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2)),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item.icon,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported,
                                      size: 40, color: Colors.white70);
                                },
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String icon;

  MenuItem({required this.title, required this.icon});
}
