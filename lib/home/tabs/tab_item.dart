import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/home/app_colors.dart';

import 'package:news_app/Model/SourceResponse.dart';


class TabItem extends StatelessWidget {
  TabItem({required this.isselected,required this.source});

  bool isselected;
  Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryLightColor, width: 4),
          color: isselected? AppColors.primaryLightColor:
          Colors.transparent
      ),
      child: Text(source.name??'', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: isselected? AppColors.whiteColor: AppColors.primaryLightColor),),
    );

  }
}