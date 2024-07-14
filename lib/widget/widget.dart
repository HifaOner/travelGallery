import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oua_flutter_travel_gallery/models/photo_model.dart';

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context){
  return Container(
    padding: EdgeInsets.all(4.0),
    child: GridView.count
    (crossAxisCount: 2,
    childAspectRatio: 0.6,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: listPhotos.map((PhotosModel photosModel) {
      return GridTile(child: Hero(tag: photosModel.src!.portrait!, child: Container(
        child:CachedNetworkImage(imageUrl: photosModel.src!.portrait!, fit: BoxFit.cover,),
      )));
    }).toList(), ),
  );
}