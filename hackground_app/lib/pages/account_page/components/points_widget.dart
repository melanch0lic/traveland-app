import 'package:flutter/material.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset.zero,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('254 балла', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(
            'Как тратить баллы?',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
