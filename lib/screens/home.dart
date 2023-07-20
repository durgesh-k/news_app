import 'package:flutter/material.dart';
import 'package:news_app/news_categories/business.dart';
import 'package:news_app/news_categories/health.dart';
import 'package:news_app/news_categories/sports.dart';
import 'package:news_app/news_categories/trending.dart';
import 'package:news_app/screens/search.dart';
import 'package:news_app/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'News App',
          style:
              TextStyle(fontFamily: 'Black', color: Colors.white, fontSize: 30),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchNews()));
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
          SizedBox(
            width: 18,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelStyle: const TextStyle(
                  fontFamily: 'Medium', fontSize: 30, color: Colors.white),
              unselectedLabelStyle:
                  const TextStyle(fontFamily: 'Medium', fontSize: 20),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.6),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 0.0, color: primary!),
                  insets: const EdgeInsets.symmetric(horizontal: 16.0)),
              indicatorColor: primary,
              isScrollable: true,
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Health',
                ),
                Tab(
                  text: 'Sports',
                ),
                Tab(
                  text: 'Business',
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TrendingNews(),
          HealthNews(),
          SportsNews(),
          BusinessNews()
        ],
      ),
    );
  }
}
