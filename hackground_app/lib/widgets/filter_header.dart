import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget {
  final String? title;

  const FilterHeader(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.tune,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Фильтры',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
