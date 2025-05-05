import 'package:flutter/material.dart';
import 'templatePenilaianPage.dart';
import 'inspection_step12_photo_page.dart';

class Penilaian7 extends StatefulWidget {
  const Penilaian7({super.key});

  @override
  _Penilaian7State createState() => _Penilaian7State();
}

class _Penilaian7State extends State<Penilaian7> {
 final List<String> stringList = [
  'Tebal Cat Body Depan',
  'Tebal Cat Body Kiri',
  'Temperature AC Mobil',
  'Tebal Cat Body Kanan',
  'Tebal Cat Body Belakang',
  'OBD Scanner',
  'Tebal Cat Body Atap',
  'Test ACCU (ON & OFF)',
];

  List<int?> intList = List.filled(8, null);
  TextEditingController catatanController = TextEditingController();

  @override
  void dispose() {
    catatanController.dispose();
    super.dispose();
  }

  void _goNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InspectionStep12PhotoPage()));
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("5/9 Penilaian"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height : 20),
              const Text(
              "Tools Test",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

              for (int i = 0; i < stringList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    child: Templatepp(
                      lstring: [stringList[i]],
                      valuestring: [intList[i]],
                    ),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Catatan", style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: catatanController,
                    maxLines: 5,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: '• Catatan 1\n• Catatan 2\n• Catatan 3',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _goBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: _goNextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}