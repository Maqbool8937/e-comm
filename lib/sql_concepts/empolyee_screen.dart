import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  Database? _database;

  // Step 1: Initialize Database
  Future<void> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'employees.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE employees (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            age INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  // Step 2: Insert Employee
  Future<void> _insertEmployee(String name, int age) async {
    await _database?.insert('employees', {'name': name, 'age': age});
    setState(() {});
  }

  // Step 3: Get All Employees
  Future<List<Map<String, dynamic>>> _getEmployees() async {
    return await _database?.query('employees') ?? [];
  }

  // Step 4: Update Employee
  Future<void> _updateEmployee(int id, String newName, int newAge) async {
    await _database?.update(
      'employees',
      {'name': newName, 'age': newAge},
      where: 'id = ?',
      whereArgs: [id],
    );
    setState(() {});
  }

  // Step 5: Delete Employee
  Future<void> _deleteEmployee(int id) async {
    await _database?.delete('employees', where: 'id = ?', whereArgs: [id]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employees')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getEmployees(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final employees = snapshot.data!;
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
              return ListTile(
                title: Text(employee['name']),
                subtitle: Text('Age: ${employee['age']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.green),
                      onPressed: () {
                        _updateEmployee(employee['id'], 'New Name', 28);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteEmployee(employee['id']);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertEmployee('John Doe', 25);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}