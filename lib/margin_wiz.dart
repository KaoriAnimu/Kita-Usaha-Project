import 'package:flutter/material.dart';

class MarginWizardPage extends StatefulWidget {
  @override
  _MarginWizardPageState createState() => _MarginWizardPageState();
}

class _MarginWizardPageState extends State<MarginWizardPage> {
  final TextEditingController hppController = TextEditingController();
  final TextEditingController biayaController = TextEditingController();
  final TextEditingController marginController = TextEditingController();
  final TextEditingController targetLabaController = TextEditingController();

  String hasilHargaJual = "-";
  String hasilLabaProduk = "-";
  String hasilHargaJualDiskon = "-";
  String hasilLabaDiskon = "-";
  String hasilBEP = "-";
  String hasilJumlahProduk = "-";

  void hitungSemua() {
    double hpp = double.tryParse(hppController.text) ?? 0;
    double biaya = double.tryParse(biayaController.text) ?? 0;
    double margin = double.tryParse(marginController.text) ?? 0;
    double targetLaba = double.tryParse(targetLabaController.text) ?? 0;

    if (hpp == 0 || margin == 0) {
      setState(() {
        hasilHargaJual = "Input tidak valid";
        hasilLabaProduk = "-";
        hasilHargaJualDiskon = "-";
        hasilLabaDiskon = "-";
        hasilBEP = "-";
        hasilJumlahProduk = "-";
      });
      return;
    }

    double hargaJual = (hpp + biaya) * (1 + margin / 100);
    double labaProduk = hargaJual - (hpp + biaya);
    double diskon = 0.1;
    double hargaJualSetelahDiskon = hargaJual * (1 - diskon);
    double labaSetelahDiskon = hargaJualSetelahDiskon - (hpp + biaya);
    double bep = (biaya + targetLaba) / labaProduk;
    double jumlahProduk = bep;

    setState(() {
      hasilHargaJual = "Rp ${hargaJual.toStringAsFixed(0)}";
      hasilLabaProduk = "Rp ${labaProduk.toStringAsFixed(0)}";
      hasilHargaJualDiskon = "Rp ${hargaJualSetelahDiskon.toStringAsFixed(0)}";
      hasilLabaDiskon = "Rp ${labaSetelahDiskon.toStringAsFixed(0)}";
      hasilBEP = bep.isFinite ? bep.toStringAsFixed(0) : "-";
      hasilJumlahProduk =
          jumlahProduk.isFinite ? jumlahProduk.toStringAsFixed(0) : "-";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.orange.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
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
                    "Margin Wizard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Kalkulator UMKM Lanjutan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Harga Pokok Produksi (HPP):",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 4),
              TextField(
                controller: hppController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Contoh: 10000",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Biaya Operasional:",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 4),
              TextField(
                controller: biayaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Contoh: 2000",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Margin Keuntungan (%):",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 4),
              TextField(
                controller: marginController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Contoh: 30",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Target Laba Bulanan (Jika Ada):",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 4),
              TextField(
                controller: targetLabaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Contoh: 5000000",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: hitungSemua,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "Hitung Semua",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Harga Jual (sebelum diskon): $hasilHargaJual",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 6),
              Text(
                "Laba per Produk: $hasilLabaProduk",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 6),
              Text(
                "Harga Jual Setelah Diskon: $hasilHargaJualDiskon",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 6),
              Text(
                "Laba Setelah Diskon: $hasilLabaDiskon",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 6),
              Text(
                "Break Even Point (BEP) - Unit: $hasilBEP",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 6),
              Text(
                "Jumlah Produk untuk Capai Target Laba Bulanan: $hasilJumlahProduk",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
