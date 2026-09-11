import 'package:flutter/material.dart';
import 'package:student_record_app/models/student.dart';
import 'package:student_record_app/services/hive_service.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final classController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),

      body:Padding(padding: EdgeInsets.all(16),
       child:Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )
            ),
          ),

          SizedBox(height:16,),

          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: "Age",
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
            ),
          ),),

          SizedBox(height: 16,),

          TextField(
            controller: classController,
            decoration: InputDecoration(
              labelText: "Class",
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
            ),
          ),
          ),

          SizedBox(height: 16),

          TextField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: "Address",
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),)
            ),
          ),

          SizedBox(height: 16,),
          

          ElevatedButton(onPressed: ()async{
            final student = Student(name: nameController.text, age: int.parse(ageController.text),
            course: classController.text , address: addressController.text,
            image: '',);
            await
             HiveService.addStudent(student);

             if(!mounted) return;

             Navigator.pop(context);

          },
           child: Text("Save Students")
           )
       
       ],
      )
    ));
  }
}