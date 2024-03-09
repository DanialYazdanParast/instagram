import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    //   pinned: true,
                    toolbarHeight: 80,
                    backgroundColor: Color(0xff1C1F2E),
                    expandedHeight: 170,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'images/item1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    bottom: PreferredSize(
                      child: Container(
                        height: 14,
                        decoration: BoxDecoration(
                          color: Color(0xff1C1F2E),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                      ),
                      preferredSize: Size.fromHeight(14),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Icon(Icons.menu),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: _getHederProfile(),
                  ),
                  SliverToBoxAdapter(
                    child: _getHederBio(),
                  ),
                  SliverToBoxAdapter(
                    child: _bottomFollow(),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _getStoryList(),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: TabBarViewDelegate(
                      TabBar(
                        indicatorWeight: 2,
                        indicatorColor: Color(0xffF35383),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                        tabs: [
                          Tab(
                            icon: Image.asset('images/icon_tab_posts.png'),
                          ),
                          Tab(
                            icon: Image.asset('images/icon_tab_bookmark.png'),
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                    floating: true,
                  ),
                ];
              },
              body: TabBarView(children: [
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(
                          left: 18, right: 18, top: 20, bottom: 100),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset('images/item$index.png')),
                          ),
                          childCount: 10,
                        ),
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Color(0xff1C1F2E),
                ),
              ]),
            ),
          ),
        ));
  }

  Widget _getHederProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xffF35383),
                ),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    'images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'داتیگو برنامه نویس موبایل',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SM',
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Datiego',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GB',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              'images/icon_profile_edit.png',
            )
          ],
        ),
      ),
    );
  }

  Widget _getHederBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'برنامه‌ نویسی فلاتر ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SM',
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'لیسانس مهندسی کامپیوتر - نرم افزار',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SM',
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset(
                'images/sher.png',
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'yek.link/Datiego',
                style: TextStyle(
                  color: Color(0xff55B9F7),
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset(
                'images/developer.png',
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'developer',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'images/loc.png',
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'IRAN',
                style: TextStyle(
                  color: Color(0xffC5C5C5),
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                '23',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Posts',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GM',
                    fontSize: 10,
                  )),
              SizedBox(
                width: 15,
              ),
              Text(
                '16.2K',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Followers',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GM',
                    fontSize: 10,
                  )),
              SizedBox(
                width: 15,
              ),
              Text(
                '280',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Following',
                  style: TextStyle(
                    color: Color(0xffC5C5C5),
                    fontFamily: 'GM',
                    fontSize: 10,
                  )),
              SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomFollow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Follow',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(180, 46),
              primary: Color(0xffF35383),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textStyle: TextStyle(fontFamily: 'GB', fontSize: 16),
            ),
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              'Message',
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16, color: Color(0xffC5C5C5)),
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(180, 46),
              side: BorderSide(color: Color(0xffC5C5C5), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStory() : _getStoryListBox(index);
        },
      ),
    );
  }

  Widget _getAddStory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
            'New',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

Widget _getStoryListBox(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            height: 60,
            width: 60,
            child: Image.asset(
              'images/item$index.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Flutter',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  TabBarViewDelegate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
