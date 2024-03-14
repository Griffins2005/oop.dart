import 'dart:io';

// Interface for a generic data source
abstract class DataSource {
  void loadData(String filePath);
}

// Base class representing a person
class Person {
  late String name;
  late int age;

  Person(this.name, this.age);

  // Method to display person's information
  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

// Derived class from Person implementing DataSource interface
class Employee extends Person implements DataSource {
  late String department;

  Employee(String name, int age, this.department) : super(name, age);

  // Overriding displayInfo method to include department
  @override
  void displayInfo() {
    super.displayInfo();
    print('Department: $department');
  }

  // Load employee data from a file
  @override
  void loadData(String filePath) {
    final file = File(filePath);
    final lines = file.readAsLinesSync();
    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length == 3) {
        name = parts[0];
        age = int.parse(parts[1]);
        department = parts[2];
      }
    }
  }
}

void main() {
  // Creating an instance of Employee
  var employee = Employee('', 0, '');

  // Loading data from a file
  employee.loadData('employee_data.txt');

  // Displaying employee information
  employee.displayInfo();

  // Demonstrating the use of a loop
  print('Loop demonstration:');
  for (var i = 1; i <= 5; i++) {
    print('Iteration $i');
  }
}
