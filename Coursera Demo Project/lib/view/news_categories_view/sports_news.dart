
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globe_pulse/api_services/get_api.dart';
import 'package:globe_pulse/models/api_models/sports_headlines.dart';
import 'package:globe_pulse/models/api_models/technology_headlines.dart';
import 'package:globe_pulse/utils/UiHelper/news_card.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/routes/routes_name.dart';
class SportsNews extends StatelessWidget {
  const SportsNews({super.key});

  @override
  Widget build(BuildContext context) {
    GetApiResponse getApiResponse = GetApiResponse();
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light?
      AppColors.backgroundColorLT : AppColors.backgroundColorDT,
      body: FutureBuilder<SportsHeadlines>(
          future: getApiResponse.fetchSportsHeadlines(),
          builder: (context, AsyncSnapshot<SportsHeadlines> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: SpinKitCircle(
                  color: Theme.of(context).brightness == Brightness.light?
                  AppColors.primaryColorLT : AppColors.primaryColorDT,
                ),
              );
            } else{
              final articleData = snapshot.data!.articles;
              return ListView.builder(
                  itemCount: articleData!.length,
                  itemBuilder: (context, index){
                    final articleIndex = articleData[index];
                    return InkWell(
                      child: NewsCard.newsCard(context,
                          newsName: articleIndex.source!.name!.toString(),
                          newsTitle: articleIndex.title.toString(),
                          image: articleIndex.urlToImage.toString()
                      ),
                      onTap: (){
                        Navigator.pushNamed(
                            context,
                            RoutesName.detailedNewsView,
                            arguments: {
                              'title' : articleIndex.title.toString(),
                              'description' : articleIndex.description.toString(),
                              'image' : articleIndex.urlToImage.toString(),
                              'author' : articleIndex.author.toString(),
                              'publishedAt' : articleIndex.publishedAt.toString(),
                              'content' : articleIndex.content.toString(),
                              'source' : articleIndex.source!.name.toString(),
                            }
                        );
                      },
                    );
                  }
              );
            }
          }
      ),
    );
  }
}
