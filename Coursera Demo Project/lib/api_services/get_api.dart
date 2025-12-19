
import 'dart:convert';

import 'package:globe_pulse/api_services/api_urls.dart';
import 'package:globe_pulse/models/api_models/business_headlines.dart';
import 'package:globe_pulse/models/api_models/entertainment_headlines.dart';
import 'package:globe_pulse/models/api_models/general_headlines.dart';
import 'package:globe_pulse/models/api_models/health_headlines.dart';
import 'package:globe_pulse/models/api_models/science_headlines.dart';
import 'package:globe_pulse/models/api_models/sports_headlines.dart';
import 'package:globe_pulse/models/api_models/technology_headlines.dart';
import 'package:globe_pulse/models/api_models/top_headlines_model.dart';
import 'package:http/http.dart' as http;

class GetApiResponse{

  Future<TopHeadlinesModel> fetchTopHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.topHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return TopHeadlinesModel.fromJson(data);
      }else{
        throw Exception("Error occured while loading data");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<BusinessHeadlines> fetchBusinessHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.businessHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return BusinessHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<EntertainmentHeadlines> fetchEntertainmentHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.entertainmentHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return EntertainmentHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error Occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<GeneralHeadlines> fetchGeneralHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.generalHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return GeneralHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error Occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<HealthHeadlines> fetchHealthHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.healthHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return HealthHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error Occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<ScienceHeadlines> fetchScienceHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.scienceHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return ScienceHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error Occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<SportsHeadlines> fetchSportsHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.sportsHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return SportsHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error Occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<TechnologyHeadlines> fetchTechnologyHeadlines() async{
    final response = await http.get(Uri.parse(ApiUrls.technologyHeadlines));
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return TechnologyHeadlines.fromJson(data);
      }
      else{
        throw Exception("Error Occured while loading data");
      }
    } catch(e){
      throw Exception(e.toString());
    }
  }

}