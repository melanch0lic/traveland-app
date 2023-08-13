import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTripsterWidget extends StatelessWidget {
  final String url;
  const ContactTripsterWidget({Key? key, required this.url}) : super(key: key);

  Future<void> openWebsite(BuildContext context) async {
    final Uri websiteAppUrlRequest =
        Uri.parse('$url?exp_partner=t978916&utm_campaign=affiliates&utm_medium=api&utm_source=t978916');

    try {
      await launchUrl(websiteAppUrlRequest);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Website Error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => openWebsite(context),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/browser_icon.svg',
            width: 20,
            height: 20,
            color: theme.primaryColorDark,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Заказать тур',
            style: theme.textTheme.bodyLarge!
                .copyWith(color: theme.indicatorColor, fontWeight: FontWeight.w400, fontSize: 20),
          )
        ],
      ),
    );
  }
}
