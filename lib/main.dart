import 'package:flutter/material.dart';
import 'package:student_record_app/services/hive_service.dart';
import 'package:student_record_app/pages/student_list_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentListPage(),

    
    );
  }
}