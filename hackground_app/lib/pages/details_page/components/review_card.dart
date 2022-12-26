import 'package:flutter/material.dart';

import '../../../domain/models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 320,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color.fromRGBO(149, 157, 165, 0.25), offset: Offset(0, 8))]),
      child: const Text('fasf'),
    );
  }
}
