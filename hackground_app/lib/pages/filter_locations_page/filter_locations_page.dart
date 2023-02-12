import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackground_app/pages/filter_locations_page/components/price_range_textfield_widget.dart';
import 'components/heading_and_switch_row.dart';
import 'components/heading_filter_widget.dart';
import 'components/main_category_filter_widget.dart';
import 'components/mini_filter_button.dart';
import 'components/sub_category_filter_widget.dart';
import 'components/use_filter_button.dart';

class FilterLocationsPage extends StatelessWidget {
  const FilterLocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          style: theme.textTheme.headline2!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: theme.primaryColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(children: [
          const SizedBox(height: 30),
          const HeadingFilterWidget(heading: 'Категория'),
          const SizedBox(height: 20),
          const MainCategoryFilterWidget(mainCategory: 'Категория 1'),
          const SubCategoryFilterWidget(subCategory: 'Подкатегория 1'),
          const SubCategoryFilterWidget(subCategory: 'Подкатегория 2'),
          const SubCategoryFilterWidget(subCategory: 'Подкатегория 3'),
          // const MainCategoryFilterWidget(mainCategory: 'Категория 2'),
          //const SubCategoryFilterWidget(subCategory: 'Подкатегория 1'),
          // const SubCategoryFilterWidget(subCategory: 'Подкатегория 2'),
          // const SubCategoryFilterWidget(subCategory: 'Подкатегория 3'),
          const SizedBox(height: 30),
          const HeadingFilterWidget(heading: 'АОАОАОАО'),
          const SizedBox(height: 15),
          Row(
            children: [
              MiniFilterButton(theme: theme, name: 'Один'),
              const SizedBox(width: 10),
              MiniFilterButton(theme: theme, name: 'Два'),
              const SizedBox(width: 10),
              MiniFilterButton(theme: theme, name: 'Три'),
              const SizedBox(width: 10),
              MiniFilterButton(theme: theme, name: 'Четыре'),
            ],
          ),
          const SizedBox(height: 30),
          const HeadingAndSwitchRow(),
          const SizedBox(height: 30),
          const HeadingFilterWidget(heading: 'Цена'),
          const SizedBox(height: 15),
          RangeSlider(
            inactiveColor: Color.fromRGBO(100, 83, 78, 1),
            activeColor: Color.fromRGBO(37, 65, 178, 1),
            max: 100.0,
            values: RangeValues(25, 85),
            onChanged: null,
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              PriceRangeTextFieldWidget(price: 3400),
              SizedBox(width: 30),
              PriceRangeTextFieldWidget(price: 14900),
            ],
          ),
          const SizedBox(height: 45),
          UseFilterButton(theme: theme),
        ]),
      ),
    );
  }
}
