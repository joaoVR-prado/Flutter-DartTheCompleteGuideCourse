import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;

class PlaceDetailScreen extends StatelessWidget{
  const PlaceDetailScreen({
    super.key,
    required this.place

  });

  final Place place;
  String get locationImage{
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return 'https://conteudo.imguol.com.br/c/noticias/3b/2021/05/18/google-io-1621360834718_v2_900x506.png';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => MapScreen(
                    location: place.location, 
                    isSelecting: false,
                  )
                ));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      )
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      place.location.address,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}