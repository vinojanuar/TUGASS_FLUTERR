import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas15/api/user_api.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({super.key});
  static const String id = "/profile_user_screen";

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserService().getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final user = snapshot.data?["data"];
            print(user);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final nameController = TextEditingController(
                            text: user?["name"],
                          );
                          return AlertDialog(
                            title: Text('Edit Name'),
                            content: TextField(
                              controller: nameController,
                              decoration: InputDecoration(labelText: 'Name'),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Save logic here
                                  // For example, call an API to update the name
                                  // UserService().updateProfile(
                                  //   name: nameController.text,
                                  // );
                                  Navigator.of(context).pop();
                                  setState(() {});
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(user?["name"] ?? "sdasd"),
                  ),
                  Text(user?["email"] ?? "sdasd"),
                ],
              ),
            );
          } else {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
        },
      ),
    );
  }
}
