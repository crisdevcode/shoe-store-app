import 'package:flutter/material.dart';
import 'package:shoe_store/models/sneaker_model.dart';
import 'package:shoe_store/views/shared/app_style.dart';
import 'package:shoe_store/views/shared/new_shoes.dart';
import 'package:shoe_store/views/shared/product_card.dart';

class HomeWidget extends StatelessWidget {

  final Future<List<Sneaker>> _productList;

  const HomeWidget({
    super.key,
    required Future<List<Sneaker>> productList,
  }) : _productList = productList;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder(
            future: _productList,
            builder: ((context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else {
                final product = snapshot.data;
                return ListView.builder(
                  itemCount: product!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return ProductCard(
                      price: '\$${shoe.price}', 
                      category: shoe.category, 
                      id: shoe.id, 
                      name: shoe.name, 
                      image: shoe.imageUrl[0]
                    );
                  },
                );
              }
            })
          )
        ),
        Column(
          children: [
            Padding( 
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: appStyle(24, Colors.black, FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Show All',
                        style: appStyle(22, Colors.black, FontWeight.w500),
                      ),
                      const Icon(Icons.play_arrow, size: 30)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FutureBuilder(
            future: _productList,
            builder: ((context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else {
                final product = snapshot.data;
                return ListView.builder(
                  itemCount: product!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: NewShoes(
                        imageUrl: shoe.imageUrl[1]
                      ),
                    );
                  },
                );
              }
            })
          )
        ),
      ],
    );
  }
}

