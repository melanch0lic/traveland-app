import 'package:flutter/material.dart';

class PriceRangeTextFieldWidget extends StatelessWidget {
  final int price;
  const PriceRangeTextFieldWidget({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: const Color.fromRGBO(44, 44, 46, 1),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 16,
            minHeight: 14,
          ),
          hintText: 'От ${price} ₽',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(width: 2, color: Color.fromRGBO(142, 142, 147, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
