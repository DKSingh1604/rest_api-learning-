import 'package:flutter/material.dart';

import 'package:rest_api/model/user.dart';
import 'package:rest_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("REST API Call"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index + 1];

          return GestureDetector(
            onTap: () {
              print("Name: ${user.fullName}");
              print("Gender: ${user.gender}");
              print("Phone: ${user.phone}");
              print("Nationality: ${user.nat}");
              print("DOB: ${user.dob.date.toString()}");
              print("Age: ${user.dob.age}");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: user.gender == 'male' ? Colors.blue : Colors.green,
                leading: Image.network(user.picture!.thumbnail),
                title: Text(user.fullName),
                subtitle: Text(
                    "${user.location.city}, ${user.location.country}, ${user.location.postcode}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
