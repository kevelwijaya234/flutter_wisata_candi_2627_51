import 'package:flutter/material.dart';
import 'package:flutter_wisata_candi_2627_51/models/candi.dart';

class ItemCard extends StatelessWidget {
  final Candi candi;

  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    //Todo 2
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Todo 3
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Todo 4
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(candi.name, 
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ), 
          )
          //Todo 5
        ],
      ),
    );
  }
}