import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:kernel/kernel.dart';

class CategoryComponent extends StatelessWidget {
  final Category category;
  final bool isSelected;
  const CategoryComponent({
    Key? key,
    required this.category,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          shadowColor: Colors.grey,
          child: Container(
            height: Suw.portionHeight(context, 0.15),
            width: Suw.w(context, 500),
            decoration: KDecoration.boxDecoration(
              backgroundImagePath: category.image!,
              borderRadius: BorderRadius.circular(15),
              borderColor: isSelected ? KColors.primaryColor : Colors.transparent,
              borderWidth: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 5),
          child: Text(
            category.title!,
            style: KTextStyle.h3(),
          ),
        ),
      ],
    );
  }
}
