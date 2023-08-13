import 'package:flutter/material.dart';

class UpScrollWidget extends StatelessWidget {
  final Function callback;
  const UpScrollWidget({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 15,
      child: GestureDetector(
        onTap: () {
          callback();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: [BoxShadow(color: Color.fromRGBO(149, 157, 165, 0.25), spreadRadius: 2)]),
          child: Center(
              child: Icon(
            Icons.expand_less,
            color: Theme.of(context).highlightColor,
          )),
        ),
      ),
    );
  }
}
