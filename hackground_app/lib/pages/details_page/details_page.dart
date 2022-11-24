import 'package:flutter/material.dart';

import '../../models/attraction_model.dart';
import 'components/details_page_appbar.dart';
import 'components/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  final Attraction selectedModel;
  const DetailsPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(selectedModel.imgSrc!), fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          DetailsPageBody(selectedModel: selectedModel),
          const DetailsPageAppbar()
        ],
      ),
    );
  }
}
