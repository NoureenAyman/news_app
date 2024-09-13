import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/tabs/tab_item.dart';
import 'package:news_app/Model/SourceResponse.dart';

class TabWidget extends StatefulWidget {

  List<Source> sourceList;
  TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            tabs: widget.sourceList
                .map(
                  (source) => TabItem(
                isselected: selectedIndex == widget.sourceList.indexOf(source),
                source: source,
              ),
            )
                .toList(),
          ),
          Expanded(
            child: NewsWidget(source: widget.sourceList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
