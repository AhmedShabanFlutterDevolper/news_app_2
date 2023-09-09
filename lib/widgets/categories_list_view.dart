import 'package:flutter/material.dart';

import '../models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/imges/business.jpeg',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/imges/entertaiment.jpg',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/imges/health.jpeg',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/imges/science.jpeg',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/imges/technology.jpg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/imges/sports.jpeg',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/imges/general.jpeg',
      categoryName: 'General',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
