import 'package:flutter/material.dart';

class OpenPartnershipPage extends StatelessWidget {
  const OpenPartnershipPage({Key? key}) : super(key: key);

  final List<Map<String, String>> partnerships = const [
    {
      'title': 'NASI JAGAL MAS RUDI',
      'postedBy': 'KOKO RUDI',
      'minParticipant': '3/4',
      'budget': 'Rp.30.000.000 / org',
      'location': 'Stasiun sudirman',
    },
    {
      'title': 'NASI TIMBEL BANKA',
      'postedBy': 'Salomon randolph',
      'minParticipant': '1/4',
      'budget': 'Rp.20.000.000 / org',
      'location': 'Istana maimum, Medan',
    },
    {
      'title': 'DOMU T-SHIRT',
      'postedBy': 'RULI DOMU',
      'minParticipant': '4/6',
      'budget': 'Rp.78.000.000 / org',
      'location': 'Transmart, Padang',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Open Partnership",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/umkm');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: partnerships.map((partner) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              partner['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Posted by:'),
                            Text(
                              partner['postedBy']!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Divider(thickness: 1, height: 20),
                            Text(
                                'MIN PARTICIPANT : ${partner['minParticipant']}'),
                            Text('Budget : ${partner['budget']}'),
                            Text('Lokasi : ${partner['location']}'),
                          ],
                        ),
                      );
                    }).toList(),
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
