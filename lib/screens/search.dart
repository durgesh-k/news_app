import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/screens/news_view.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/error.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:provider/provider.dart';

import '../providers/news_providers.dart';
import '../widgets/loader.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  final _textFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchNewsProvider>(
        builder: (context, newsProvider, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          title: const Text(
            'Search',
            style: TextStyle(
                fontFamily: 'SemiBold', color: Colors.white, fontSize: 30),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        focusNode: _textFocusNode,
                        controller: search,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Medium',
                            color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          hintText: 'Search News',
                          hintStyle: TextStyle(
                              fontFamily: 'Medium',
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.2)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        newsProvider.fetchNews(search!.text);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
            child: newsProvider.loading
                ? const Center(child: Loader())
                : newsProvider.error
                    ? const Center(child: Error())
                    : Scrollbar(
                        interactive: true,
                        radius: const Radius.circular(20),
                        thickness: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "${newsProvider.newsArticles!.length.toString()} Results",
                                  style: TextStyle(
                                      fontFamily: 'SemiBold',
                                      color: Colors.white.withOpacity(0.2),
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount:
                                        newsProvider.newsArticles!.length,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          _textFocusNode.unfocus();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => NewsView(
                                                    newsArticle: newsProvider
                                                        .newsArticles![index],
                                                    index: index)),
                                          );
                                        },
                                        child: Hero(
                                          tag: index,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: NewsCard(
                                                newsArticle: newsProvider
                                                    .newsArticles![index],
                                                index: index),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )),
      );
    });
  }
}
