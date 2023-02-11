import 'package:flutter/material.dart';

class MainCategoryFilterWidget extends StatelessWidget {
  final String mainCategory;
  const MainCategoryFilterWidget({
    Key? key,
    required this.mainCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mainCategory,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Radio(value: 1, groupValue: false, onChanged: null)
          ],
        ),
        const Divider(
          height: 1,
          color: Color.fromRGBO(142, 142, 147, 1),
        ),
      ],
    );
  }
}
