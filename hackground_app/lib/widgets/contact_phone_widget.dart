import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPhoneWidget extends StatelessWidget {
  final String phoneNumber;
  final String text;
  const ContactPhoneWidget({Key? key, required this.phoneNumber, required this.text}) : super(key: key);

  Future<void> openPhoneNumber(BuildContext context) async {
    final String phoneAppUrl = 'tel://$phoneNumber';
    final Uri phoneAppUrlRequest = Uri.parse(phoneAppUrl);

    try {
      await launchUrl(phoneAppUrlRequest);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Phone Error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => openPhoneNumber(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/phone_icon.svg',
            width: 16,
            height: 16,
            color: theme.primaryColorDark,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
