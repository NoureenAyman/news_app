import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/Model/SourceResponse.dart';
import 'package:news_app/model/news_article.dart';

class ApiManager{
  static Future<SourceResponse?> getSources(String categoryId)async{
    Uri url=Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
    {'apiKey':ApiConstants.apiKey,
    'category': categoryId});
    try{
      var response = await http.get(url);
      var responseBody =response.body;  ///string
      var json = jsonDecode(responseBody);  ///json
      return SourceResponse.fromJson(json);   ///object
    }
    catch(e){
      throw e;
    }


  }
/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=c7f5525bae944725837a1fdf83120a97
  */

 static Future<NewsResponse?> getNewBySourceId(String sourceId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey':ApiConstants.apiKey,
      'sources':sourceId,
    });
      var response =await http.get(url);
      try{
        return NewsResponse.fromJson(jsonDecode(response.body));

      }catch(e){
        throw e;
      }


 }

  Future<List<NewsArticle>> searchNews(String query) async {
    // Assuming you're using an API like newsapi.org
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/everything?q=$query&apiKey=your_api_key'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List articles = data['articles'];

      // Map the articles to your NewsArticle model
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      // Handle errors
      throw Exception('Failed to load news');
    }
  }


}