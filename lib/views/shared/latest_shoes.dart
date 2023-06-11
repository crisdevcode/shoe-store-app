import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoe_store/models/sneaker_model.dart';
import 'package:shoe_store/views/shared/stagger_tile.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required Future<List<Sneaker>> productList,
  }) : _productList = productList;

  final Future<List<Sneaker>> _productList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneaker>>(
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
          return MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
            padding: EdgeInsets.zero,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: product!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final shoe = snapshot.data![index];
              return StaggerTile(
                imageUrl: shoe.imageUrl[1], 
                name: shoe.name, 
                price: '\$${shoe.price}'
              );
            },
          );
        }
      })
    );
  }
}