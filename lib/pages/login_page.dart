import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';
import '../error/error.dart'; // Assuming you have an error dialog component

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final void Function()? onTap;

  void login(BuildContext context) async {
    // Check if fields are empty
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      errorDialog(context, "Please fill out all fields");
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Log in user with Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Close the loading dialog on success
      if (context.mounted) Navigator.of(context).pop();

      // Optionally, navigate to another screen here
      // Navigator.of(context).pushReplacement(...);
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the loading dialog
      errorDialog(context, e.message ?? "An error occurred during login.");
    } catch (e) {
      Navigator.of(context).pop(); // Close the loading dialog
      errorDialog(context, "An unknown error occurred.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 20),

              // app name
              Text(
                "Aiibd3",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),

              // email text field
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),

              // password text field
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),

              // forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // login button
              MyButton(
                text: "Login",
                onTap: () => login(context),
              ),

              const SizedBox(height: 20),

              // don't have an account? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
