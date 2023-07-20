import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/news_providers.dart';
import 'package:news_app/screens/news_view.dart';
import 'package:news_app/widgets/error.dart';
import 'package:news_app/widgets/loader.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatefulWidget {
  const TrendingNews({super.key});

  @override
  State<TrendingNews> createState() => _TrendingNewsState();
}

class _TrendingNewsState extends State<TrendingNews>
    with AutomaticKeepAliveClientMixin<TrendingNews> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, newsProvider, child) {
      return Container(
        child: newsProvider.loading
            ? const Center(child: Loader())
            : newsProvider.error
                ? const Center(child: Error())
                : AppinioSwiper(
                    backgroundCardsCount: 2,
                    cardsCount: newsProvider.newsArticles!.length,
                    threshold: 100,
                    allowUnswipe: true,
                    cardsBuilder: ((
                      BuildContext context,
                      int index,
                    ) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsView(
                                    newsArticle:
                                        newsProvider.newsArticles![index],
                                    index: index)),
                          );
                        },
                        child: Hero(
                          tag: index,
                          child: NewsCard(
                              newsArticle: newsProvider.newsArticles![index],
                              index: index),
                        ),
                      );
                    })),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
