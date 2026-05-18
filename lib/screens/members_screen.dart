import 'package:flutter/material.dart';
import '../services/toast_service.dart'; // adjust path if moved to core/services

class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<Map<String, String>> members = [];

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  void openAddMemberDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Member"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone"),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  members.add({
                    "name": nameController.text,
                    "phone": phoneController.text,
                  });
                });

                nameController.clear();
                phoneController.clear();

                Navigator.pop(context);

                // 🔥 SHOW TOAST
                ToastService.showSuccess("Member added successfully");
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // 🔥 ADD BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: openAddMemberDialog,
        child: Icon(Icons.add, color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: members.isEmpty
            ? Center(
                child: Text(
                  "No Members Yet",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                        label:
                            Text("Name", style: TextStyle(color: Colors.yellow))),
                    DataColumn(
                        label:
                            Text("Phone", style: TextStyle(color: Colors.yellow))),
                  ],
                  rows: members
                      .map(
                        (member) => DataRow(cells: [
                          DataCell(Text(member["name"]!,
                              style: TextStyle(color: Colors.white))),
                          DataCell(Text(member["phone"]!,
                              style: TextStyle(color: Colors.white))),
                        ]),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }
}