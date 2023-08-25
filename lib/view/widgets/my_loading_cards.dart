import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class LoadingState extends StatefulWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Container(
        color: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context,i)=>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor:Colors.grey.shade400,
                highlightColor: Colors.grey.shade100,
                child: Container(
                    width: width,
                    height: height*.4,
                    padding: EdgeInsets.zero,color: Colors.grey.shade300,
                    child: Container()
                ),),
            ),
      ),
    );
  }
}
