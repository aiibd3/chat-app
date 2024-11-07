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
                    Navigator.pushNamed(context, '/profile_page');
                  },
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('P R O F I L E'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    // Navigate to profile page
                    Navigator.pushNamed(context, '/users_page');
                  },
                  leading: Icon(
                    Icons.group,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: const Text('U S E R S'),
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
