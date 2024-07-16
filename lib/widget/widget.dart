import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oua_flutter_travel_gallery/models/photo_model.dart';
import 'package:oua_flutter_travel_gallery/views/full_screen.dart';

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: listPhotos.map((PhotosModel photosModel) {
        return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(imagepath: photosModel.src!.portrait!)
                ),
                );
              },

              child: Hero(
                  tag: photosModel.src!.portrait!,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: photosModel.src!.portrait!,
                        fit: BoxFit.cover,
                    ),
                  ),
              )),
            ));
      }).toList(),
    ),
  );
}
