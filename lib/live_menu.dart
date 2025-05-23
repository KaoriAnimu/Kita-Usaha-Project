import 'package:flutter/material.dart';

class LiveShoppingPage extends StatefulWidget {
  @override
  _LiveShoppingPageState createState() => _LiveShoppingPageState();
}

class _LiveShoppingPageState extends State<LiveShoppingPage> {
  final youtubeController = TextEditingController(
      text: "https://www.youtube.com/@bombardilo_crocodilo66");
  final tiktokController = TextEditingController();
  final shopeeController = TextEditingController();

  DateTime? selectedDate;
  bool insertAdvertisment = false;
  String? advertisingFile;
  bool disabledComment = false;

  List<String> advertisingFiles = ['File 1', 'File 2', 'File 3'];

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.tealAccent.shade700,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.tealAccent.shade700,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  double responsiveFontSize(double screenWidth, double factor) {
    double size = screenWidth * factor;
    if (size < 12) return 12;
    if (size > 24) return 24;
    return size;
  }

  Widget _inputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white70),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      cursorColor: Colors.white,
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(child: _buildDrawerMenu()),
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
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Channel link',
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
                  Icon(Icons.play_circle_fill,
                      color: Colors.red, size: screenWidth * 0.05),
                  SizedBox(width: 12),
                  Text(
                    'Youtube',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              _inputField(youtubeController, ''),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Icon(Icons.music_note,
                      color: Colors.black54, size: screenWidth * 0.05),
                  SizedBox(width: 12),
                  Text(
                    'TikTok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              _inputField(tiktokController, 'Type a value'),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Icon(Icons.shopping_cart,
                      color: Colors.brown, size: screenWidth * 0.05),
                  SizedBox(width: 12),
                  Text(
                    'Shopee live',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              _inputField(shopeeController, 'Type a value'),
              SizedBox(height: screenHeight * 0.005),
              Text(
                '+ ADD OTHERS',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: responsiveFontSize(screenWidth, 0.03),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: [
                  Text(
                    'Panning Date  : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _pickDate(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                        ),
                        child: Text(
                          selectedDate == null
                              ? 'Select a date'
                              : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: responsiveFontSize(screenWidth, 0.04),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Text(
                    'Insert advertisment ? : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                  Checkbox(
                    value: insertAdvertisment,
                    onChanged: (val) {
                      setState(() {
                        insertAdvertisment = val ?? false;
                      });
                    },
                    checkColor: Colors.tealAccent.shade700,
                    activeColor: Colors.white24,
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Text(
                    'Advertising file  : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Color(0xFF9C27B0),
                      hint: Text(
                        'Select an item',
                        style: TextStyle(
                          fontSize: responsiveFontSize(screenWidth, 0.04),
                          color: Colors.white70,
                        ),
                      ),
                      value: advertisingFile,
                      onChanged: (val) {
                        setState(() {
                          advertisingFile = val;
                        });
                      },
                      items: advertisingFiles
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize:
                                        responsiveFontSize(screenWidth, 0.04),
                                    color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Text(
                    'Disabled comment ? : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                  Checkbox(
                    value: disabledComment,
                    onChanged: (val) {
                      setState(() {
                        disabledComment = val ?? false;
                      });
                    },
                    checkColor: Colors.tealAccent.shade700,
                    activeColor: Colors.white24,
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.04),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent.shade700,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black45,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Start live',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.045),
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
