import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWebsiteWidget extends StatelessWidget {
  final String websiteUrl;
  const ContactWebsiteWidget({Key? key, required this.websiteUrl}) : super(key: key);

  Future<void> openWebsite(BuildContext context) async {
    final Uri websiteAppUrlRequest = Uri.parse(websiteUrl);

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
            width: 16,
            height: 16,
            color: theme.primaryColorDark,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Ссылка на сайт',
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
