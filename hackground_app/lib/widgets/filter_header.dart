import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget {
  final String? title;

  FilterHeader(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.tune,
                size: 16,
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
