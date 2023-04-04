import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../places_page/places_page_model.dart';
import 'components/use_filter_button_location.dart';

class FilterLocationsPage extends StatelessWidget {
  final PlacesPageViewModel viewModel;
  const FilterLocationsPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Builder(builder: (context) {
        final currentCategoryMode = context.select((PlacesPageViewModel model) => model.currentCategoryMode);
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
                    value: CategoryLocationMode.all,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
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
                  'Рестораны',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryLocationMode.restaurant,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
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
                  'Кафе',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryLocationMode.cafe,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
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
                  'Бары',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryLocationMode.bar,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
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
                  'Быстрое питание',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryLocationMode.fastfood,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
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
                  'Пиццерии',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryLocationMode.pizza,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
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
                  'Памятники культуры',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Radio(
                    value: CategoryLocationMode.culture,
                    groupValue: currentCategoryMode,
                    onChanged: (CategoryLocationMode? value) =>
                        context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              ],
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            const SizedBox(height: 45),
            const UseFilterButtonLocation(),
          ]),
        );
      }),
    );
  }
}
