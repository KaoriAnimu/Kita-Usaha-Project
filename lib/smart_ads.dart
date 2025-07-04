import 'package:flutter/material.dart';

class SmartAdsPage extends StatefulWidget {
  @override
  _SmartAdsPageState createState() => _SmartAdsPageState();
}

class _SmartAdsPageState extends State<SmartAdsPage> {
  String selectedPlatform = 'Youtube';
  String selectedPeriod = '1 MONTH';
  String selectedAgeSegment = '21 - 28 Tahun';
  String selectedHobbySegment = 'Fashion';
  String selectedProfessionSegment = 'None';
  String professionText = 'Tangerang selatan';
  String panningDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'SMART ADS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              buildDropdownRow(
                label: 'Pilih platform',
                child: DropdownButton<String>(
                  value: selectedPlatform,
                  dropdownColor: Color(0xFF9C27B0),
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  items: ['Youtube', 'Facebook', 'Instagram']
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedPlatform = val!;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Period',
                child: DropdownButton<String>(
                  value: selectedPeriod,
                  dropdownColor: Color(0xFF9C27B0),
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  items: ['1 MONTH', '3 MONTHS', '6 MONTHS']
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedPeriod = val!;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Panning Date',
                child: TextField(
                  controller: TextEditingController(text: panningDate),
                  decoration: InputDecoration(
                    hintText: 'dd-mm-yyyy',
                    hintStyle: TextStyle(color: Colors.white70),
                    fillColor: Colors.transparent,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {
                    setState(() {
                      panningDate = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Segmentasi usia',
                child: DropdownButton<String>(
                  value: selectedAgeSegment,
                  dropdownColor: Color(0xFF9C27B0),
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  items: [
                    '21 - 28 Tahun',
                    '29 - 35 Tahun',
                    '36 - 45 Tahun',
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedAgeSegment = val!;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Segmentasi Hobi',
                child: DropdownButton<String>(
                  value: selectedHobbySegment,
                  dropdownColor: Color(0xFF9C27B0),
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  items: [
                    'Fashion',
                    'Sports',
                    'Technology',
                    'Travel',
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedHobbySegment = val!;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Segmentasi Profesi',
                child: DropdownButton<String>(
                  value: selectedProfessionSegment,
                  dropdownColor: Color(0xFF9C27B0),
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  items: [
                    'None',
                    'Engineer',
                    'Doctor',
                    'Teacher',
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedProfessionSegment = val!;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Segmentasi Profesi',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: TextEditingController(text: professionText),
                    onChanged: (val) {
                      professionText = val;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white70),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'lib/assets/b4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/saty');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF73FF4A),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 5,
                  ),
                  child: Text(
                    'Mail',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownRow({required String label, required Widget child}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 130,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        SizedBox(width: 8),
        Expanded(child: child),
      ],
    );
  }
}
