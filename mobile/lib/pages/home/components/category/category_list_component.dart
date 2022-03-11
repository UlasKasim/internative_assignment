import 'package:flutter/material.dart';
import 'package:kernel/kernel.dart';

import 'category_component.dart';

class CategoryListComponent extends StatelessWidget {
  final List<Category> categoryList;
  final Category? selectedCategory;
  final Function(Category) onCategorySelected;
  final double height;
  const CategoryListComponent({
    Key? key,
    required this.categoryList,
    this.selectedCategory,
    required this.onCategorySelected,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (_, i) {
          Category category = categoryList[i];
          return InkWell(
            onTap: () => onCategorySelected.call(category),
            child: CategoryComponent(
              category: category,
              isSelected: selectedCategory == null ? false : selectedCategory!.id == category.id,
            ),
          );
        },
      ),
    );
  }
}
