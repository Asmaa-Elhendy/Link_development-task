import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:link_task/model/article_model.dart';

final articlesData = FutureProvider.autoDispose<List<Article>>(
        (ref) => ApiController.fetchTotalData());


class ApiController{


 static String apiKey='858d88a055754959b618c65cd7591e93';
 static String firstApiUrl='https://newsapi.org/v1/articles?source=the-next-web&apiKey=$apiKey';
 static String secondApiUrl='https://newsapi.org/v1/articles?source=associated-press&apiKey=$apiKey';
 static bool error=false;
 static String message=' Failed to load';

 static Future<List<Article>>  fetchTotalData() async {
   var responses;
    try{
       responses = await Future.wait([
        http.get(Uri.parse(firstApiUrl)),
        http.get(Uri.parse(secondApiUrl)),
      ]);
    }on SocketException{
      error=true;
      message='No Internet Connection';
    }
     return <Article>[
       ...getDataFromApi(responses[0]),
       ...getDataFromApi(responses[1]),
     ];

 }

 static getDataFromApi(http.Response response) {
   try{


     var decodedData = json.decode(response.body);
     if (response.statusCode!=200||decodedData['status']=='error'){
        error=true;
        message=decodedData['message'];


     }else{
       List data = decodedData['articles'];
       List<Article> articles = data.map((e) => Article.fromJson(e)).toList();
       error=false;

       return articles;
     }


   }
   catch(e){
     error=true;
     message=' Failed to load ';
     print('e $e');
   }
 }

}