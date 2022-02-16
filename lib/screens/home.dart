
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data.dart';
import 'package:online_course/widgets/category_box.dart';
import 'package:online_course/widgets/feature_item.dart';
import 'package:online_course/widgets/notification_box.dart';
import 'package:online_course/widgets/recommend_item.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      )
    );
  }

  Widget getAppBar(){
    return
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile["name"]!, style: TextStyle(color: labelColor, fontSize: 14,),),
                  SizedBox(height: 5,),
                  Text("Good Morning!", style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 18,)),
                ],
              )
            ),
            NotificationBox(
              notifiedNumber: 1,
              onTap: () {
                
              },
            )
          ],
        ),
      );
  }

  buildBody(){
    return
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                getCategories(),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Text("Featured", style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                ),
                getFeature(),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recommended", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textColor),),
                      Text("See all", style: TextStyle(fontSize: 14, color: darker),),
                    ],
                  ),
                ),
                getRecommend(),
              ]
          ),
        ),
      );
  }

  int selectedCollection = 0;
  getCategories(){
    return 
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CategoryBox(
                selectedColor: Colors.white,
                data: categories[index],
                onTap: (){
                  setState(() {
                    selectedCollection =  index;
                  });
                },
              )
            ) 
          )
        ),
      );
  }

  getFeature(){
    return 
      CarouselSlider(
        options: CarouselOptions(
          height: 290,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: List.generate(features.length, 
          (index) => FeatureItem(
            onTap: (){
              
            },
            data: features[index]
          )
        )
      );
  }

  getRecommend(){
    return
    SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(recommends.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RecommendItem(
                data: recommends[index],
                onTap: (){
                  
                },
              )
            ) 
          )
        ),
      );
  }

}