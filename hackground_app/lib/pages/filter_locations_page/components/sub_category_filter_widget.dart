import 'package:flutter/material.dart';

class SubCategoryFilterWidget extends StatelessWidget {
  final String subCategory;
  const SubCategoryFilterWidget({
    Key? key,
    required this.subCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subCategory,
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
      ),
    );
  }
}
