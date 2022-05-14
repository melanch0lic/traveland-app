import 'package:flutter/material.dart';

class TabsBarButton extends StatelessWidget {
  final int? index;
  final Function? changeSelectedPageIndex;
  final int? selectedPageIndex;
  final Icon? icon;

  const TabsBarButton({
    this.index,
    this.changeSelectedPageIndex,
    this.selectedPageIndex,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: selectedPageIndex == index
                    ? Colors.grey
                    : Colors.transparent),
            child: icon,
          ),
          onTap: () => changeSelectedPageIndex!(index)),
    );
  }
}
