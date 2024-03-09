import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchSceen extends StatelessWidget {
  const SearchSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _getSearch()),
            SliverToBoxAdapter(child: _getCategory()),
            SliverPadding(
              padding: EdgeInsets.only(left: 18,right: 18,bottom: 20),
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
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _getCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, bottom: 20),
      child: Container(
        height: 23,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 60,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xff272B40),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 4),
                      child: Text(
                        'Datiego  $index',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'GM'),
                      ),
                    )),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container _getSearch() {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 17, top: 12, bottom: 20),
      height: 46,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Image.asset('images/icon_search_navigation.png', color: Colors.white),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                      fontSize: 12, fontFamily: 'GB', color: Colors.white),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Image.asset('images/icon_scan.png'),
        ]),
      ),
      decoration: BoxDecoration(
        color: Color(0xff272B40),
        borderRadius: BorderRadius.circular(13),
      ),
    );
  }
}

// GridView.custom(
//           gridDelegate: SliverQuiltedGridDelegate(
//             crossAxisCount: 3,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//             repeatPattern: QuiltedGridRepeatPattern.inverted,
//             pattern: [
//               QuiltedGridTile(2, 1),
//               QuiltedGridTile(2, 2),
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1),
//             ],
//           ),
//           childrenDelegate: SliverChildBuilderDelegate(
//             (context, index) => ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: FittedBox(
//                   fit: BoxFit.cover,
//                   child: Image.asset('images/item$index.png')),
//             ),
//             childCount: 10,
//           ),
//         ),
