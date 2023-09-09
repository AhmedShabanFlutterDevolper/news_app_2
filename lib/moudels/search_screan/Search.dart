import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../style/color.dart';
import 'components/components.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Dio _dio = Dio();
  final TextEditingController _searchController = TextEditingController();
  List<NewsArticle> _searchResults = [];

  Future<void> _searchNews(String query) async {
    final apiKey = '70af24fef35247f2ae0fa2278a6d6048';
    final apiUrl =
        'https://newsapi.org/v2/everything?q=$query&from=2023-08-09&sortBy=publishedAt&apiKey=$apiKey';

    try {
      final response = await _dio.get(apiUrl);
      final data = response.data;

      setState(() {
        _searchResults.clear();
        _searchResults = (data['articles'] as List)
            .map((articleData) => NewsArticle.fromJson(articleData))
            .toList();
      });
    } catch (error) {
      print('Failed to load news: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.amber),
          ),
          backgroundColor: appBarBackGround,
          toolbarHeight: 100,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ))),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              cursorColor: Colors.amber,
              keyboardType: TextInputType.text,
              controller: _searchController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Search must is not be empty';
                }
                return null;
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                  enabledBorder: myinputborder(), //enabled border
                  focusedBorder: myfocusborder(), //focused border
                  prefixIcon: IconButton(
                    onPressed: () {
                      final query = _searchController.text.trim();
                      if (query.isNotEmpty) {
                        _searchNews(query);
                      }
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                  ),
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final article = _searchResults[index];
                return NewsCard(
                  article: article,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewsArticle {
  final String title;
  final String description;
  final String imageUrl; // Keep imageUrl as a non-nullable String

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl, // Ensure imageUrl is provided during object creation
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    final imageUrl =
        json['urlToImage'] as String? ?? ''; // Use '' if 'urlToImage' is null
    return NewsArticle(
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: imageUrl,
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (article.imageUrl.isNotEmpty)
            Image.network(
              article.imageUrl,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  article.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
