import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/router.gr.dart';
import '../pages/tabs_page/tabs_page_model.dart';

class NameRowHeaderExcursions extends StatelessWidget {
  final String? name;
  final Function? callback;

  const NameRowHeaderExcursions({Key? key, this.name, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name!,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: callback != null
              ? callback!()
              : () {
                  context.read<TabsPageViewModel>().changeRouterIndex(1);
                  context.navigateTo(const PlacesRouter());
                },
          child: Text(
            'Больше',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
