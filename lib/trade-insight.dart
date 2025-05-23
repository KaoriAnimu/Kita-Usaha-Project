import 'package:flutter/material.dart';

class ParallelogramClipper extends CustomClipper<Path> {
  final double topRightRatio;
  final double bottomRightRatio;

  ParallelogramClipper({
    this.topRightRatio = 1,
    this.bottomRightRatio = 0.85,
  });

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * topRightRatio, 0);
    path.lineTo(size.width * bottomRightRatio, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant ParallelogramClipper oldClipper) {
    return topRightRatio != oldClipper.topRightRatio ||
        bottomRightRatio != oldClipper.bottomRightRatio;
  }
}

class TSPage extends StatefulWidget {
  const TSPage({Key? key}) : super(key: key);

  @override
  State<TSPage> createState() => _TSPageState();
}

class _TSPageState extends State<TSPage> {
  String _selectedPeriod = 'This Week';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = 16.0;
    final cardWidth = (size.width - padding * 3) / 2;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 112, 208, 83),
              Color.fromARGB(255, 50, 82, 51)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.18,
                      height: size.height * 0.1,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'lib/assets/logo-kitausaha.png',
                        fit: BoxFit.contain,
                        errorBuilder: (c, e, s) => const Icon(Icons.store,
                            size: 40, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: ParallelogramClipper(),
                            child: Container(
                              width: size.width,
                              height: size.height * 0.095,
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.15,
                                vertical: size.height * 0.026,
                              ),
                              color: Color.fromARGB(255, 42, 88, 44),
                              child: Text(
                                '"USAHA LEBIH MUDAH,\nBERKEMBANG LEBIH CEPAT"',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.03,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: size.width * 0.11,
                            bottom: 0,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/home'),
                                  child: Container(
                                    width: size.width * 0.12,
                                    height: size.height * 0.025,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan.shade400,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        bottomLeft: Radius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.width * 0.034,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                          'Anda berhasil sign out',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF8E24AA),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: const EdgeInsets.all(16),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Container(
                                    width: size.width * 0.155,
                                    height: size.height * 0.025,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign Out',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.width * 0.034,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedPeriod,
                          underline: const SizedBox(),
                          items: ['This Week', 'Last Week', 'This Month']
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null)
                              setState(() => _selectedPeriod = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: padding,
                        runSpacing: padding,
                        children: [
                          _buildStatCard(
                              width: cardWidth,
                              title: 'Total Sales',
                              value: 'Rp12.000.000'),
                          _buildStatCard(
                              width: cardWidth,
                              title: 'Sales Growth',
                              value: '+12%'),
                          _buildStatCard(
                              width: cardWidth,
                              title: 'Active Campaign',
                              value: '3'),
                          _buildStatCard(
                              width: cardWidth,
                              title: 'Conversion Rate',
                              value: '4,5%'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Sales Trend',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: size.height * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('📈 Grafik Sales Trend Placeholder'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Top Products',
                                  style: TextStyle(
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text('🥧 Pie Chart Placeholder'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sales by Region',
                                  style: TextStyle(
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text('🥧 Pie Chart Placeholder'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required double width,
    required String title,
    required String value,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
