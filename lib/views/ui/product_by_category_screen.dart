import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shoe_store/models/sneaker_model.dart';
import 'package:shoe_store/services/helper.dart';
import 'package:shoe_store/views/shared/app_style.dart';
import 'package:shoe_store/views/shared/category_btn.dart';
import 'package:shoe_store/views/shared/custom_spacer.dart';
import 'package:shoe_store/views/shared/latest_shoes.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final int tabIndex;

  const ProductByCategoryScreen({
    super.key, 
    required this.tabIndex,
  });

  @override
  State<ProductByCategoryScreen> createState() => _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> with TickerProviderStateMixin {

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
    _tabController.index = widget.tabIndex;
    getMale();
    getFemale();
    getKids();
  }

  List<String> brand = [
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/jordan.png',
    'assets/images/nike.png'
  ];

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: 16,
                right: 12
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LatestShoes(
                      productList: _maleList
                    ),
                    LatestShoes(
                      productList: _femaleList
                    ),
                    LatestShoes(
                      productList: _kidsList
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54, 
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          )
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    'Filter',
                    style: appStyle(40, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Text(
                    'Gender',
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CategoryBtn(
                        label: 'Men', 
                        buttonColor: Colors.black
                      ),
                      CategoryBtn(
                        label: 'Women', 
                        buttonColor: Colors.grey
                      ),
                      CategoryBtn(
                        label: 'Kids', 
                        buttonColor: Colors.grey
                      ),
                    ],
                  ),
                  const CustomSpacer(),
                  Text(
                    'Category',
                    style: appStyle(20, Colors.black, FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CategoryBtn(
                        label: 'Shoes', 
                        buttonColor: Colors.black
                      ),
                      CategoryBtn(
                        label: 'Aparrels', 
                        buttonColor: Colors.grey
                      ),
                      CategoryBtn(
                        label: 'Accesories', 
                        buttonColor: Colors.grey
                      ),
                    ],
                  ),
                  const CustomSpacer(),
                  Text(
                    'Price',
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Slider(
                    value: _value,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.black,
                    max: 500,
                    divisions: 50,
                    label: _value.toString(),
                    secondaryTrackValue: 200,
                    onChanged: (double value) {

                    },
                  ),
                  const CustomSpacer(),
                  Text(
                    'Brand',
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    child: ListView.builder(
                      itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                            child: Image.asset(
                              brand[index],
                              height: 60,
                              width: 80,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

















