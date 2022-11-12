import 'package:flutter/material.dart';
import 'package:hackground_app/app_localizations.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          translate(context, "profile_appbar_text"),
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.black, size: 20)),
        )
      ],
    );
  }
}
