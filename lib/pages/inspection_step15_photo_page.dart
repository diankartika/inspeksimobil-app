import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InspectionStep15PhotoPage extends StatefulWidget {
  const InspectionStep15PhotoPage({super.key});

  @override
  State<InspectionStep15PhotoPage> createState() =>
      _InspectionStep15PhotoPageState();
}

class _InspectionStep15PhotoPageState extends State<InspectionStep15PhotoPage> {
  final ImagePicker _picker = ImagePicker();
  final int totalPhotos = 92;
  int currentIndex = 0;

  final List<File?> photos = List.generate(92, (_) => null);
  final List<TextEditingController> labelControllers = List.generate(
    92,
    (_) => TextEditingController(),
  );
  final List<bool> perhatianFlags = List.generate(92, (_) => false);

  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        photos[index] = File(image.path);
      });
    }
  }

  void _deleteImage(int index) {
    setState(() {
      photos[index] = null;
    });
  }

  Widget _buildPhotoCard(int index) {
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
          photos[index] == null
              ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _pickImage(index),
                child: const Text("Upload Foto"),
              )
              : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      photos[index]!,
                      width: double.infinity,
                      height: 180,
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
                          onPressed: () => _pickImage(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.pink),
                          onPressed: () => _deleteImage(index),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 12),
          const Text("Label", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          TextField(
            controller: labelControllers[index],
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
                value: perhatianFlags[index],
                onChanged: (val) {
                  setState(() => perhatianFlags[index] = val ?? false);
                },
              ),
              const Text("Perlu Perhatian"),
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
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "6/9",
                  style: TextStyle(fontSize: 26, color: Colors.orange),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Foto General",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Tambahan", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              _buildPhotoCard(currentIndex),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                    onPressed: () {
                      setState(() {
                        if (currentIndex > 0) currentIndex--;
                      });
                    },
                  ),
                  Text(
                    "${currentIndex + 1}/$totalPhotos",
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                    onPressed: () {
                      setState(() {
                        if (currentIndex < totalPhotos - 1) currentIndex++;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Next ditekan!")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
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
