import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/utils/key.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/toast.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsArticle>? _newsArticles = [];
  bool loading = true;
  bool error = false;

  List<NewsArticle>? get newsArticles => _newsArticles;

  NewsProvider() {
    fetchTrendingNews();
  }

  Future<void> fetchTrendingNews() async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        _newsArticles = List<NewsArticle>.from(
          responseJson['articles']
              .map((article) => NewsArticle.fromJson(article)),
        );
        _newsArticles!.sort();
        print(_newsArticles);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        error = true;
        notifyListeners();
        showToast("Error loading data");
      }
    } catch (e) {
      loading = false;
      error = true;
      notifyListeners();
      showToast('Error loading data $e');
    }
  }
}

class HealthNewsProvider extends ChangeNotifier {
  List<NewsArticle>? _newsArticles = [];
  bool loading = true;
  bool error = false;

  List<NewsArticle>? get newsArticles => _newsArticles;

  HealthNewsProvider() {
    fetchHealthNews();
  }

  Future<void> fetchHealthNews() async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=$apiKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        _newsArticles = List<NewsArticle>.from(
          responseJson['articles']
              .map((article) => NewsArticle.fromJson(article)),
        );
        _newsArticles!.sort();
        print(_newsArticles);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        error = true;
        notifyListeners();
        showToast("Error loading data");
      }
    } catch (e) {
      loading = false;
      error = true;
      notifyListeners();
      showToast('Error loading data $e');
    }
  }
}

class SportsNewsProvider extends ChangeNotifier {
  List<NewsArticle>? _newsArticles = [];
  bool loading = true;
  bool error = false;

  List<NewsArticle>? get newsArticles => _newsArticles;

  SportsNewsProvider() {
    fetchSportsNews();
  }

  Future<void> fetchSportsNews() async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=$apiKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        _newsArticles = List<NewsArticle>.from(
          responseJson['articles']
              .map((article) => NewsArticle.fromJson(article)),
        );
        _newsArticles!.sort();
        print(_newsArticles);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        error = true;
        notifyListeners();
        showToast("Error loading data");
      }
    } catch (e) {
      loading = false;
      error = true;
      notifyListeners();
      showToast('Error loading data $e');
    }
  }
}

class BusinessNewsProvider extends ChangeNotifier {
  List<NewsArticle>? _newsArticles = [];
  bool loading = true;
  bool error = false;

  List<NewsArticle>? get newsArticles => _newsArticles;

  BusinessNewsProvider() {
    fetchBusinessNews();
  }

  Future<void> fetchBusinessNews() async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$apiKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        _newsArticles = List<NewsArticle>.from(
          responseJson['articles']
              .map((article) => NewsArticle.fromJson(article)),
        );
        _newsArticles!.sort();
        print(_newsArticles);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        error = true;
        notifyListeners();
        showToast("Error loading data");
      }
    } catch (e) {
      loading = false;
      error = true;
      notifyListeners();
      showToast('Error loading data $e');
    }
  }
}

class SearchNewsProvider extends ChangeNotifier {
  List<NewsArticle>? _newsArticles = [];
  bool loading = true;
  bool error = false;

  String initialQuery = "trending";

  List<NewsArticle>? get newsArticles => _newsArticles;

  SearchNewsProvider() {
    fetchNews(initialQuery);
  }

  Future<void> fetchNews(String query) async {
    loading = true;
    notifyListeners();
    try {
      final url = Uri.parse(
          'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        _newsArticles = List<NewsArticle>.from(
          responseJson['articles']
              .map((article) => NewsArticle.fromJson(article)),
        );
        _newsArticles!.sort();
        print(_newsArticles);
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        error = true;
        notifyListeners();
        showToast("Error loading data");
      }
    } catch (e) {
      loading = false;
      error = true;
      notifyListeners();
      showToast('Error loading data $e');
    }
  }
}
