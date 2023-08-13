import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.left,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 18),
                hintText: tr('search_text'),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(bottom: 12),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
