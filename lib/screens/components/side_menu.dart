import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("activity.png"),
            ),
            DrawerListTile(
              title: "Dashboard",
              imgSrc: "dashboard.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Profile",
              imgSrc: "user.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              imgSrc: "setting.png",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.imgSrc,
    required this.press,
  }) : super(key: key);

  final String title, imgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: Image.asset(
        imgSrc,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
