import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: SizedBox(
          height: 50,
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[500], fontSize: 18),
                hintText: "Поиск",
                fillColor: Colors.grey.withOpacity(0.4),
                filled: true,
                prefixIcon: const Icon(
                  // отцентрировать Иконку
                  Icons.search,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                )),
          )),
    );
  }
}
