import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/functions.dart';

class NewsCard extends StatefulWidget {
  final NewsArticle newsArticle;
  final int index;
  const NewsCard({super.key, required this.newsArticle, required this.index});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: cardColors[widget.index % 4],
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.newsArticle.title,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontFamily: 'Bold', fontSize: 40, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Updated ${timeAgo(widget.newsArticle.publishedAt.toString())}",
                style: TextStyle(
                    fontFamily: 'SemiBold',
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                children: [
                  widget.newsArticle.author.isEmpty
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              getFirstTwoInitials(widget.newsArticle.author),
                              style: const TextStyle(
                                  fontFamily: 'SemiBold',
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                  widget.newsArticle.author.isEmpty
                      ? Container()
                      : SizedBox(
                          width: getWidth(context) * 0.03,
                        ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.newsArticle.author,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'SemiBold',
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        Text(
                          widget.newsArticle.sourceName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: 'SemiBold',
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            widget.newsArticle.description.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      "! No Content available",
                      style: TextStyle(
                          fontFamily: 'SemiBold',
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  )
                : Flexible(
                    child: Text(
                      widget.newsArticle.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 12,
                      style: TextStyle(
                          fontFamily: 'SemiBold',
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
            Row(
              children: [
                Container(
                  width: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
