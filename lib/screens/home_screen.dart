import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottomshed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 24,
          width: 128,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _getStoryList(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                    children: [
                      _getHederPost(),
                      SizedBox(
                        height: 12,
                      ),
                      _getPost(context),
                    ],
                  ),
                );
              },
              childCount: 9,
            ),
          ),
        ],
      )),
    );
  }

  ListView _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
          child: Column(
            children: [
              _getHederPost(),
              SizedBox(
                height: 12,
              ),
              _getPost(context),
            ],
          ),
        );
      },
    );
  }

  Widget _getPost(BuildContext context) {
    return Container(
        width: 394,
        height: 450,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'images/post_cover.jpg',
                  fit: BoxFit.cover,
                  height: 410,
                ),
              ),
            ),
            Positioned(
                top: 15,
                right: 15,
                child: Image.asset('images/icon_video.png')),
            Positioned(
              bottom: 20,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: 340,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                          ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('images/icon_hart.png'),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '2.6 K',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'GB'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('images/icon_comments.png'),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '1.5 K',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'GB'),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      barrierColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: DraggableScrollableSheet(
                                              initialChildSize: 0.6,
                                              minChildSize: 0.3,
                                              maxChildSize: 0.8,
                                              builder: (context, controller) {
                                                return SherBottomShet(
                                                  controller: controller,
                                                );
                                              }),
                                        );
                                      });
                                },
                                child: Image.asset('images/icon_share.png')),
                            Image.asset('images/icon_save.png'),
                          ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _getHederPost() {
    return Row(
      children: [
        _getStoryBox(),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Datiego',
                style: TextStyle(
                    fontFamily: 'GB', color: Colors.white, fontSize: 12),
              ),
              Text(
                'داتیگو برنامه نویس موبایل',
                style: TextStyle(
                    fontFamily: 'SM', color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
        Spacer(),
        Image.asset('images/icon_menu.png'),
      ],
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStory() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color((0xffF35383)),
            strokeWidth: 2,
            dashPattern: [50, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/profile.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Datiego',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color((0xffF35383)),
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/profile.jpg'),
        ),
      ),
    );
  }

  Widget _getAddStory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(17)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60,
                height: 60,
                child: Image.asset('images/icon_plus.png'),
                decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Your Story',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}


// SingleChildScrollView(
//           child: Column(
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                         isScrollControlled: true,
//                         barrierColor: Colors.transparent,
//                         backgroundColor: Colors.transparent,
//                         context: context,
//                         builder: (BuildContext context) {
//                           return DraggableScrollableSheet(
//                             initialChildSize: 0.5,
//                             minChildSize: 0.3,
//                             maxChildSize: 0.8,
//                              builder: (context, controller) {
//                             return SherBottomShet(
//                               controller: controller,
//                             );
//                           });
//                         });
//                   },
//                   child: Text('open ')),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: SizedBox(
//                   height: 120,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 10,
//                     itemBuilder: (context, index) {
//                       return index == 0 ? _getAddStory() : _getStoryListBox();
//                     },
//                   ),
//                 ),
//               ),
//               _getPostList(),
//             ],
//           ),
//         ),