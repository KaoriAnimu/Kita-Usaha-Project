import 'package:flutter/material.dart';

class IGFeedsPage extends StatefulWidget {
  @override
  _IGFeedsPageState createState() => _IGFeedsPageState();
}

class _IGFeedsPageState extends State<IGFeedsPage> {
  final List<Map<String, String>> ads = [
    {'title': 'Feeds Aesthetic', 'subtitle': 'By: Larena Inc'},
    {'title': 'Feeds Aesthetic', 'subtitle': 'By: Larena Inc'},
    {'title': 'Feeds Aesthetic', 'subtitle': 'Presented by Company'},
    {'title': 'Feeds Aesthetic', 'subtitle': 'By: Larena Inc'},
    {'title': 'Feeds Aesthetic', 'subtitle': ''},
    {'title': 'Feeds Aesthetic', 'subtitle': 'New Collection 2024'},
    {'title': 'Feeds Aesthetic', 'subtitle': 'Tim Lemon'},
    {'title': 'Feeds Aesthetic', 'subtitle': 'By Larena Inc'},
    {'title': 'Feeds Aesthetic', 'subtitle': 'Presentasi'},
  ];

  Widget _buildDrawerMenu() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade900, Colors.green.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade900, Colors.green.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('lib/assets/logo-kitausaha.png'),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      'Content Creator \nKits',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(Icons.comment_bank_rounded, color: Colors.white),
            title:
                Text('Banner Template', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
            },
          ),
          ListTile(
            leading: Icon(Icons.shop_outlined, color: Colors.white),
            title: Text('Power Point', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/ads');
            },
          ),
          ListTile(
            leading: Icon(Icons.feed, color: Colors.white),
            title:
                Text('Instagram Feed', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/igf');
            },
          ),
          ListTile(
            leading:
                Icon(Icons.video_camera_back_outlined, color: Colors.white),
            title: Text('Video Ads Template',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/vads');
            },
          ),
          ListTile(
            leading: Icon(Icons.design_services, color: Colors.white),
            title: Text('Logo Design', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/lgds');
            },
          ),
        ],
      ),
    );
  }

  double responsiveFontSize(double screenWidth, double factor) {
    double size = screenWidth * factor;
    if (size < 12) return 12;
    if (size > 24) return 24;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Container(
        width: screenWidth * 0.78,
        child: Drawer(child: _buildDrawerMenu()),
      ),
      body: Container(
        width: screenWidth * 2,
        height: screenHeight * 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 112, 208, 83),
              Color.fromARGB(255, 50, 82, 51)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Instagram Feeds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              GridView.builder(
                itemCount: ads.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final item = ads[index];
                  return AdCard(
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const AdCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              height: MediaQuery.of(context).size.height * 2,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              child: Center(
                child: Image.asset(
                  'lib/assets/e1.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle.isNotEmpty) ...[
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
