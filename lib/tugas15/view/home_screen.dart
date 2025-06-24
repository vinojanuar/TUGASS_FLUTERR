import 'package:flutter/material.dart';
import 'package:tugass_fluterr/tugas15/api/user_api.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({super.key});
  static const String id = "/profile_user_screen";

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  final TextEditingController nameController = TextEditingController();

  void _showEditDialog(String currentName) {
    nameController.text = currentName;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Edit Name'),
            content: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final updateName = nameController.text;

                  // TODO: Tambahkan logic update nama jika API tersedia
                  UserService().updateProfile(name: updateName);
                  Navigator.pop(context);
                  setState(() {}); // refresh tampilan
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: UserService().getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final user = snapshot.data?["data"];

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/default_avatar.png',
                    ), // Ganti sesuai asetmu
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => _showEditDialog(user?["name"] ?? ""),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user?["name"] ?? "-",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.edit, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user?["email"] ?? "-",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  // Tambahan informasi lainnya bisa ditaruh di sini
                  Card(
                    margin: const EdgeInsets.only(top: 20),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: const Text("Nama Lengkap"),
                      subtitle: Text(user?["name"] ?? "-"),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.only(top: 10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.email_outlined),
                      title: const Text("Email"),
                      subtitle: Text(user?["email"] ?? "-"),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          }
        },
      ),
    );
  }
}
