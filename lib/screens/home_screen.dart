import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${user.username}"),
            SizedBox(height: 10),

            Text("Email: ${user.email}"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
