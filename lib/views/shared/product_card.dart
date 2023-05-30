import 'package:flutter/material.dart';
import 'package:shoe_store/views/shared/app_style.dart';

class ProductCard extends StatefulWidget {

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  const ProductCard({
    super.key, 
    required this.price, 
    required this.category, 
    required this.id, 
    required this.name, 
    required this.image
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1,1)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image)
                      )
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(
                        Icons.favorite_border
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name, 
                      style: appStyleWithHeight(30, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category, 
                      style: appStyleWithHeight(16, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyle(25, Colors.black, FontWeight.w600)
                    ),
                    Row(
                      children: [
                        Text(
                          'Colors',
                          style: appStyle(16, Colors.grey, FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        ChoiceChip(
                          label: const Text(''), 
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}