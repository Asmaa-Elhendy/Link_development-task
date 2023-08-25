import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/article_model.dart';

class DetailsScreen extends StatelessWidget {
  Article article;
  DetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('LINK DEVELOPMENT',style: TextStyle(color: Colors.white,fontSize: width*.045),),
          backgroundColor: Colors.black,
           leading: IconButton(
             icon: Icon(Icons.arrow_back,color: Colors.white,),
             onPressed: (){
               Navigator.pop(context);
             },
           ),
          actions: [
            Image.asset("assets/images/search.png",width: width*.055,),
            SizedBox(width: width*.02,)
          ],
        ),
      body: Container(
       color: Colors.grey.shade300,
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Container(
            width: width*.9,

            margin: EdgeInsets.symmetric(horizontal: width*.05,vertical: height*.03),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height*.28,
                  padding: EdgeInsets.zero,
                  child:

                  CachedNetworkImage(
                    placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                    imageUrl: article.urlToImage,
                    fit: BoxFit.cover,
                    errorWidget:(context,url ,e)=> Row(
                      mainAxisAlignment:   MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close,color: Colors.red,),
                        Text('Unable to show ${article.urlToImage}'),
                      ],
                    ),
                  ),

                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*.04,vertical: height*.02),
                  child: Column(
                    children: [
                      Text(article.title,style: TextStyle(fontSize: width*.05),),
                      article.description==''?SizedBox():
                      Text('By ${article.description}',style: TextStyle(fontSize: width*.04,color: Colors.grey),),
                      SizedBox(height: height*.03,),
                      Text(article.description,style: TextStyle(fontSize: width*.04,color: Colors.grey),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
