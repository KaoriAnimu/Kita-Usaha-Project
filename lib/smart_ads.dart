import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A37E9), Color(0xFFFF9D55)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '< SMART ADS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              buildDropdownRow(
                label: 'Pilih platform',
                child: DropdownButton<String>(
                  value: selectedPlatform,
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  items: ['Youtube', 'Facebook', 'Instagram']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
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
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  items: ['1 MONTH', '3 MONTHS', '6 MONTHS']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
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
                child: InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context, showTitleActions: true,
                        onConfirm: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    }, currentTime: selectedDate ?? DateTime.now());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'Select a date'
                              : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.calendar_today, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              buildDropdownRow(
                label: 'Segmentasi usia',
                child: DropdownButton<String>(
                  value: selectedAgeSegment,
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  items: [
                    '21 - 28 Tahun',
                    '29 - 35 Tahun',
                    '36 - 45 Tahun',
                  ]
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
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
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  items: [
                    'Fashion',
                    'Sports',
                    'Technology',
                    'Travel',
                  ]
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
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
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  items: [
                    'None',
                    'Engineer',
                    'Doctor',
                    'Teacher',
                  ]
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
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
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none),
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
                    'assets/tangerang_selatan_map.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // action mail here
                    print("Mail button pressed");
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
