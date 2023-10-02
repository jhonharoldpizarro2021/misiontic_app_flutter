// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../routes/pageRoute.dart';
import '../widgets/createDrawerBodyItem.dart';
import '../widgets/createDrawerHeader.dart';

class NavigationDrawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.map,
            text: 'Ubicaciones',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.ubicaciones),
          ),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Productos',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.productos),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Notifications',
            onTap: () => Navigator.pushReplacementNamed(
                context, PageRoutes.notification),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Chat Info',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.contact),
          ),
          const Divider(),
          createDrawerBodyItem(
              icon: Icons.exit_to_app,
              text: 'Salir',
              onTap: () => {
                    FirebaseAuth.instance.signOut(),
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, PageRoutes.login),
                  }),
        ],
      ),
    );
  }
}
