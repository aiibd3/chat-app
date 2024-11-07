import 'package:chat_app/pages/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // home tile
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('H O M E'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    // Navigate to profile page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingPage()));
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('S E T T I N G S'),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                logout();
              },
              leading: Icon(
                Icons.logout_sharp,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text('L O G O U T'),
            ),
          ),
        ],
      ),
    );
  }
}
