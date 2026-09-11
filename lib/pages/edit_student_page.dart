import 'package:flutter/material.dart';
import 'package:student_record_app/models/student.dart';
import 'package:student_record_app/services/hive_service.dart';

class EditStudentPage extends StatefulWidget {

  final Student student;
  final dynamic studentkey;

  const EditStudentPage({
    super.key,
    required this.student,
    required this.studentkey
  });

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController courseController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.student.name);

    ageController =
        TextEditingController(text: widget.student.age.toString());

    courseController =
        TextEditingController(text: widget.student.course);

    addressController =
        TextEditingController(text: widget.student.address);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    courseController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Edit Student'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:  InputDecoration(
                hintText: 'Name',
              ),
            ),

             SizedBox(height: 16),

            TextField(
              controller: ageController,
              decoration:  InputDecoration(
                hintText: 'Age',
              ),
            ),

             SizedBox(height: 16),

            TextField(
              controller: courseController,
              decoration: InputDecoration(
                hintText: 'Class',
              ),
            ),

             SizedBox(height: 16),

            TextField(
              controller: addressController,
              decoration:  InputDecoration(
                hintText: 'Address',
              ),
            ),

             SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                final updatedStudent = Student(
                   name: nameController.text,
                   age: int.parse(ageController.text),
                   course: courseController.text,
                   address: addressController.text,
                   image: widget.student.image,
                   );
                    await HiveService.updateStudent(
                    widget.studentkey,
                   updatedStudent,);
                   if(mounted){
                    Navigator.pop(context, true);
                   }

              },
              child: const Text('Update Student'),
            ),
          ],
        ),
      ),
    );
  }
}