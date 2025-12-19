
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globe_pulse/api_services/get_api.dart';
import 'package:globe_pulse/models/api_models/business_headlines.dart';
import 'package:globe_pulse/models/api_models/health_headlines.dart';
import 'package:globe_pulse/utils/UiHelper/news_card.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';

import '../../models/api_models/top_headlines_model.dart';
import '../../utils/routes/routes_name.dart';
class HealthNews extends StatefulWidget {
  const HealthNews({super.key});

  @override
  State<HealthNews> createState() => _HealthNews();
}

class _HealthNews extends State<HealthNews> {
  GetApiResponse getApiResponse = GetApiResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light?
      AppColors.backgroundColorLT : AppColors.backgroundColorDT,
      body: FutureBuilder<HealthHeadlines>(future: getApiResponse.fetchHealthHeadlines(),
          builder: (context, AsyncSnapshot<HealthHeadlines> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: SpinKitCircle(
                    color: Theme.of(context).brightness == Brightness.light? AppColors.primaryColorLT : AppColors.primaryColorDT,
                  ),
                ),
              );
            } else{
              final article = snapshot.data!.articles!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: article.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      final articleIndex = article[index];
                      return Padding(padding: EdgeInsets.only(bottom: 16.0),
                        child: InkWell(
                          child: NewsCard.newsCard(context,
                            newsName: articleIndex.source!.name.toString(),
                            newsTitle: articleIndex.title.toString(),
                            image: articleIndex.urlToImage.toString(),
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
                        ),
                      );
                    }),
              );
            }
          }
      ),


    );
  }
}
