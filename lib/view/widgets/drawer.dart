import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_drawer_tile.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
   double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return  Drawer(

      backgroundColor: Colors.grey.shade300,
      child: ListView(

          children: [
         Container(height: height*.17,
           child: Theme(
             data: Theme.of(context).copyWith(
               dividerTheme: const DividerThemeData(color: Colors.transparent),
             ),
             child: DrawerHeader(
               margin: EdgeInsets.zero,
        decoration: const BoxDecoration(
                color: Colors.transparent,

              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(width*.01),
                    child: Container(
                      width:width*.17,
                      child: CircleAvatar(
                        radius: width*.1,
                        backgroundImage: AssetImage("assets/images/profile.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: height*.02,horizontal: width*.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome',style: TextStyle(color: Colors.grey.shade700,fontSize: width*.036),),
                        Text('Tony Roshdy',style: TextStyle(fontSize: width*.052),)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: height*.04,left: width*.13),
                    child: Image.asset("assets/images/arrow.png",width: width*.05,),
                  )
                ],
              ),),
           ),
         ),
         customListTile(context,width, 'Explore', "assets/images/explore.png"),
            customListTile(context,width, 'Live Chat', "assets/images/live.png"),
            customListTile(context,width, 'Gallery', "assets/images/gallery.png"),
            customListTile(context,width, 'Wish List', "assets/images/wishlist.png"),
            customListTile(context,width, 'E magazine', "assets/images/e-magazine.png"),
          ],

      ),
    );
  }
}

