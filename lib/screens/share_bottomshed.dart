import 'dart:ui';

import 'package:flutter/material.dart';

class SherBottomShet extends StatelessWidget {
  final ScrollController? controller;
  SherBottomShet({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(46)),
      child: Container(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              child: _getContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  height: 5,
                  width: 67,
                  margin: EdgeInsets.only(top: 10, bottom: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'GB', color: Colors.white),
                    ),
                    Image.asset('images/icon_share_bottomsheet.png')
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 46,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Image.asset('images/icon_search_navigation.png',
                          color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'GB',
                                  color: Colors.white),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ]),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
              ]),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(((context, index) {
                return _getItemGrid();
              }), childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 90,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 90))
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              child: Text(
                'Send',
                style: TextStyle(fontFamily: 'GB', fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: Image.asset('images/profile.jpg'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Datiego',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'GB',
          ),
        ),
      ],
    );
  }
}


// return GridView.builder(
//       controller: controller,
//         itemCount: 100,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 20 ,mainAxisSpacing: 20),
//         itemBuilder: (BuildContext context, index) {
//           return Container(
//             color: Colors.red,
//           );
//         });
