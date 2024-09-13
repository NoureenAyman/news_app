import 'package:flutter/material.dart';
import 'package:news_app/home/category/category.dart';
import 'package:news_app/home/category/category_item.dart';


class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();

Function onCategoryItemClick;
CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Pick your category \nof interest',
            style: Theme.of(context).textTheme.titleMedium,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                mainAxisSpacing: 10,
                crossAxisSpacing:10 ),

                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryItemClick(categoriesList[index]);
                    },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
            itemCount: categoriesList.length,
            ),
          )
        ],
      ),

    );
  }
}