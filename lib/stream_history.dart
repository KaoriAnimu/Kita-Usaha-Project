import 'package:flutter/material.dart';

class StreamHistoryPage extends StatefulWidget {
  @override
  _StreamHistoryPageState createState() => _StreamHistoryPageState();
}

class _StreamHistoryPageState extends State<StreamHistoryPage> {
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
                  backgroundImage: AssetImage('lib/assets/logo-kitausaha.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Live Shopping',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.link, color: Colors.white),
            title: Text('Channel link', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/livemenu');
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.white),
            title: Text('Camera & audio setting',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cameraaudio');
            },
          ),
          ListTile(
            leading: Icon(Icons.report, color: Colors.white),
            title: Text('Stream report', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/streamreport');
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.white),
            title:
                Text('Stream history', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/streamhistory');
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

  final List<Map<String, String>> streams = [
    {'image': 'lib/assets/b2.png', 'date': 'Live stream 06-05-2025'},
    {'image': 'lib/assets/b2.png', 'date': 'Live stream 12-05-2025'},
    {'image': 'lib/assets/b2.png', 'date': 'Live stream 01-04-2025'},
    {'image': 'lib/assets/b2.png', 'date': 'Live stream 03-04-2025'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final paddingHorizontal = screenWidth * 0.05;
    final gridSpacing = screenWidth * 0.04;
    final cardWidth = (screenWidth - paddingHorizontal * 2 - gridSpacing) / 2;
    final cardHeight = cardWidth * 1.1;
    final fontSizeDate = responsiveFontSize(screenWidth, 0.032);

    return Scaffold(
      drawer: Container(
        width: screenWidth * 0.7,
        child: Drawer(
          child: _buildDrawerMenu(),
        ),
      ),
      body: Container(
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
          horizontal: paddingHorizontal,
          vertical: screenHeight * 0.04,
        ),
        child: SafeArea(
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
                    'STREAM HISTORY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: GridView.builder(
                  itemCount: streams.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: gridSpacing,
                    crossAxisSpacing: gridSpacing,
                    childAspectRatio: cardWidth / cardHeight,
                  ),
                  itemBuilder: (context, index) {
                    final stream = streams[index];
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            stream['image']!,
                            fit: BoxFit.cover,
                            height: cardHeight * 0.7,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: cardHeight * 0.7,
                                width: MediaQuery.of(context).size.width * 0.9,
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: cardHeight * 0.3,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: cardHeight * 0.05,
                        ),
                        Text(
                          stream['date']!,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: fontSizeDate,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
