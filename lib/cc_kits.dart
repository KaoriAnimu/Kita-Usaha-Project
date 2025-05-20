import 'package:flutter/material.dart';

class CCKitsPage extends StatefulWidget {
  @override
  _CCKitsPageState createState() => _CCKitsPageState();
}

class _CCKitsPageState extends State<CCKitsPage> {
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
                  backgroundImage: AssetImage('assets/kitausaha_logo.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 14),
                Text(
                  'Content Creator \nKits',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.link, color: Colors.white),
            title:
                Text('Banner Template', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.white),
            title: Text('Power Point', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
            },
          ),
          ListTile(
            leading: Icon(Icons.report, color: Colors.white),
            title:
                Text('Instagram Feed', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.white),
            title: Text('Video Ads Template',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.white),
            title: Text('Logo Design', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
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
        child: Drawer(
          child: _buildDrawerMenu(),
        ),
      ),
      body: Container(
        width: screenWidth * 2,
        height: screenHeight * 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.orange.shade400],
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
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Banner Template',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
