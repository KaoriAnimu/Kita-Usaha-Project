import 'package:flutter/material.dart';

class StreamReportPage extends StatefulWidget {
  @override
  _StreamReportPageState createState() => _StreamReportPageState();
}

class _StreamReportPageState extends State<StreamReportPage> {
  String? selectedStream = 'TIKTOK';
  String? selectedPeriod = '1 MONTH';

  final List<String> streams = ['TIKTOK', 'YOUTUBE', 'SHOPEE LIVE'];
  final List<String> periods = ['1 MONTH', '3 MONTHS', '6 MONTHS'];

  Widget buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Row(
      children: [
        Text(
          '$label : ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            underline: SizedBox(),
            items: items
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildDataBox(String label, String value, bool isUp) {
    return Container(
      width: 140,
      height: 140,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(2, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey[800],
                )),
            SizedBox(height: 10),
            Text(value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black87)),
            SizedBox(height: 10),
            Icon(
              isUp ? Icons.arrow_upward : Icons.arrow_downward,
              color: isUp ? Colors.green : Colors.red,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade300, Colors.orange.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.orange.shade200.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.purple.shade200.withOpacity(0.5),
                borderRadius: BorderRadius.circular(110),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STREAM REPORT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildDropdown('Select stream', selectedStream, streams,
                            (val) {
                          setState(() {
                            selectedStream = val;
                          });
                        }),
                        SizedBox(width: 40),
                        buildDropdown('Period', selectedPeriod, periods, (val) {
                          setState(() {
                            selectedPeriod = val;
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: 30),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        buildDataBox('Stream (QTY)', '9', true),
                        buildDataBox('Stream Time', '18:24:18', true),
                        buildDataBox('Average Duration', '3:19:08', true),
                        buildDataBox('Comment', '218', false),
                        buildDataBox('Total Viewer', '4.8 K', true),
                        buildDataBox('Highest Viewer', '1.3K', true),
                        buildDataBox('Average Viewer', '824', false),
                        buildDataBox('Total Product Check Out', '25', false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
