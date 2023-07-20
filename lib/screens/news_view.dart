import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/utils/functions.dart';

import '../utils/constants.dart';

class NewsView extends StatefulWidget {
  final NewsArticle newsArticle;
  final int index;
  const NewsView({super.key, required this.newsArticle, required this.index});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColors[widget.index % 4],
      body: Hero(
        tag: widget.index,
        child: Material(
          color: cardColors[widget.index % 4],
          child: Scrollbar(
            interactive: true,
            radius: const Radius.circular(20),
            thickness: 10,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.newsArticle.title,
                      /*maxLines: 4,
                      overflow: TextOverflow.ellipsis,*/
                      style: const TextStyle(
                          fontFamily: 'Bold',
                          fontSize: 40,
                          color: Colors.black),
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
                    widget.newsArticle.description.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: Text(
                              "! No Description available",
                              style: TextStyle(
                                  fontFamily: 'SemiBold',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: Text(
                              widget.newsArticle.description,
                              //overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'SemiBold',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Container(
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
                          SizedBox(
                            width: getWidth(context) * 0.03,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.newsArticle.author,
                                  style: TextStyle(
                                      fontFamily: 'SemiBold',
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Text(
                                  widget.newsArticle.sourceName,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "More read",
                      style: TextStyle(
                          fontFamily: 'SemiBold',
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.4)),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                widget.newsArticle.content,
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'SemiBold',
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.8)),
                              ),
                            ),
                          ),
                    widget.newsArticle.urlToImage.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: SizedBox(
                              height: getHeight(context) * 0.3,
                              width: getWidth(context),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  color: Colors.grey.shade50.withOpacity(0.4),
                                  child: Image.network(
                                      widget.newsArticle.urlToImage,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                        strokeWidth: 2,
                                        backgroundColor:
                                            Colors.black.withOpacity(0.1),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    );
                                  }),
                                ),
                              ),
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
            ),
          ),
        ),
      ),
    );
  }
}
