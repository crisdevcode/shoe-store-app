import 'package:flutter/material.dart';
import 'package:shoe_store/models/sneaker_model.dart';
import 'package:shoe_store/services/helper.dart';
import 'package:shoe_store/views/shared/app_style.dart';
import 'package:shoe_store/views/shared/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late final TabController _tabController = TabController(length: 3, vsync: this);

  late Future<List<Sneaker>> _maleList;
  late Future<List<Sneaker>> _femaleList;
  late Future<List<Sneaker>> _kidsList;


  void getMale() {
    _maleList = Helper().getMaleSneakers();
  }

  void getFemale() {
    _femaleList = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kidsList = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/top_image.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Athletic Shoes',
                      style: appStyleWithHeight(42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text(
                      'Collection', 
                      style: appStyleWithHeight(42, Colors.white, FontWeight.bold, 1.2),
                    ),
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: 'Men Shoes',
                        ),
                        Tab(
                          text: 'Women Shoes',
                        ),
                        Tab(
                          text: 'Kids Shoes',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.265),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeWidget(
                      productList: _maleList,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      productList: _femaleList,
                      tabIndex: 1,
                    ),
                     HomeWidget(
                      productList: _kidsList,
                      tabIndex: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
