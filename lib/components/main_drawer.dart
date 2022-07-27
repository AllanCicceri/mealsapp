import 'package:flutter/material.dart';
import 'package:meal/util/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(icon, size: 25),
      title: Text(
        label,
        style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w800,
            fontSize: 20,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: () => onTap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              'Let' 's Cook!',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          _createItem(Icons.restaurant, 'Recipes',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          const Divider(endIndent: 20, indent: 20),
          _createItem(
            Icons.settings,
            'Settings',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          )
        ],
      ),
    );
  }
}
