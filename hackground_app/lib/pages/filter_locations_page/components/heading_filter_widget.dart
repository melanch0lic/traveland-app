import 'package:flutter/material.dart';

class HeadingFilterWidget extends StatelessWidget {
  final String heading;
  const HeadingFilterWidget({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline1?.copyWith(
            fontSize: 20,
            color: const Color.fromRGBO(44, 44, 46, 1),
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
