import 'package:flutter/material.dart';
import 'package:flutter_wisata_candi_2627_51/providers/auth_provider.dart';
import 'package:flutter_wisata_candi_2627_51/providers/favorite_provider.dart';
import 'package:flutter_wisata_candi_2627_51/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteCount = context.watch<FavoriteProvider>().count;
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),

          Column(
            children: [
              // Todo 2 Profile Header
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.purple),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'images/placeholder_image.png',
                          ),
                        ),
                      ),

                      if (auth.isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Todo 3 Profile Info

              // Pengguna
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Row(
                      children: [
                        Icon(Icons.lock, color: Colors.amber),
                        SizedBox(width: 8),
                        Text(
                          "Pengguna",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' : ${auth.isSignedIn ? auth.userName : "Pengguna"}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),
              const Divider(color: Colors.deepPurple),

              // Name
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' : ${auth.isSignedIn ? auth.userName : "Belum Login"}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),
              const Divider(color: Colors.deepPurple),

              // Favorite
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 8),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' : $favoriteCount',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),
              const Divider(color: Colors.deepPurple),

              const SizedBox(height: 16),

              // Todo 4 Profile Action
              auth.isSignedIn
                  ? TextButton(
                    onPressed: () {
                      context.read<AuthProvider>().signOut();
                    },
                    child: const Text("Sign Out"),
                  )
                  : TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text("Sign In"),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
