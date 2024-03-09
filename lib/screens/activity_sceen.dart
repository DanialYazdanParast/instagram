import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff1C1F2E),
              height: 68,
              child: TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(fontSize: 20, fontFamily: 'GB'),
                  indicatorWeight: 3,
                  indicatorColor: Color(0xffF35383),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: 'Following'),
                    Tab(text: 'You'),
                  ]),
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              _getSampelList(),
              _getSampelList(),
            ]))
          ],
        ),
      ),
    );
  }

  Widget _getSampelList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _getRow(ActivityStatus.like);
        }, childCount: 2)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Todey',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _getRow(ActivityStatus.folloback);
        }, childCount: 3)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This week',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _getRow(ActivityStatus.following);
        }, childCount: 3))
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration:
                BoxDecoration(color: Color(0xffF35383), shape: BoxShape.circle),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/profile.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Datiego',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GB',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started following',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GM',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'you',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GM',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GB',
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.folloback:
        return ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(fontFamily: 'GB', fontSize: 16),
          ),
        );
      case ActivityStatus.like:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'images/item0.png',
              fit: BoxFit.cover,
            ),
          ),
        );

      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
                fontFamily: 'GB', fontSize: 12, color: Color(0xffC5C5C5)),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
        );

      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
                fontFamily: 'GB', fontSize: 12, color: Color(0xffC5C5C5)),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
        );
    }
  }
}
