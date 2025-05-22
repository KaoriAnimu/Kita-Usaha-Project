import 'package:flutter/material.dart';

class SmartAdsThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sa');
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'SMART ADS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'TERIMA KASIH EMAIL ANDA\nSUDAH KAMI TERIMA !!!!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/email_icon.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'SILAHKAN CEK EMAIL SECARA BERKALA, KAMI AKAN SEGERA MENGINFOKAN TOTAL BIAYA UNTUK MELAKUKAN PEMBAYARAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
