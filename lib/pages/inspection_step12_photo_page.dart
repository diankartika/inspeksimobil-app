import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    const MaterialApp(
      home: InspectionStep12PhotoPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

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
    'Tampak Samping Kanan': null,
    'Tampak Samping Kiri': null,
  };

  Future<void> _pickImage(String key) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _photos[key] = File(image.path);
      });
    }
  }

  void _deleteImage(String key) {
    setState(() {
      _photos[key] = null;
    });
  }

  Widget _buildImageRow(String label) {
    final file = _photos[label];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 6),
          if (file == null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _pickImage(label),
              child: const Text(
                "Ambil Gambar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          else
            Row(
              children: [
                const Icon(Icons.image, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    file.path.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Implement preview if needed
                  },
                  child: const Text(
                    "Lihat Gambar",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                IconButton(
                  onPressed: () => _deleteImage(label),
                  icon: const Icon(Icons.delete, color: Colors.pink),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "6/9",
                style: TextStyle(fontSize: 26, color: Colors.orange),
              ),
              const SizedBox(height: 4),
              const Text(
                "Foto General",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              const Text(
                "Wajib",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children:
                      _photos.keys.map((key) => _buildImageRow(key)).toList(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/step13_photo');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  "copyright by Inspeksi Mobil Jogja",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
