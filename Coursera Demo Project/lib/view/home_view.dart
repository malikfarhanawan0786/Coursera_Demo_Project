
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globe_pulse/api_services/get_api.dart';
import 'package:globe_pulse/models/api_models/top_headlines_model.dart';
import 'package:globe_pulse/utils/UiHelper/news_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants/app_colors.dart';
import '../utils/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GetApiResponse getApiResponse = GetApiResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light?
      AppColors.backgroundColorLT : AppColors.backgroundColorDT,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 16.0),
                child: Text("Globe Pulse", style: TextStyle(
                  fontSize: 24,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                child: Text("Top Stories", style: TextStyle(
                  fontSize: 28,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
              ),
              FutureBuilder<TopHeadlinesModel>(future: getApiResponse.fetchTopHeadlines(),
                  builder: (context, AsyncSnapshot<TopHeadlinesModel> snapshot){
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
                            physics: NeverScrollableScrollPhysics(),
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
            ],
          ),
        )
      ),
    );
  }
}
