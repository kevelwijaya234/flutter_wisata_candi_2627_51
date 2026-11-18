import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wisata_candi_2627_51/providers/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";
  bool _obscurePassword = true;

  // Fungsi Sign In
  void _signIn() {
    final name = _userNameController.text.trim();

    if (name.isEmpty) {
      setState(() {
        _errorText = "Nama pengguna tidak boleh kosong";
      });
      return;
    }

    // Mengirim nama ke AuthProvider
    context.read<AuthProvider>().signIn(name);

    // Kembali ke ProfileScreen
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Todo 5 Pengguna
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                // Todo 6 Sandi
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Masukkan Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Todo 7 Sign In
                if (_errorText.isNotEmpty)
                  Text(_errorText, style: const TextStyle(color: Colors.red)),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _signIn,
                  child: const Text('Sign in'),
                ),

                // Todo 8 Sign Up
                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    text: 'Belum Punya Akun',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
