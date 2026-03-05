import 'package:flutter/material.dart';
import 'package:login_form/service/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  final AuthService authService = AuthService();

  void login() async {
    setState(() {
      isLoading = true;
    });

    final user = await authService.login(
      usernameController.text,
      passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),

            SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 20),

            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: login, child: Text("Login")),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
