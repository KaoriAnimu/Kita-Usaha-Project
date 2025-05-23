import 'package:flutter/material.dart';

class VAdsPage extends StatefulWidget {
  @override
  _VAdsPageState createState() => _VAdsPageState();
}

class _VAdsPageState extends State<VAdsPage> {
  String dropdownValue = 'Horizontal';

  final List<String> VADSImages = [
    'lib/assets/q1.jpg',
    'lib/assets/q2.jpg',
    'lib/assets/q3.jpg',
    'lib/assets/q4.jpg',
    'lib/assets/q5.jpg',
    'lib/assets/q6.jpg',
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
        child: Drawer(
          child: _buildDrawerMenu(),
        ),
      ),
      body: Container(
        width: screenWidth * 1,
        height: screenHeight * 1,
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
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Video Ads Template',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Text(
                    'Type',
                    style: TextStyle(
                      fontSize: responsiveFontSize(screenWidth, 0.045),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Horizontal', 'Vertical']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsiveFontSize(screenWidth, 0.045),
                            )),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: VADSImages.map((imagePath) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.canPop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePath,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
