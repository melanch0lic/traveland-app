import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/router.gr.dart';
import '../pages/tabs_page/tabs_page_model.dart';

class NameRowHeaderHousing extends StatelessWidget {
  final String name;

  const NameRowHeaderHousing({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: () {
            context.read<TabsPageViewModel>().changeRouterIndex(1);
            context.navigateTo(const HotelsRouter());
          },
          child: Text(
            'Больше',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color.fromRGBO(37, 65, 178, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
