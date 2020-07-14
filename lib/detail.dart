import 'package:flutter/material.dart';
import 'package:perfume_online_shop/data.dart';

import 'constants.dart';

class Detail extends StatefulWidget {

  final Perfume perfume;

  Detail({@required this.perfume});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.perfume.images.length; i++) {
      list.add(i == _currentImage ? buildIndicator(true) : buildIndicator(false));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      height: 8.0,
      width: isActive ? 20.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 32,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.perfume.favorite = !widget.perfume.favorite;
                });
              },
              child: Icon(
                widget.perfume.favorite ? Icons.favorite : Icons.favorite_border,
                size: 32,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: kGradient,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[

              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int page){
                    setState(() {
                      _currentImage = page;
                    });
                  },
                  children: widget.perfume.images.map((path) {
                    return Container(
                      child: Hero(
                        tag: widget.perfume.name,
                        child: Image.asset(
                          path,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              widget.perfume.images.length > 1
              ? Container(
                height: size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator(),
                ),
              )
              : Container(
                height: size.height * 0.05,
              ),

              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                child: Column(
                  children: <Widget>[

                    Container(
                      height: size.height * 0.3,
                      padding: EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text(
                            widget.perfume.name,
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          Text(
                            widget.perfume.brand,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),

                          Text(
                            widget.perfume.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                            ),
                          ),

                          Expanded(
                            child: Container(),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[

                              Text(
                                "€ " + widget.perfume.price.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 28,
                                  color: kGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[

                                  Text(
                                    "48 reviews",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[400],
                                    ),
                                  ),

                                  Row(
                                    children: <Widget>[

                                      Icon(
                                        Icons.star,
                                        size: 28,
                                        color: kStarsColor,
                                      ),

                                      Icon(
                                        Icons.star,
                                        size: 28,
                                        color: kStarsColor,
                                      ),

                                      Icon(
                                        Icons.star,
                                        size: 28,
                                        color: kStarsColor,
                                      ),

                                      Icon(
                                        Icons.star,
                                        size: 28,
                                        color: kStarsColor,
                                      ),

                                      Icon(
                                        Icons.star_half,
                                        size: 28,
                                        color: kStarsColor,
                                      ),

                                    ],
                                  )

                                ],
                              ),

                            ],
                          ),


                        ],
                      ),
                    ),

                    Container(
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text(
                            "Add to cart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(
                            width: 16,
                          ),

                          Icon(
                            Icons.shopping_basket,
                            color: Colors.white,
                            size: 30,
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}