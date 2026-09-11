import 'package:flutter/material.dart';
import 'package:student_record_app/models/student.dart';
import 'package:student_record_app/pages/add_student_page.dart';
import 'package:student_record_app/services/hive_service.dart';
import 'package:student_record_app/pages/student_detail_page.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {

  final TextEditingController searchController = TextEditingController();

  List<Student> students =[];
  List<Student> filteredStudents =[];
  List<dynamic> studentkeys =[];
  List<dynamic> filteredStudentKeys =[];
 
  @override
  void initState(){
    super.initState();

    students = HiveService.getStudents();
    studentkeys = HiveService.getStudentKeys();
    filteredStudents = students;
    filteredStudentKeys = studentkeys;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Student List"),
      ),
      body:Column(
        children:[
          Padding(padding: EdgeInsets.all(16),
          child:   TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                final query = value.toLowerCase();

                filteredStudents = [];
                filteredStudentKeys = [];
                
                for (int i = 0; i < students.length; i++) {
                  if (students[i].name.toLowerCase().contains(query)) {
                     filteredStudents.add(students[i]);
                     filteredStudentKeys.add(studentkeys[i]);
                      }
                      }
                      });},
          
            
              decoration: InputDecoration(
              hintText: "Search student",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
            ),
          ),
          ),
      Expanded(child:
      ListView.builder(
        itemCount: filteredStudents.length,
        itemBuilder: ((context, index){

          final student = filteredStudents[index];
          final key = filteredStudentKeys[index];


          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(student.name),
         

             onTap: () async{
              final updated =await
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDetailPage(student: student,
              studentkey: key)));

              if(updated==true){
                setState(() {
                  students = HiveService.getStudents();
                  studentkeys = HiveService.getStudentKeys();
                });
              }


             },
             );
        }
      )
      ),)]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudentPage(),
          ));

          if(!mounted) return;

          setState(() {
            students = HiveService.getStudents();
            studentkeys = HiveService.getStudentKeys();
            filteredStudents = students;
            filteredStudentKeys = studentkeys;
          });
        },
        child: const Icon(Icons.add),



        ),
    );
  }
}