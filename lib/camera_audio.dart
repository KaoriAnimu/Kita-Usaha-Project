import 'package:flutter/material.dart';

class CameraAudioSettingPage extends StatefulWidget {
  @override
  _CameraAudioSettingPageState createState() => _CameraAudioSettingPageState();
}

class _CameraAudioSettingPageState extends State<CameraAudioSettingPage> {
  String? backgroundChoicePortrait;
  String? advertisingPositionPortrait;
  String? filterPortrait;
  String? cameraDevicePortrait;
  String? autoOffStreamPortrait;
  String? audioDevicePortrait;
  String? effectPortrait;

  String? backgroundChoiceLandscape;
  String? advertisingPositionLandscape;
  String? filterLandscape;
  String? cameraDeviceLandscape;
  String? autoOffStreamLandscape;
  String? audioDeviceLandscape;
  String? effectLandscape;

  final List<String> backgrounds = [
    'Choose background 1',
    'Background 2',
    'Background 3'
  ];
  final List<String> advertisingPositions = [
    'BOTTOM CENTER',
    'TOP LEFT',
    'TOP RIGHT'
  ];
  final List<String> filters = ['Filter 1', 'Filter 2', 'Filter 3'];
  final List<String> cameraDevices = [
    'iPhone 13 pro MAC',
    'Samsung S21',
    'Pixel 5'
  ];
  final List<String> autoOffDurations = ['1 hour', '2 hours', '3 hours'];
  final List<String> audioDevices = ['Huawei buds', 'Sony Headset', 'Airpods'];
  final List<String> effects = ['Effect 1', 'Effect 2', 'Effect 3'];

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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                    print('Text tapped!');
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

  Widget buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: DropdownButton<String>(
            value: value,
            hint: Text('Select an item'),
            isExpanded: true,
            underline: SizedBox(),
            onChanged: onChanged,
            items: items
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildPortraitSection(double screenWidth) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade700, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PORTRAIT',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.purple.shade800)),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/portrait_example.png',
                      width: screenWidth * 0.4,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700]),
                      child: Text('Tes audio',
                          style: TextStyle(color: Colors.black)),
                    )
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    buildDropdown(
                        'Choose background',
                        backgroundChoicePortrait,
                        backgrounds,
                        (val) =>
                            setState(() => backgroundChoicePortrait = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'ADVERTISING POSITION',
                        advertisingPositionPortrait,
                        advertisingPositions,
                        (val) =>
                            setState(() => advertisingPositionPortrait = val)),
                    SizedBox(height: 10),
                    buildDropdown('Filter', filterPortrait, filters,
                        (val) => setState(() => filterPortrait = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'Select camera device',
                        cameraDevicePortrait,
                        cameraDevices,
                        (val) => setState(() => cameraDevicePortrait = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'Auto off stream',
                        autoOffStreamPortrait,
                        autoOffDurations,
                        (val) => setState(() => autoOffStreamPortrait = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'Select audio device',
                        audioDevicePortrait,
                        audioDevices,
                        (val) => setState(() => audioDevicePortrait = val)),
                    SizedBox(height: 10),
                    buildDropdown('Effect suara', effectPortrait, effects,
                        (val) => setState(() => effectPortrait = val)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLandscapeSection(double screenWidth) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade700, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LANDSCAPE',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.purple.shade800)),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/landscape_example.png',
                      width: screenWidth * 0.4,
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700]),
                      child: Text('Tes audio',
                          style: TextStyle(color: Colors.black)),
                    )
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    buildDropdown(
                        'Choose background',
                        backgroundChoiceLandscape,
                        backgrounds,
                        (val) =>
                            setState(() => backgroundChoiceLandscape = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'ADVERTISING POSITION',
                        advertisingPositionLandscape,
                        advertisingPositions,
                        (val) =>
                            setState(() => advertisingPositionLandscape = val)),
                    SizedBox(height: 10),
                    buildDropdown('Filter', filterLandscape, filters,
                        (val) => setState(() => filterLandscape = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'Select camera device',
                        cameraDeviceLandscape,
                        cameraDevices,
                        (val) => setState(() => cameraDeviceLandscape = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'Auto off stream',
                        autoOffStreamLandscape,
                        autoOffDurations,
                        (val) => setState(() => autoOffStreamLandscape = val)),
                    SizedBox(height: 10),
                    buildDropdown(
                        'Select audio device',
                        audioDeviceLandscape,
                        audioDevices,
                        (val) => setState(() => audioDeviceLandscape = val)),
                    SizedBox(height: 10),
                    buildDropdown('Effect suara', effectLandscape, effects,
                        (val) => setState(() => effectLandscape = val)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Container(
        width: screenWidth * 0.7, // Drawer 60% layar
        child: Drawer(
          child: _buildDrawerMenu(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.orange.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SafeArea(
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
                      'Camera & audio setting',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: responsiveFontSize(screenWidth, 0.06),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Konten portrait dan landscape
                buildPortraitSection(screenWidth),
                buildLandscapeSection(screenWidth),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Settings saved!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    ),
                    child: Text('Save',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
