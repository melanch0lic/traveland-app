import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../housings_page/housings_page_model.dart';
import 'components/use_filter_button_housing.dart';

class FilterHousingsPage extends StatelessWidget {
  final HousingsPageViewModel viewModel;
  const FilterHousingsPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Builder(builder: (context) {
        final currentCategoryMode = context.select((HousingsPageViewModel model) => model.currentCategoryMode);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              highlightColor: theme.cardColor,
              splashRadius: 15,
              icon: SvgPicture.asset(
                'assets/images/Cross.svg',
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Фильтры',
              style: theme.textTheme.displayMedium!.copyWith(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: theme.primaryColorLight,
          ),
          body: ListView(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30), children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Без фильтров',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryHousingMode.all,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryHousingMode? value) =>
                        context.read<HousingsPageViewModel>().onLocationCategoryChanged(value!)),
              ],
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Отели',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryHousingMode.hotel,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryHousingMode? value) =>
                        context.read<HousingsPageViewModel>().onLocationCategoryChanged(value!)),
              ],
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Гостевой дом',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryHousingMode.guestHouse,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryHousingMode? value) =>
                        context.read<HousingsPageViewModel>().onLocationCategoryChanged(value!)),
              ],
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Хостелы',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryHousingMode.hostel,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryHousingMode? value) =>
                        context.read<HousingsPageViewModel>().onLocationCategoryChanged(value!)),
              ],
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            const SizedBox(height: 45),
            const UseFilterButtonHousing(),
          ]),
        );
      }),
    );
  }
}
