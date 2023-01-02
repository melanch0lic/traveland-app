import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../widgets/appbar.dart';
import '../../widgets/filter_header.dart';
import '../../widgets/search_widget.dart';
import 'components/tour_card.dart';
import 'tours_page_model.dart';

class ToursPage extends StatelessWidget {
  const ToursPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            ToursPageViewModel(tripsterApiService: context.read<InitializeProvider>().tripsterApiService),
        child: Builder(
          builder: (context) {
            final isLoading = context.select((ToursPageViewModel model) => model.isLoading);
            final tours = context.select((ToursPageViewModel model) => model.tours);
            return isLoading
                ? const Center(child: CircularProgressIndicator())
                : Scaffold(
                    body: SafeArea(
                      child: Column(
                        children: [
                          const CustomAppBar(),
                          const SearchWidget(),
                          const FilterHeader(),
                          if (tours != null)
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => TourCard(tour: tours[index]),
                                itemCount: context.select((ToursPageViewModel model) => model.tours!.length),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
