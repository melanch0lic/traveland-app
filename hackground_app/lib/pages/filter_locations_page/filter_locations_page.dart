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
          body: ListView(padding: const EdgeInsets.symmetric(vertical: 30), children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.all,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Без фильтров',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.all),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.culture,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Памятники культуры',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.culture),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.nature,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Природные памятники',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.nature),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.restaurant,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Рестораны',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () =>
                  context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.restaurant),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.cafe,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Кафе',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.cafe),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.bar,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Бары',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.bar),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.fastfood,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Быстрое питание',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.fastfood),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              leading: Radio(
                  value: CategoryLocationMode.pizza,
                  groupValue: currentCategoryMode,
                  onChanged: (CategoryLocationMode? value) =>
                      context.read<PlacesPageViewModel>().onLocationCategoryChanged(value!)),
              title: Text(
                'Пиццерии',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              onTap: () => context.read<PlacesPageViewModel>().onLocationCategoryChanged(CategoryLocationMode.pizza),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(142, 142, 147, 1),
            ),
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: UseFilterButtonLocation(),
            ),
          ]),
        );
      }),
    );
  }
}
