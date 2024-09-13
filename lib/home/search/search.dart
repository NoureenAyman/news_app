import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_item.dart';

class NewsSearchDelegate extends SearchDelegate<String> {
  // Mock function to simulate fetching news articles based on the search query
  Future<List<NewsArticle>> searchNews(String query) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));

    // Mocked list of articles
    List<NewsArticle> articles = [
      NewsArticle(title: "Flutter 3.0 Released", description: "New features in Flutter 3.0..."),
      NewsArticle(title: "Dart Null Safety", description: "How to handle null safety in Dart..."),
      NewsArticle(title: "Async Programming in Flutter", description: "Understanding async and await in Flutter..."),
    ];

    // Filter articles based on the search query
    return articles.where((article) => article.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the AppBar (e.g., clear the search query)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search input
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Leading icon on the left of the AppBar (e.g., back button)
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results based on the search query
    return FutureBuilder(
      future: searchNews(query), // Implement the search logic here
      builder: (context, AsyncSnapshot<List<NewsArticle>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error occurred'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No news found'));
        }

        // Display the search results
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final article = snapshot.data![index];
            return ListTile(
              title: Text(article.title),
              subtitle: Text(article.description),
              onTap: () {
                // Navigate to the details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsItem(article: article),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as the user types
    return Center(
      child: Text('Type to search for news'),
    );
  }
}

// Define the NewsArticle class
class NewsArticle {
  final String title;
  final String description;

  NewsArticle({required this.title, required this.description});
}

// Assuming NewsItem widget looks like this:
class NewsItem extends StatelessWidget {
  final NewsArticle article;

  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(article.description),
          ],
        ),
      ),
    );
  }
}
