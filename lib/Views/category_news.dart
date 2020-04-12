import 'package:flutter/material.dart';
import 'package:vibe/Helper/news.dart';
import 'package:vibe/Views/Article_view.dart';
import 'package:vibe/models/article_model.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading =true;
  @override
  void initState(){

    super.initState();
    getCategoryNews();

  }
   getCategoryNews()async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
              opacity:0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save,))
          )],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body:
      _loading ? Center(
        child: Container(
        child:CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
     child: Container(
       padding: EdgeInsets.symmetric(horizontal:16),
        child:Column(
          children: <Widget>[Container(
  padding: EdgeInsets.only(top:16),
  child:ListView.builder(
    itemCount: articles.length,
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemBuilder: (content, index){
        return BlogTile(
          imageUrl:articles[index].urlToImage ,
          desc: articles[index].description,
          title: articles[index].title,
          url: articles[index].url,
          );
            }),
)],) ,),
      
      ), );
  }
}
class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl,@required this.title, @required this.desc, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder:(context)=>ArticleView(
            blogUrl: url
          ) ));
      },
          child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column
        (children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl)),
          SizedBox(height:8 ,),
          Text(title, style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height:8 ,),
          Text(desc, style: TextStyle(
            color:Colors.black54 ),)
        ],),
      ),
    );
  }
}