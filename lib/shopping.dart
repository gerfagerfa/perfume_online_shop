import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:perfume_online_shop/detail.dart';
import 'package:perfume_online_shop/data.dart';

import 'constants.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {

  final PageController _pageController = PageController(initialPage: 0);

  List<Perfume> perfumes = getPerfumeList();
  List<Filter> filters = getFilterList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 24),
          child: Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Feather.shopping_bag,
              size: 32,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 24, top: 16, bottom: 16,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Text(
                "Perfumes",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 32,
              ),

              Container(
                height: 60,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildFilters(),
                ),
              ),

              SizedBox(
                height: 32,
              ),

              Container(
                height: 350,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildItems(),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 24,),
                child: Column(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Best deals",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          children: <Widget>[

                            Text(
                              "ALL",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[400],
                              ),
                            ),

                            SizedBox(
                              width: 12,
                            ),

                            Icon(
                              Feather.arrow_right_circle,
                              color: Colors.grey[400],
                              size: 24,
                            ),

                          ],
                        ),

                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Container(
                height: 130,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  children: buildDeals(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildFilters(){
    List<Widget> list = [];
    list.add(buildFilterIcon());
    for (var filter in filters) {
      list.add(buildFilterOption(filter));
    }
    return list;
  }

  Widget buildFilterIcon(){
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: kGreen,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Icon(
          Octicons.settings,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  Widget buildFilterOption(Filter filter){
    return GestureDetector(
      onTap: () {
        setState(() {
          filter.selected = !filter.selected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: filter.selected ? kGreen : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            width: 1,
            color: filter.selected ? kGreen : Colors.grey[300],
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 32,),
        margin: EdgeInsets.only(right: 12),
        child: Center(
          child: Text(
            filter.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: filter.selected ? Colors.white : kGreen,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildItems(){
    List<Widget> list = [];
    for (var perfume in perfumes) {
      list.add(buildItem(perfume));
    }
    return list;
  }

  Widget buildItem(Perfume perfume){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(perfume: perfume)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container(
            width: 200,
            height: 270,
            decoration: BoxDecoration(
              gradient: kGradient,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            margin: EdgeInsets.only(right: 24),
            child: Stack(
              children: <Widget>[

                GestureDetector(
                  onTap: () {
                    setState(() {
                      perfume.favorite = !perfume.favorite;
                    });
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Icon(
                          perfume.favorite ? Icons.favorite : Icons.favorite_border,
                          size: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16,),
                  child: Center(
                    child: Hero(
                      tag: perfume.name,
                      child: Image.asset(
                        perfume.images[0],
                        fit: BoxFit.fitHeight,
                        height: 160,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Text(
            perfume.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Text(
            "€ " + perfume.price.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 16,
              color: kGreen,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> buildDeals(){
    List<Widget> list = [];
    for (var perfume in perfumes) {
      if(perfume.discount > 0){
        list.add(buildDeal(perfume));
      }
    }
    return list;
  }

  Widget buildDeal(Perfume perfume){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey[300],
        )
      ),
      margin: EdgeInsets.only(right: 24,),
      child: Stack(
        children: <Widget>[

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xFFFFB77D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Text(
                  "-" + perfume.discount.toStringAsFixed(0) + "%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[

                Container(
                  width: 110,
                  decoration: BoxDecoration(
                    gradient: kGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      perfume.images[0],
                      fit: BoxFit.fitHeight,
                      height: 90,
                    ),
                  ),
                ),

                SizedBox(
                  width: 16,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      perfume.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      perfume.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),

                    Text(
                      "€ " + perfume.price.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 16,
                        color: kGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}