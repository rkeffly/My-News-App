import 'dart:convert';
import 'package:vibe/models/article_model.dart';
import 'package:http/http.dart'  as http;

class News{

  List<ArticleModel> news =[];

 Future<void>getNews()async{
    String url ="https://newsapi.org/v2/top-headlines?country=us&apiKey=03117555962f4ba3aa1e1316e715aa7a";

  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);

 if(jsonData['status']== "ok"){
   jsonData['articles'].forEach((element){
   
  if(element['urlToImage'] != null && element['description'] != null){
    ArticleModel articleModel =ArticleModel(
       title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element['url'],
    );
    news.add(articleModel);
  }
   });
 }
 }
}
class CategoryNewsClass{
  List<ArticleModel> news =[];

  Future<void>getNews(String category)async{
    String url ="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=03117555962f4ba3aa1e1316e715aa7a";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== "ok"){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel =ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element['url'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
