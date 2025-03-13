import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_drawer_tile.dart';

import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Icon(
            Icons.lock_open_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),

        //home list Tile,
        MyDrawerTile(
          text: "HOME",
          icon: Icons.home,
          onTap: () => Navigator.pop(context),
        ),
        MyDrawerTile(
            text: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            }),

        const Spacer(),

        MyDrawerTile(
          text: "LOGOUT",
          icon: Icons.logout,
          onTap: logout,
        ),
        const SizedBox(
          height: 25,
        ),
      ]),
    );
  }
}
