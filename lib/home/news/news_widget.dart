import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/app_colors.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/Model/SourceResponse.dart';



class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewBySourceId(widget.source.id??""),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          }else if (snapshot.hasError){
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewBySourceId(widget.source.id??"");
                  setState(() {

                  });
                }, child: const Text('Try Again'))
              ],
            );
          }
          if(snapshot.data!.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewBySourceId(widget.source.id??"");
                  setState(() {

                  });
                }, child: const Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index],);
          },
          itemCount: newsList.length,
          );
        }
        );
  }
}
