import 'package:flutter/material.dart';

class PricingPage extends StatefulWidget {
  @override
  _PricingPageState createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  bool isMonthly = false;
  String selectedPayment = 'Gopay';

  final List<String> paymentMethods = ['Gopay', 'OVO', 'Dana', 'Credit Card'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                SizedBox(width: 8),
                Text(
                  'Success Bundle',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('YEARLY', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    Switch(
                      value: isMonthly,
                      onChanged: (val) {
                        setState(() {
                          isMonthly = val;
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text('MONTHLY', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Select payment :',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: selectedPayment,
                        icon: Icon(Icons.arrow_drop_down),
                        underline: SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPayment = newValue!;
                          });
                        },
                        items: paymentMethods
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700])),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PricingCard(
                    title: 'BASIC',
                    price: isMonthly ? 'Rp 0 / Mo.' : 'Rp 0 / Mo.',
                    iconPath: 'lib/assets/b3.jpg',
                    features: [
                      Feature(text: 'No Ads', isAvailable: false),
                      Feature(
                          text: 'Live shopping (Max 30 Minutes / Day)',
                          isAvailable: true),
                      Feature(text: 'The circle', isAvailable: true),
                      Feature(text: 'UMKM Festival', isAvailable: false),
                      Feature(text: 'Trade insight', isAvailable: false),
                      Feature(text: 'Margin wizard', isAvailable: false),
                      Feature(text: 'Smart ads', isAvailable: false),
                      Feature(
                          text: 'Content creator kits (Only 48 template)',
                          isAvailable: true),
                      Feature(text: 'Open partnership', isAvailable: true),
                    ],
                    cardColor: Color(0xFFb3aedf).withOpacity(0.8),
                    buttonColor: Colors.green,
                  ),
                  PricingCard(
                    title: 'PRO',
                    price: isMonthly ? 'Rp 59.000 / Mo.' : 'Rp 59.000 / Mo.',
                    iconPath: 'lib/assets/b3.jpg',
                    features: [
                      Feature(text: 'No Ads', isAvailable: true),
                      Feature(
                          text: 'Live shopping (Max 6 Hours / Day)',
                          isAvailable: true),
                      Feature(text: 'The circle', isAvailable: true),
                      Feature(text: 'UMKM Festival', isAvailable: true),
                      Feature(text: 'Trade insight', isAvailable: false),
                      Feature(text: 'Margin wizard', isAvailable: false),
                      Feature(text: 'Smart ads', isAvailable: true),
                      Feature(
                          text: 'Content creator kits (250 template)',
                          isAvailable: true),
                      Feature(text: 'Open partnership', isAvailable: true),
                    ],
                    cardColor: Color(0xFFb3aedf).withOpacity(0.8),
                    buttonColor: Colors.green,
                  ),
                  PricingCard(
                    title: 'PRO +',
                    price: isMonthly ? 'Rp 89.000 / Mo.' : 'Rp 89.000 / Mo.',
                    iconPath: 'lib/assets/b3.jpg',
                    features: [
                      Feature(text: 'No Ads', isAvailable: true),
                      Feature(
                          text: 'Live shopping (Unlimited time)',
                          isAvailable: true),
                      Feature(text: 'The circle', isAvailable: true),
                      Feature(text: 'UMKM Festival', isAvailable: true),
                      Feature(text: 'Trade insight', isAvailable: true),
                      Feature(text: 'Margin wizard', isAvailable: true),
                      Feature(text: 'Smart ads', isAvailable: true),
                      Feature(
                          text: 'Content creator kits (All template)',
                          isAvailable: true),
                      Feature(text: 'Open partnership', isAvailable: true),
                    ],
                    cardColor: Color(0xFFb3aedf).withOpacity(0.8),
                    buttonColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Feature {
  final String text;
  final bool isAvailable;

  Feature({required this.text, required this.isAvailable});
}

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String iconPath;
  final List<Feature> features;
  final Color cardColor;
  final Color buttonColor;

  PricingCard({
    required this.title,
    required this.price,
    required this.iconPath,
    required this.features,
    required this.cardColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 80,
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Container(
              height: 2,
              width: 100,
              color: Colors.black54,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            feature.text,
                            style: TextStyle(
                              color: feature.isAvailable
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              decoration: feature.isAvailable
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          feature.isAvailable ? Icons.check : Icons.close,
                          size: 14,
                          color:
                              feature.isAvailable ? Colors.green : Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Select plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width *
                        0.03, // 4% lebar layar
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
