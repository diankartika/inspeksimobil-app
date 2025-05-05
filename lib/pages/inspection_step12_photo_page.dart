import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InspectionStep12PhotoPage extends StatefulWidget {
  const InspectionStep12PhotoPage({super.key});

  @override
  State<InspectionStep12PhotoPage> createState() =>
      _InspectionStep12PhotoPageState();
}

class _InspectionStep12PhotoPageState extends State<InspectionStep12PhotoPage> {
  final ImagePicker _picker = ImagePicker();
  final Map<String, File?> _photos = {
    'Tampak Depan': null,
    'Tampak Belakang': null,
    'OBD Scanner': null,
    'Cek Suhu AC': null,
    'Cek Aki On': null,
    'Cek Aki Off': null,
  };

  Future<void> _pickImage(String key) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _photos[key] = File(image.path);
      });
    }
  }

  Widget _buildImageRow(String label) {
    final file = _photos[label];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        if (file == null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(40),
            ),
            onPressed: () => _pickImage(label),
            child: const Text("Ambil Gambar"),
          )
        else
          Row(
            children: [
              const Icon(Icons.image, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Expanded(child: Text(file.path.split('/').last)),
              TextButton(
                onPressed: () {
                  // Bisa buat lihat gambar lebih lanjut atau preview
                },
                child: const Text("Lihat Gambar"),
              ),
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("6/12 Foto Kendaraan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Foto Kendaraan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._photos.keys.map((key) => _buildImageRow(key)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Next ditekan!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "copyright by Inspeksi Mobil Jogja",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
