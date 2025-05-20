import 'package:flutter/material.dart';
import 'pages/inspection_step6_engine_page.dart';
import 'pages/inspection_step12_photo_page.dart';
import 'pages/inspection_step13_photo_page.dart';
import 'pages/inspection_step14_vehicle_photo_page.dart';
import 'pages/inspection_step15_photo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspeksi Mobil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      // Set halaman pertama saat app dibuka
      initialRoute: '/step6_engine',
      routes: {
        '/step6_engine': (context) => const InspectionStep6EnginePage(),
        '/step12_photo': (context) => const InspectionStep12PhotoPage(),
        '/step13_photo': (context) => const InspectionStep13PhotoPage(),
        '/step14_photo': (context) => const InspectionStep14VehiclePhotoPage(),
        '/step15_photo': (context) => const InspectionStep15PhotoPage(),
      },
    );
  }
}
