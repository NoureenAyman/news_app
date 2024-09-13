import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/app_colors.dart';
import 'package:news_app/Model/NewsResponse.dart';



class NewsItem extends StatelessWidget {
News news;
NewsItem({required this.news,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3 ,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
SizedBox(
  height: 12,
),
          Text(news.author??"",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.greyColor
          ),),
          SizedBox(
            height: 12,
          ),
          Text(news.title??"",
            style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(
            height: 12,
          ),
          Text(news.publishedAt??"",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.greyColor
            ) ,
          textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}
