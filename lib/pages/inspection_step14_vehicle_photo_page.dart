import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InspectionStep14VehiclePhotoPage extends StatefulWidget {
  const InspectionStep14VehiclePhotoPage({super.key});

  @override
  State<InspectionStep14VehiclePhotoPage> createState() =>
      _InspectionStep14VehiclePhotoPageState();
}

class _InspectionStep14VehiclePhotoPageState
    extends State<InspectionStep14VehiclePhotoPage> {
  final ImagePicker _picker = ImagePicker();
  final Map<String, File?> _photos = {
    'Tampak Depan': null,
    'Tampak Belakang': null,
    'Cek Aki On': null,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        file == null
            ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _pickImage(label),
              child: const Text("Ambil Gambar"),
            )
            : Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    file,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.orange),
                        onPressed: () => _pickImage(label),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.pink),
                        onPressed: () => _deleteImage(label),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.lightBlue,
                        ),
                        onPressed: () {
                          // TODO: implement preview if needed
                        },
                      ),
                    ],
                  ),
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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "6/9",
                style: TextStyle(fontSize: 26, color: Colors.orange),
              ),
              const Text(
                "Foto Kendaraan (1)",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
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
                      ),
                      child: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/step15_photo');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text("Next"),
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
