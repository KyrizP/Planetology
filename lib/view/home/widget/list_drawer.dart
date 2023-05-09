import 'package:flutter/material.dart';

class ListDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget page;

  const ListDrawer({
    super.key,
    required this.title,
    required this.icon,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 45,
      color: Colors.transparent,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animations, secondaryAnimations) => page,
              transitionsBuilder:
                  (context, animations, secondaryAnimations, childs) {
                final tween = Tween(begin: 0.0, end: 1.0);
                return FadeTransition(
                  opacity: animations.drive(tween),
                  child: childs,
                );
              },
            ),
          );
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey,
            ),
            const SizedBox(width: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
