
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:globe_pulse/view/news_categories_view/business_news.dart';
import 'package:globe_pulse/view/news_categories_view/entertainment_news.dart';
import 'package:globe_pulse/view/news_categories_view/general_news.dart';
import 'package:globe_pulse/view/news_categories_view/health_news.dart';
import 'package:globe_pulse/view/news_categories_view/science_news.dart';
import 'package:globe_pulse/view/news_categories_view/sports_news.dart';
import 'package:globe_pulse/view/news_categories_view/technology_news.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7, child: Scaffold(
      appBar: AppBar(
        title: Text("Globe Pulse", style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          color:  Theme.of(context).brightness == Brightness.light?
          AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
        ),),
        bottom: TabBar(
          isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).brightness == Brightness.light?
            AppColors.primaryColorLT : AppColors.primaryColorDT,
            labelColor: Theme.of(context).brightness == Brightness.light?
            AppColors.primaryColorLT : AppColors.primaryColorDT,
            unselectedLabelColor: Theme.of(context).brightness == Brightness.light?
            AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
            labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold
            ),
            tabs: [
          Tab(text: "Business"),
          Tab(text: "Entertainment",),
          Tab(text: "General",),
          Tab(text: "Health",),
          Tab(text: "Science",),
          Tab(text: "Sports",),
          Tab(text: "Technology",),
        ]),
      ),
      body: TabBarView(
        children: [
          BusinessNews(),
          EntertainmentNews(),
          GeneralNews(),
          HealthNews(),
          ScienceNews(),
          SportsNews(),
          TechnologyNews(),
        ],

      ),
    ),

    );
  }
}
