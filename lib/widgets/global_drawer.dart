import 'package:flutter/material.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              // color: Theme.of(context).colorScheme.primary
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                // color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Open ChatAI'),
            onTap: () {
              // Close the drawer and navigate to A.dart
              // Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ChatScreen()),
              // );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/a', (route) => route.isFirst);
            },
          ),
          ListTile(
            title: const Text('Open CraftAI'),
            onTap: () {
              // // Close the drawer and navigate to B.dart
              // Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreen()),
              // );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/b', (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
