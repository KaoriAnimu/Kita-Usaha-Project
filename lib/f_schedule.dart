import 'package:flutter/material.dart';

class FSPage extends StatefulWidget {
  @override
  _FSPageState createState() => _FSPageState();
}

class _FSPageState extends State<FSPage> {
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
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.white),
            title: Text('Feedback Customer',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/cckits');
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

  final Color orangeColor = Color(0xFFd5893b);
  final Color darkOrangeColor = Color(0xFFba7814);

  final TextStyle subHeaderStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  final TextStyle bodyStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    height: 1.3,
  );

  Widget buildCard(String title, List<String> lines) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: darkOrangeColor.withOpacity(0.8),
            offset: Offset(3, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.event_note, color: Colors.white, size: 18),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: subHeaderStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          ...lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(line, style: bodyStyle),
            ),
          ),
        ],
      ),
    );
  }

  Widget timelineLine() {
    return Container(
      width: 3,
      height: 100,
      color: Colors.white70,
    );
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
                    'Festival Schedule',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveFontSize(screenWidth, 0.06),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text("FESTIVAL UMKM CILEGON 2025",
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
              SizedBox(height: 6),
              Text(
                "SCHEDULE KEGIATAN UNTUK PESERTA TERDAFTAR",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              SizedBox(height: 6),
              Text(
                "Alun-Alun Kota Cilegon | 20-22 Juni 2025",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(Icons.calendar_today,
                            color: Colors.white, size: 14),
                      ),
                      timelineLine(),
                    ],
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: buildCard("HARI PERSIAPAN – 19 Juni 2025", [
                      "08.00 – 12.00: Kedatangan peserta & registrasi ulang",
                      "12.00 – 15.00: Pembagian lokasi stan dan setup tenda",
                      "15.00 – 17.00: Briefing teknis & gladi resik",
                      "17.00 – 18.00: Sesi foto booth & dokumentasi awa",
                    ]),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(Icons.event, color: Colors.white, size: 14),
                      ),
                      timelineLine(),
                    ],
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: buildCard("HARI 1 – PEMBUKAAN – 20 Juni 2025", [
                      "08.00 – 09.00: Persiapan stan",
                      "09.00 – 10.00: Acara pembukaan oleh Wali Kota Cilegon",
                      "10.00 – 21.00: Aktivitas bazar dan penjualan bebas",
                      "14.00 – 15.00: Workshop UMKM #1 - “Cara Jitu Jualan Online”",
                      "18.00 – 19.00: Live music & hiburan lokal",
                    ]),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child:
                            Icon(Icons.school, color: Colors.white, size: 14),
                      ),
                      timelineLine(),
                    ],
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child:
                        buildCard("HARI 2 – EDUKASI & PROMOSI – 21 Juni 2025", [
                      "09.00 – 21.00: Aktivitas bazar dan promosi produk",
                      "10.00 – 11.30: Talkshow – “UMKM Go Digital”",
                      "13.00 – 15.00: Demo produk dari peserta terpilih",
                      "16.00 – 17.00: Lomba stan terbaik (penilaian tahap 1)",
                      "18.30 – 20.00: Stand-up Comedy & Musik Tradisional",
                    ]),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(Icons.flag, color: Colors.white, size: 14),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: buildCard(
                        "HARI 3 – PENUTUPAN & PENGHARGAAN – 22 Juni 2025", [
                      "09.00 – 12.00: Aktivitas bazar bebas",
                      "13.00 – 14.00: Pengumuman stan terbaik, produk terfavorit",
                      "14.00 – 15.00: Penyerahan sertifikat dan doorprize",
                      "15.00 – 17.00: Closing ceremony",
                      "17.00 – 20.00: Pembongkaran stan & kepulangan peserta",
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
