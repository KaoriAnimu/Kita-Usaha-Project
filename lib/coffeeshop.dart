import 'package:flutter/material.dart';

class CoffeeShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orangeColor = Colors.orange.shade300;
    final darkPurple = Colors.deepPurple.shade900;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade800, Colors.orange.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pushNamed(context, '/cckits'),
                ),
                SizedBox(width: 12),
                Text(
                  'EDITING',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 1.2,
                  ),
                ),
                Spacer(),
                Icon(Icons.file_download, color: Colors.white),
                SizedBox(width: 16),
                Icon(Icons.share, color: Colors.white),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24, width: 2),
              ),
              child: Center(
                child: Icon(
                  Icons.photo,
                  color: Colors.white38,
                  size: 80,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'ANOTHER NEW COFFEE SHOP IS',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'COMING ',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: orangeColor,
                  letterSpacing: 1.2,
                ),
                children: [
                  TextSpan(
                    text: 'SOON',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: darkPurple.withOpacity(0.8),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'The wait is almost over!',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: orangeColor, width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    '30% OFF',
                    style: TextStyle(
                      color: orangeColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'on the Grand Opening',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              '17.07.2024',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDot(Colors.white24),
                  _buildDot(Colors.white24),
                  _buildDot(orangeColor),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomButton(Icons.tune, 'Setting'),
                _buildBottomButton(Icons.text_fields, 'Text'),
                _buildBottomButton(Icons.smart_toy, 'AI'),
                _buildBottomButton(Icons.edit, 'Edit'),
                _buildBottomButton(Icons.cloud_upload, 'Upload'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 6,
      height: 6,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBottomButton(IconData icon, String tooltip) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(12),
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
