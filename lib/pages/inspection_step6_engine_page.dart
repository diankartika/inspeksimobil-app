import 'package:flutter/material.dart';

class InspectionStep6EnginePage extends StatefulWidget {
  const InspectionStep6EnginePage({super.key});

  @override
  State<InspectionStep6EnginePage> createState() =>
      _InspectionStep6EnginePageState();
}

class _InspectionStep6EnginePageState extends State<InspectionStep6EnginePage> {
  final Map<String, int?> scores = {
    "Getaran Mesin": null,
    "Suara Mesin": null,
    "Transmisi": null,
    "Pompa Power Steering": null,
    "Cover Timming Chain": null,
    "Oli Power Steering": null,
    "Accu": null,
    "Kompressor AC": null,
    "Fan": null,
    "Selang": null,
    "Karter oli": null,
    "Oli Rem": null,
    "Kabel": null,
    "Kondensor": null,
    "Radiator": null,
    "Cylinder Head": null,
    "Oli Mesin": null,
    "Air Radiator": null,
    "Cover Klep": null,
    "Alternator": null,
    "Water Pump": null,
    "Belt": null,
    "Oli Transmisi": null,
    "Cylinder Block": null,
    "Tutup Radiator": null,
  };

  bool bushingKecil = false;
  bool bushingBesar = false;
  bool bushingBesarTidakAda = false;

  final TextEditingController notesController = TextEditingController();

  Widget buildScoreRow(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 4,
          children: List.generate(10, (index) {
            final score = index + 1;
            return ChoiceChip(
              label: Text('$score'),
              selected: scores[label] == score,
              onSelected: (_) {
                setState(() {
                  scores[label] = score;
                });
              },
            );
          }),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("5/12")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Hasil Inspeksi Mesin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...scores.keys.map((key) => buildScoreRow(key)),
            const SizedBox(height: 8),
            const Text("Bushing Besar"),
            Row(
              children: [
                Checkbox(
                  value: bushingBesar,
                  onChanged:
                      (val) => setState(() {
                        bushingBesar = val ?? false;
                        if (bushingBesar) bushingBesarTidakAda = false;
                      }),
                ),
                const Text("Ada"),
                const SizedBox(width: 16),
                ChoiceChip(
                  label: const Text("Tidak ada"),
                  selected: bushingBesarTidakAda,
                  onSelected: (_) {
                    setState(() {
                      bushingBesarTidakAda = true;
                      bushingBesar = false;
                    });
                  },
                ),
              ],
            ),
            const Text("Bushing Kecil"),
            CheckboxListTile(
              value: bushingKecil,
              onChanged: (val) => setState(() => bushingKecil = val ?? false),
              title: const Text("Ada"),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            const Text("Catatan"),
            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "- Catatan 1\n- Catatan 2\n- Catatan 3",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
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
                    Navigator.pushNamed(context, '/step12_photo');
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
