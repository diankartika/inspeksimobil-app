import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InspectionStep13PhotoPage extends StatefulWidget {
  const InspectionStep13PhotoPage({super.key});

  @override
  State<InspectionStep13PhotoPage> createState() => _InspectionStep13PhotoPageState();
}


class _InspectionStep13PhotoPageState extends State<InspectionStep13PhotoPage> {
  File? _image;
  final _labelController = TextEditingController();
  bool _perluPerhatian = false;
  int _currentIndex = 0;
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadFoto() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Widget _buildUploadBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _uploadFoto,
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: _image != null
                    ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
                    : null,
              ),
              child: _image == null
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Upload Foto',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 12),
          const Text("Label", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          TextField(
            controller: _labelController,
            decoration: InputDecoration(
              hintText: "Misal : Aki tampak atas",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _perluPerhatian,
                onChanged: (val) {
                  setState(() => _perluPerhatian = val!);
                },
              ),
              const Text("Perlu Perhatian"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            setState(() {
              if (_currentIndex > 0) _currentIndex--;
            });
          },
        ),
        Text("$_currentIndex/0", style: const TextStyle(fontSize: 16)),
        IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.orange),
          onPressed: () {
            setState(() {
              _currentIndex++;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("7/12")),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Foto General",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tambahan",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              _buildUploadBox(),
              const SizedBox(height: 20),
              _buildNavigation(),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Next ditekan!")),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "copyright by Inspeksi Mobil Jogja",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
