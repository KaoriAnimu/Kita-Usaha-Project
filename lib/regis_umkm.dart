import 'package:flutter/material.dart';

class RegUMKMPage extends StatefulWidget {
  @override
  _RegUMKMPageState createState() => _RegUMKMPageState();
}

class _RegUMKMPageState extends State<RegUMKMPage> {
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
                  },
                  child: Text(
                    'UMKM Festival',
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
            leading: Icon(Icons.contact_mail_outlined, color: Colors.white),
            title: Text('Announcement', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/uf');
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration, color: Colors.white),
            title: Text('Registration', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/rum');
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule, color: Colors.white),
            title: Text('Festival Schedule',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/fs');
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.white),
            title: Text('Feedback Customer',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/home');
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

  // Form UMKM Festival variables
  final _formKey = GlobalKey<FormState>();

  String? selectedLocation;
  String? selectedDate;
  String? selectedPayment;

  final ownerController = TextEditingController();
  final umkmNameController = TextEditingController();
  final umkmProductController = TextEditingController();

  String? uploadedFileName;

  final List<String> locations = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Yogyakarta',
  ];

  final List<String> festivalDates = [
    '10-15 June 2025',
    '20-25 June 2025',
    '1-5 July 2025',
  ];

  final List<String> paymentMethods = [
    'Bank BCA',
    'Bank Mandiri',
    'Bank BNI',
  ];

  void _showUploadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Upload Image'),
        content: Text('This is a placeholder for image upload.'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                uploadedFileName = 'transaction_receipt.jpg';
              });
              Navigator.of(context).pop();
            },
            child: Text('Simulate Upload'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    ownerController.dispose();
    umkmNameController.dispose();
    umkmProductController.dispose();
    super.dispose();
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
            colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
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
                    'UMKM Festival Registration',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Location  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      value: selectedLocation,
                      hint: Text('Select Location'),
                      items: locations
                          .map((loc) =>
                              DropdownMenuItem(value: loc, child: Text(loc)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLocation = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select location' : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Choose Festival Date  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      value: selectedDate,
                      hint: Text('Select Date'),
                      items: festivalDates
                          .map((date) =>
                              DropdownMenuItem(value: date, child: Text(date)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select festival date' : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Owner  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: ownerController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Type a Value',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter owner name' : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'UMKM Name  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: umkmNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Type a Value',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter UMKM name' : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'UMKM Product  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: umkmProductController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Type a Value',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter UMKM product' : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Payment Registration  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                      ),
                      value: selectedPayment,
                      hint: Text('Select Bank'),
                      items: paymentMethods
                          .map((pay) =>
                              DropdownMenuItem(value: pay, child: Text(pay)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPayment = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select payment method' : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Capture of Transaction  :',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    GestureDetector(
                      onTap: _showUploadDialog,
                      child: Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          uploadedFileName ?? 'Upload Image',
                          style: TextStyle(
                              color: uploadedFileName == null
                                  ? Colors.grey.shade600
                                  : Colors.black87),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (uploadedFileName == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Please upload transaction image')),
                              );
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Form submitted successfully!')),
                            );
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
