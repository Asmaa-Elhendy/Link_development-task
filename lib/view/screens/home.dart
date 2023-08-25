import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:link_task/controller/api_controller.dart';
import 'package:link_task/model/article_model.dart';
import 'package:link_task/view/widgets/my_card.dart';
import 'package:link_task/view/widgets/my_loading_cards.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('LINK DEVELOPMENT',style: TextStyle(color: Colors.white,fontSize: width*.045),),
        backgroundColor: Colors.black,
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },);
            }),
        actions: [
          Image.asset("assets/images/search.png",width: width*.055,),
          SizedBox(width: width*.02,)
        ],
      ),drawer: DrawerScreen(),
      body: Container(
        color: Colors.grey.shade300,
        child: Consumer(
          builder: (context,ref,child){

            return ref.watch(articlesData).when(
                    data:(List<Article>value)=> ListView.builder(

                      itemCount: value.length,
                      itemBuilder: (context,index)=>MyCard(article: value[index],),
                    ),
                error:(e,s) {
                return  Center(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mood_bad_sharp,color: Colors.red,size: width*.1,),
                      Text('Sorry : ${ApiController.message} !', style: TextStyle(fontSize: width * .05),),
                    ],
                  ),
                ),);
                },
                loading: ()=> LoadingState()
            );
          },
        ),
      ),
    );
  }
}

