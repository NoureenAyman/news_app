import 'package:flutter/material.dart';
import 'package:news_app/home/app_colors.dart';

class Category{
  String id;
  String title;
  String imagePath;
  Color color;

  Category({required this.id,required this.title,required this.imagePath,required this.color});

  static List<Category> getCategories(){
    return[
      Category(id: 'sports', title: 'Sports',
          imagePath: 'assets/images/ball.png', color: AppColors.redColor),
      Category(id: 'general', title: 'Politics',
          imagePath: 'assets/images/Politics.png', color: AppColors.darkBlueColor),
      Category(id: 'health', title: 'Health',
          imagePath: 'assets/images/health.png', color: AppColors.pinkColor),
      Category(id: 'business', title: 'Business',
          imagePath: 'assets/images/bussines.png', color: AppColors.brownColor),
      Category(id: 'technology', title: 'Enviroment',
          imagePath: 'assets/images/environment.png', color: AppColors.blueColor),
      Category(id: 'science', title: 'Science',
          imagePath: 'assets/images/science.png', color: AppColors.yellowColor),




    ];
  }
}

