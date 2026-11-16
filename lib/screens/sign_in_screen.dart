import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText="";
  bool _isSignedIn=false;
  bool _obscurePassword=true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              //todo 5 Pengguna 
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: "Nama Pengguna",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //todo 6 Sandi
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: "Masukkan Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //todo 7 Sign in
              //todo 8 Sign up
            ]
          ),
        ),
      ),
    );
  }
}