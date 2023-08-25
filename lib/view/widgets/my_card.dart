
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:link_task/model/article_model.dart';
import 'package:link_task/view/screens/details_screen.dart';
class MyCard extends StatefulWidget {
  Article article;
  MyCard({required this.article});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {


  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(article: widget.article,)));
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.05,vertical: height*.015),
        child: Container(
          width: width*.6,
          height: height*.45,
          decoration: BoxDecoration(
            color: Colors.white,
              border:Border.all(color: Colors.white, style: BorderStyle.solid, width: 0.4)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Container(
                   width: width,
                   height: height*.28,
                   padding: EdgeInsets.zero,
                   child:

                   CachedNetworkImage(
                     placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
                     imageUrl: widget.article.urlToImage,
                     fit: BoxFit.cover,
                     errorWidget:(context,url ,e)=> Row(
                       mainAxisAlignment:   MainAxisAlignment.center,
                       children: [
                         Icon(Icons.close,color: Colors.red,),
                         Text('Unable to show ${widget.article.urlToImage}'),
                       ],
                     ),
                   ),

               )
              ,
             Spacer(),
              Padding(
                padding:  EdgeInsets.only(left: width*.03,right: width*.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.article.title
                      ,style: TextStyle(fontSize: width*.047),),
                    widget.article.author==''?   SizedBox()
                        : Text('By ${widget.article.author}',style: TextStyle(fontSize: width*.038,color: Colors.grey,overflow:   TextOverflow.ellipsis),),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.article.publishedAt,style: TextStyle(fontSize: width*.034,color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );;
  }
}
