import 'package:flutter/material.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _getHeder()),
              SliverToBoxAdapter(child: _getImage()),
              _getSliverGride(),
              SliverPadding(padding: EdgeInsets.only(bottom: 55))
            ],
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
             color: Color(0xff272B40), 
             borderRadius: BorderRadius.vertical(top: Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 17,right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Draft',
                    style: TextStyle(
                      color: Color(0xffF35383),
                      fontSize: 16,
                      fontFamily: "GB",
                    ),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "GB",
                    ),
                  ),
                  Text(
                    'Draft',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "GB",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _getSliverGride() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'images/item$index.png',
                fit: BoxFit.cover,
              ));
        }), childCount: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          //  mainAxisExtent: 200,
        ),
      ),
    );
  }

  Widget _getImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 375,
          width: double.infinity,
          child: Image.asset(
            'images/item8.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getHeder() {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 27),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'GB',
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'GB',
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
