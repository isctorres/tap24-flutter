import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';

class PopularView extends StatelessWidget {
  PopularView({super.key,this.popularModel});

  PopularModel? popularModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}',
              placeholder: (context, url) =>  const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.network('https://ih1.redbubble.net/image.3224006290.0121/flat,750x,075,f-pad,750x1000,f8f8f8.jpg'),
            ),
            Container(
              height: 60,
              color: Colors.black54,
              child: ListTile(
                //leading: Icon(Icons.movie, color: Colors.white,),
                title: Text(popularModel!.title, style: TextStyle(color: Colors.white),),
                subtitle: Text(popularModel!.releaseDate,style: TextStyle(color: Colors.white), maxLines: 1,),
                trailing: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/detail', arguments: popularModel ),
                  icon: const Icon(Icons.chevron_right), 
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}