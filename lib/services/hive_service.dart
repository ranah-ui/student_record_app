import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_record_app/models/student.dart';


class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(StudentAdapter());
    await
    Hive.openBox<Student>('students');
  }
  static Future<void> addStudent(Student student) async {
    final box = Hive.box<Student>('students');
    await box.add(student);
  }

  static Future<void> updateStudent( dynamic key, Student student) async {
    final box = Hive.box<Student>('students');
    await box.put(key, student);
  } 

  static Future<void> deleteStudent(dynamic key) async {
    final box = Hive.box<Student>('students');
    await box.delete(key);
  }



  static List<Student> getStudents() {
  final box = Hive.box<Student>('students');
  return box.values.toList();
}

static List<dynamic>getStudentKeys()
{
  final box = Hive.box<Student>('students');
  return box.keys.toList();
}




static Future<void> clearStudents()
async {
  final box = Hive.box<Student>('students');
  await box.clear();
}
}
