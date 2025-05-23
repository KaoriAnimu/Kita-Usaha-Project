import 'package:flutter/material.dart';

class UMKMFesPage extends StatefulWidget {
  @override
  _UMKMFesPageState createState() => _UMKMFesPageState();
}

class _UMKMFesPageState extends State<UMKMFesPage> {
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
        width: screenWidth,
        height: screenHeight,
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
                    'Announcement',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.brown.shade100.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '🎉 FESTIVAL UMKM CILEGON 2025 🎉\n'
                  '"Bersama Majukan Produk Lokal!"\n\n'
                  '🟢 DIBUKA PENDAFTARAN UNTUK UMKM!\n'
                  'Ayo bergabung dalam Festival UMKM Cilegon 2025 dan promosikan produk unggulanmu kepada ribuan pengunjung!\n\n'
                  '🍴 Kuliner • Fashion • Kerajinan • Jasa • dan lainnya\n\n'
                  '📍 Lokasi: Alun-Alun Kota Cilegon\n'
                  '📅 Tanggal: 20-22 Juni 2025\n'
                  '⏰ Waktu: 09.00 - 21.00 WIB\n\n'
                  '⛔ Kuota terbatas untuk 50 UMKM pertama!\n\n'
                  'Fasilitas untuk Peserta:\n'
                  '✅ Tenda dan meja standar\n'
                  '✅ Akses listrik\n'
                  '✅ Publikasi di media sosial resmi\n'
                  '✅ Sertifikat partisipasi\n\n'
                  '🟢 Daftar sekarang!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
