abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print("Role: Person");
  }
}

class Student extends Person {
  String studentID;
  double averageScore = 0.0;
  List<double> courseScores = [];

  Student(String name, int age, String address, this.studentID)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  void addCourseScore(double score) {
    courseScores.add(score);
    calculateAverageScore();
  }

  void calculateAverageScore() {
    if (courseScores.isNotEmpty) {
      averageScore = courseScores.reduce((a, b) => a + b) / courseScores.length;
    }
  }

  void printStudentInfo() {
    print("Student Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: $averageScore");
    print("\n");
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void addCourseTaught(String course) {
    coursesTaught.add(course);
  }

  void printTeacherInfo() {
    print("Teacher Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
    print("\n");
  }
}

void main() {
  var student = Student("Omi", 20, "Uttara-Dhaka", "S123");
  var teacher = Teacher("Rafat", 35, "Mirpur-Dhaka", "T456");

  student.addCourseScore(50);
  student.addCourseScore(80);
  student.addCourseScore(75);

  teacher.addCourseTaught("Math");
  teacher.addCourseTaught("English");
  teacher.addCourseTaught("Bangla");

  student.printStudentInfo();
  teacher.printTeacherInfo();
}
