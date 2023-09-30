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
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Open ChatGPT Screen'),
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
            title: const Text('Open ImageGen Screen'),
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
