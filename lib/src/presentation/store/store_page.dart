import 'package:agroguru/src/presentation/store/widgets/product_grid.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../domain/repository/auth_repository.dart';
import '../../utils/constants/strings/routes.dart';

class StorePage extends StatefulWidget {
  StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late ScrollController controller;

  bool showAppBar = true;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   controller.addListener(() {
    //     print('scrolling');
    //   });
    //   controller.position.isScrollingNotifier.addListener(() {
    //     if (controller.position.userScrollDirection == ScrollDirection.forward) {
    //       print('scrolling down');
    //       setState(() {
    //         showAppBar = true;
    //       });
    //     } else if(controller.position.userScrollDirection == ScrollDirection.reverse){
    //       setState(() {
    //         showAppBar = false;
    //       });
    //       print('scroll is up');
    //     }
    //   });
    // });
    ScrollDirection? lastScrollDirection; // <---- Notice the new variable here.
    controller = ScrollController();
    bool isTop = true;

    controller.addListener(() {
      if (lastScrollDirection != controller.position.userScrollDirection) {
        lastScrollDirection = controller.position.userScrollDirection;

        isTop = (controller.position.atEdge)
            ? (controller.position.pixels <= 100)
            : false;

        print(controller.position);

        setState(() {
          showAppBar =
              (lastScrollDirection == ScrollDirection.reverse) || isTop;
        });

        // print('Scroll direction changed --> $_lastScrollDirection');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(390.w, 64.h),
        child: AppBar(
          // backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          title: Container(
            height: 64.h,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.profile);
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32.r),
                        child: CircleAvatar(
                          child: Image.network(
                            height: 48.w,
                            width: 48.w,
                            (AuthRepository.curUser?.displayPic) ??
                                Strings.avatar,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        AuthRepository.curUser?.name ?? '',
                        style: TextStyles.body(),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.settings);
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.only(left: 27.w, right: 27.w),
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                floating: true,
                primary: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                toolbarHeight: 96.h,
                foregroundColor: Colors.transparent,
                // pinned: true,
                flexibleSpace: Center(
                  child: Container(
                    height: 64.h,
                    width: 390.w,
                    margin: EdgeInsets.symmetric(horizontal: 27.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(64.r),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyles.body(
                        color: HexColor('#80131513'),
                      ),
                    ),
                  ),
                ),
                // title:
                forceMaterialTransparency: true,
                centerTitle: true,
                elevation: 0,
                shadowColor: Colors.white,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            child: MaterialButton(
                              onPressed: () {},
                              height: 48.h,
                              minWidth: 152.w,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              splashColor: HexColor('#1315131A'),
                              color: HexColor('#1315131A'),
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    Strings.favorites,
                                    height: 32.h,
                                    width: 32.h,
                                  ),
                                  Text(
                                    'Favorites',
                                    style: TextStyles.body(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            child: MaterialButton(
                              onPressed: () {},
                              height: 48.h,
                              minWidth: 152.w,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              splashColor: HexColor('#1315131A'),
                              color: HexColor('#1315131A'),
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    Strings.orders,
                                    height: 32.h,
                                    width: 32.h,
                                  ),
                                  Text(
                                    'Orders',
                                    style: TextStyles.body(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 32.h),
                        child: Divider(
                          height: 1.h,
                          color: HexColor('#1315130D'),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 64,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 200.w,
                          crossAxisSpacing: 24.w,
                          mainAxisSpacing: 16.w,
                        ),
                        itemBuilder: (context, index) {
                          return ProductGrid();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
