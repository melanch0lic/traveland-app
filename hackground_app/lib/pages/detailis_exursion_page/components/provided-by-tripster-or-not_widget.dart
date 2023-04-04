import 'package:flutter/material.dart';

class ProvidedByTripsterOrNotWidget extends StatelessWidget {
  const ProvidedByTripsterOrNotWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 19.5, right: 19.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: const Color.fromRGBO(56, 176, 0, 1),
      ),
      child: Text('Предоставлено Tripster',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
    );
  }
}
