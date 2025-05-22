import 'package:flutter/material.dart';

class CreateUmkmPage extends StatefulWidget {
  const CreateUmkmPage({Key? key}) : super(key: key);

  @override
  State<CreateUmkmPage> createState() => _CreateUmkmPageState();
}

class _CreateUmkmPageState extends State<CreateUmkmPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController brandController = TextEditingController();
  final TextEditingController portfolioController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController uploadPhotoController = TextEditingController();
  final TextEditingController whatsappLinkController = TextEditingController();

  String? maxParticipant;
  String? minBudget;
  bool termChecked = false;

  final List<String> maxParticipantOptions = ['1', '2', '3', '4', '5', '6'];
  final List<String> minBudgetOptions = [
    'Rp 10.000.000',
    'Rp 20.000.000',
    'Rp 30.000.000',
    'Rp 50.000.000',
    'Rp 70.000.000',
    'Rp 100.000.000',
  ];

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Undang-Undang Nomor 1 Tahun 2023 tentang KUHP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: termChecked,
                    onChanged: (val) {
                      setState(() {
                        termChecked = val ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text('Saya menyetujui S&K yang berlaku'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    brandController.dispose();
    portfolioController.dispose();
    locationController.dispose();
    uploadPhotoController.dispose();
    whatsappLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, '/op');
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Create UMKM',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Create Brand : *',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: brandController,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'Type a value',
                    hintStyle: const TextStyle(color: Colors.black38),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Brand is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Max participant : *',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: maxParticipant,
                  onChanged: (val) {
                    setState(() {
                      maxParticipant = val;
                    });
                  },
                  items: maxParticipantOptions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  validator: (val) {
                    if (val == null) return 'Max participant is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Minimum Budget : *',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: minBudget,
                  onChanged: (val) {
                    setState(() {
                      minBudget = val;
                    });
                  },
                  items: minBudgetOptions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  validator: (val) {
                    if (val == null) return 'Minimum budget is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Portofolio link : *',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: portfolioController,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'INSERT G DRIVE LINK OR FILE',
                    hintStyle: const TextStyle(color: Colors.black38),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Portfolio link is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Location : *',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: locationController,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'Type a value',
                    hintStyle: const TextStyle(color: Colors.black38),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Upload foto wajah dan KTP:*',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: uploadPhotoController,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'INSERT G DRIVE LINK OR FILE',
                    hintStyle: const TextStyle(color: Colors.black38),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Upload photo link is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Link Whatsapp group :',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: whatsappLinkController,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: 'Type a value',
                    hintStyle: const TextStyle(color: Colors.black38),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Checkbox(
                      value: termChecked,
                      onChanged: (val) {
                        setState(() {
                          termChecked = val ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Term And Condition:*',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (!termChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please accept the terms and conditions')),
                          );
                          return;
                        }
                        _showConfirmDialog();
                      }
                    },
                    child: const Text(
                      'Create',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
