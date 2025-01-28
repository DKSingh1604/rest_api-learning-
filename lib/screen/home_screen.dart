import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  void fetchUsers() async {
    print("Fetched Users");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print("Fetching completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("REST API Call"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user['email'];
          final name = user['name']['first'];
          final imageUrl = user['picture']['thumbnail'];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
              child: ListTile(
                tileColor: Colors.grey,
                // leading: Text('${index + 1}'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Image.network(
                    imageUrl,
                    width: 50,
                  ),
                ),
                title: Text(name.toString()),
                subtitle: Text(email),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Text("Fetch"),
      ),
    );
  }
}
