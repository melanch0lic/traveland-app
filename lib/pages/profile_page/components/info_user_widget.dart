import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../profile_page_model.dart';

class InfoUserWidget extends StatelessWidget {
  const InfoUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = context.select((ProfilePageViewModel model) => model.userInfo);
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 25),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: Offset.fromDirection(0, 8),
              color: const Color.fromRGBO(149, 157, 165, 0.2),
            )
          ]),
      child: userInfo == null
          ? const Center(
              child: Text('Информация не получена'),
            )
          : Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: SvgPicture.asset(
                    'assets/images/avatar_icon.svg',
                    width: 100,
                    height: 100,
                  )),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${userInfo.name} ${userInfo.lastName.value}',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                userInfo.mail,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ]),
    );
  }
}
