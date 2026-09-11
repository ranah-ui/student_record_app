import 'package:flutter/material.dart';
import 'package:student_record_app/models/student.dart';
import 'package:student_record_app/pages/edit_student_page.dart';
import 'package:student_record_app/services/hive_service.dart';

class StudentDetailPage extends StatelessWidget {
   
   final Student student;

   final dynamic studentkey;


  const StudentDetailPage({super.key, required this.student, required this.studentkey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        actions: [
          IconButton(onPressed: () async{
            final updated = await
            Navigator.push(context,
             MaterialPageRoute(builder: (context)=>EditStudentPage(student: student,
            studentkey:studentkey)));

            if(updated == true && context.mounted){
              Navigator.pop( context, true);
            }
          }, icon: Icon(Icons.edit)),

          IconButton(onPressed: () async{

            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                   title: const Text('Delete Student?'),
                   content: const Text(
                    'Are you sure you want to delete this student?', ),
                    actions: [TextButton(
                      onPressed: () => Navigator.pop(context, false),
                       child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Delete'),
                            ),
                            ],
                             );
                              },
                              );
                               if(confirm == true){
                                 HiveService.deleteStudent(studentkey);

        if(context.mounted){
          Navigator.pop(context, true);

        }
      }
          },
           icon: Icon(Icons.delete))

        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(student.image),
          
            ),

            SizedBox(height: 24),

            Text(
              'Name: ${student.name}',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 12),

            Text(
              'Age: ${student.age}',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 12),

            Text(
              'Class: ${student.course}',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 12),

            Text(
              'Address: ${student.address}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}