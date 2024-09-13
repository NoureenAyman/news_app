import 'package:flutter/material.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/home/app_colors.dart';
import 'package:news_app/home/category/category.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/search/search.dart';
import 'package:news_app/home/settings/settings_tab.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: AppColors.whiteColor,
        child: Image.asset("assets/images/pattern@1x.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: Text(
            selectedItem == HomeDrawer.settings
                ? 'Settings'
                : selectedCategory == null
                ? 'News App'
                : selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Use the custom search delegate
                showSearch(context: context, delegate: NewsSearchDelegate());
              },
            ),
          ],
        ),

        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
        ),
        body: selectedItem == HomeDrawer.settings
            ? SettingsTab()
            : selectedCategory == null
            ? CategoryFragment(onCategoryItemClick: onCategoryItemClicked)
            : CategoryDetails(category: selectedCategory!),
      )
    ]);
  }

  Category? selectedCategory;

  void onCategoryItemClicked(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSelectedItem) {
    selectedItem = newSelectedItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
