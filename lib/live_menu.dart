import 'package:flutter/material.dart';

class LiveShoppingPage extends StatefulWidget {
  @override
  _LiveShoppingPageState createState() => _LiveShoppingPageState();
}

class _LiveShoppingPageState extends State<LiveShoppingPage> {
  // Controller untuk text input
  final youtubeController = TextEditingController(
      text: "https://www.youtube.com/@bombardilo_crocodilo66");
  final tiktokController = TextEditingController();
  final shopeeController = TextEditingController();

  DateTime? selectedDate;
  bool insertAdvertisment = false;
  String? advertisingFile;
  bool disabledComment = false;

  List<String> advertisingFiles = [
    'File 1',
    'File 2',
    'File 3'
  ]; // contoh data dropdown

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar kiri
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Logo dan judul Live Shopping
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/kitausaha_logo.png'), // ganti dengan logo kamu
                          radius: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Live Shopping',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.white70),
                  ListTile(
                    leading: Icon(Icons.link, color: Colors.white),
                    title: Text('Channel link',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.white),
                    title: Text('Camera & audio setting',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.report, color: Colors.white),
                    title: Text('Stream report',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.white),
                    title: Text('Stream history',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  // Bisa tambah widget lain sesuai kebutuhan
                ],
              ),
            ),
          ),

          // Body kanan - form input
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade300, Colors.orange.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Channel link',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(height: 20),

                    // Youtube
                    Row(
                      children: [
                        Icon(Icons.play_circle_fill, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Youtube',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    TextField(
                      controller: youtubeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      ),
                    ),
                    SizedBox(height: 16),

                    // TikTok
                    Row(
                      children: [
                        Icon(Icons.music_note,
                            color: Colors
                                .black54), // bisa diganti icon TikTok custom
                        SizedBox(width: 8),
                        Text('TikTok',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    TextField(
                      controller: tiktokController,
                      decoration: InputDecoration(
                        hintText: 'Type a value',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Shopee live
                    Row(
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.brown),
                        SizedBox(width: 8),
                        Text('Shopee live',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    TextField(
                      controller: shopeeController,
                      decoration: InputDecoration(
                        hintText: 'Type a value',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('+ ADD OTHERS',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),

                    SizedBox(height: 30),

                    // Panning Date
                    Row(
                      children: [
                        Text('Panning Date  : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              child: Text(
                                selectedDate == null
                                    ? 'Select a date'
                                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                style: TextStyle(
                                    color: selectedDate == null
                                        ? Colors.grey
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Insert advertisment checkbox
                    Row(
                      children: [
                        Text('Insert advertisment ? : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Checkbox(
                          value: insertAdvertisment,
                          onChanged: (val) {
                            setState(() {
                              insertAdvertisment = val ?? false;
                            });
                          },
                        ),
                        Text('Yes',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Advertising file dropdown
                    Row(
                      children: [
                        Text('Advertising file  : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('Select an item'),
                            value: advertisingFile,
                            onChanged: (val) {
                              setState(() {
                                advertisingFile = val;
                              });
                            },
                            items: advertisingFiles
                                .map((e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Disabled comment checkbox
                    Row(
                      children: [
                        Text('Disabled comment ? : ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Checkbox(
                          value: disabledComment,
                          onChanged: (val) {
                            setState(() {
                              disabledComment = val ?? false;
                            });
                          },
                        ),
                        Text('Yes',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),

                    SizedBox(height: 40),

                    // Start live button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                        onPressed: () {
                          // Action start live
                        },
                        child: Text('Start live',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
