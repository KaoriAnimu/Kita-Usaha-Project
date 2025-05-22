import 'package:flutter/material.dart';

class CreateCirclePage extends StatefulWidget {
  const CreateCirclePage({Key? key}) : super(key: key);

  @override
  _CreateCirclePageState createState() => _CreateCirclePageState();
}

class _CreateCirclePageState extends State<CreateCirclePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _hideHostName = false;
  String? _maxParticipant;

  final List<String> maxParticipantsOptions = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A37E9), Color(0xFFFF9D55)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "THE CIRCLE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.2),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              "CREATE CIRCLE",
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 2,
                      color: Colors.blue.shade300,
                    )
                  ]),
            ),
            SizedBox(height: 20),
            Text(
              "Create title : *",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Type a value",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            Text(
              "Max participant : *",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              items: maxParticipantsOptions
                  .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _maxParticipant = val;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              hint: Text('Select max participant'),
            ),
            SizedBox(height: 15),
            Text(
              "Set end :",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Select a time / date",
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              onTap: () {},
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                    value: _hideHostName,
                    onChanged: (val) {
                      setState(() {
                        _hideHostName = val ?? false;
                      });
                    }),
                Text(
                  "Hide host name :",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text("Yes", style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Set password :",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Type a value",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Create button pressed (mock)")));
                },
                child: Text(
                  "Create",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
