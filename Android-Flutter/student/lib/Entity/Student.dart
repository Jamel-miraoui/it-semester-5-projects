import 'dart:convert';

// student.dart

class Student {
   int id;
   String name;
   int age;
   String studentId;

  Student({
    this.id = 0 ,
    this.name = "",
    this.age = 0,
    this.studentId = "",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'studentId': studentId,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      studentId: map['studentId'] as String,
    );
  }


  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, name: $name, age: $age, studentId: $studentId)';
  }

  void setName(String? value) {
    this.name;
  }


}
