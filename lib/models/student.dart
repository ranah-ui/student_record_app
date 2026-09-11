import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String course;

  @HiveField(3)
  String address;

  @HiveField(4)
  String image;

  Student({
    required this.name,
    required this.age,
    required this.course,
    required this.address,
    required this.image,
  });
}