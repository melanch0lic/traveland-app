import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/sent_write_review_button_excursions.dart';

class WriteReviewPage extends StatelessWidget {
  const WriteReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          highlightColor: theme.cardColor,
          splashRadius: 15,
          icon: SvgPicture.asset(
            'assets/images/back_arrow_icon.svg',
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Оставить отзыв',
          style:
              theme.textTheme.displayMedium!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: theme.primaryColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 30),
          Text(
            'Оценить жильё',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 20,
                  color: const Color.fromRGBO(44, 44, 46, 1),
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [...List.generate(5, (index) => buildStar(context, index, 0))],
          ),
          const SizedBox(height: 30),
          Text(
            'Отзыв',
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Container(
            height: 144,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15, left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(174, 174, 178, 1),
              ),
            ),
            child: Text(
              'Поделитесь своим мнением',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: const Color.fromRGBO(174, 174, 178, 1),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '0/2000',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const SentWriteReviewButtonExcursions()
        ]),
      ),
    );
  }
}

Widget buildStar(BuildContext context, int index, double rating) {
  Icon icon;
  if (index >= rating) {
    icon = const Icon(
      Icons.star_border,
      color: Color.fromRGBO(253, 197, 0, 1),
    );
  } else if (index > rating - 1 && index < rating) {
    icon = const Icon(Icons.star_half, color: Color.fromRGBO(253, 197, 0, 1));
  } else {
    icon = const Icon(Icons.star, color: Color.fromRGBO(253, 197, 0, 1));
  }
  return icon;
}
