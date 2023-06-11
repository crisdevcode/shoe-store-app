import 'package:flutter/material.dart';
import 'package:shoe_store/views/shared/app_style.dart';

class StaggerTile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;

  const StaggerTile({
    super.key,
    required this.imageUrl, 
    required this.name, 
    required this.price,
  });

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(widget.imageUrl,),
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: appStyleWithHeight(20, Colors.black, FontWeight.w700, 1),
                  ),
                  Text(
                    widget.price,
                    style: appStyleWithHeight(20, Colors.black, FontWeight.w500, 1),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}