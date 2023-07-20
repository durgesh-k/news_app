import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/widgets/error.dart';
import '../providers/news_providers.dart';
import '../screens/news_view.dart';
import '../widgets/loader.dart';
import '../widgets/news_card.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({super.key});

  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews>
    with AutomaticKeepAliveClientMixin<BusinessNews> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessNewsProvider>(
        builder: (context, newsProvider, child) {
      return Container(
        child: newsProvider.loading
            ? const Center(child: Loader())
            : newsProvider.error
                ? const Center(child: Error())
                : AppinioSwiper(
                    backgroundCardsCount: 2,
                    cardsCount: newsProvider.newsArticles!.length,
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
