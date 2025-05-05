import 'package:flutter/material.dart';

class Templatepp extends StatefulWidget {
  const Templatepp({super.key, required this.lstring, required this.valuestring});
  final List<String> lstring;
  final List<int?> valuestring;

  @override
  State<Templatepp> createState() => _TemplateppState();
}

class _TemplateppState extends State<Templatepp> {
  void _selectValue(int index, int value) {
    setState(() {
      widget.valuestring[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lstring.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.lstring[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: List.generate(10, (i) {
                final number = i + 1;
                final isSelected = widget.valuestring[index] == number;
                return GestureDetector(
                  onTap: () => _selectValue(index, number),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    height: 34,
                    width:34,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue, width: 2),
                      color: isSelected ? Colors.lightBlue : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        number.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
