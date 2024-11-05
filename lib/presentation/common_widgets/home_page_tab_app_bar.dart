import 'package:flutter/material.dart';

class HomePageTabAppBar extends StatelessWidget {
  final Widget leading;
  final Widget trailing;

  const HomePageTabAppBar({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: leading,
            ),
            IconButton(
              onPressed: () {},
              icon: trailing,
            ),
          ],
        ),
      ),
    );
  }
}
