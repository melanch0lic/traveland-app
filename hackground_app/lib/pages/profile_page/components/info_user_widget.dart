import 'package:flutter/material.dart';
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
              const CircleAvatar(
                maxRadius: 50,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/51/74/e1/5174e13045467efb22e6c65e82815d5c.jpg',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${userInfo.name} ${userInfo.lastName.value}',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                userInfo.mail,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ]),
    );
  }
}
