import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionsIconsAppBarWidget extends StatelessWidget {
  const ActionsIconsAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 15,
          icon: SvgPicture.asset(
            'assets/images/Share.svg',
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          splashRadius: 15,
          icon: SvgPicture.asset(
            'assets/images/heart.svg',
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          splashRadius: 15,
          icon: SvgPicture.asset(
            'assets/images/More.svg',
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
