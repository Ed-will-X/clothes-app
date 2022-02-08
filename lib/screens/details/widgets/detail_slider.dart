import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_app/screens/details/widgets/sub_widgets/color_picker.dart';
import 'package:flutter/material.dart';

class DetailSlider extends StatefulWidget {
  var clothes;
  DetailSlider(clothes) {
    this.clothes = clothes;
  }
  @override
  _DetailSliderState createState() => _DetailSliderState();
}

class _DetailSliderState extends State<DetailSlider> {
  List colors = [
    Color(0xFFE6CFC6),
    Color(0xFFEEDFB5),
    Color(0xFFCAE2C5),
    Color(0xFFBAE6EE),
  ];
  CarouselController _controller = CarouselController();
  int _currentPage = 0;
  int _currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ////////////////////////////////    C.A.R.O.U.S.E.L   S.L.I.D.E.R
          Container(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: 500,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: widget.clothes.detailUrl
                  .map<Widget>(
                    (e) => Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          //////////////////////////////  N.A.V.I.G.A.T.O.R.   D.O.T.S
          Positioned(
            bottom: 30,
            left: 180,
            child: Row(
              children:
                  widget.clothes.detailUrl.asMap().entries.map<Widget>((entry) {
                return GestureDetector(
                  onTap: () {
                    _controller.animateToPage(entry.key);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(
                        _currentPage == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ///////////////////////////////  C.O.L.O.R  S.L.I.D.E.R
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 175,
              width: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentColor = index;
                    });
                  },
                  child: ColorPicker(_currentColor == index, colors[index]),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 3),
                itemCount: colors.length,
              ),
            ),
          ),
          //////////////////////////////////////   B.A.C.K   A.N.D   O.P.T.I.O.N.S    B.U.T.T.O.N.S
          Container(
            padding: EdgeInsets.only(top: 50, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /////////////////  B.A.C.K
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                /////////////////////// O.P.T.I.O.N.S
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
