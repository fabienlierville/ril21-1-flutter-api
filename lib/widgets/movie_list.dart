import 'package:api/models/movie.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key, required this.movies}) : super(key: key);
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index){
        Movie movie = movies[index];
        return Container(
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width / 2.5,
                  child: Column(
                    children: [
                      Text(movie.title),
                      Image.network(movie.getImageUrl())
                    ],
                  ),
                ),
                Container(
                  width: size.width / 2.5,
                  child: Column(
                    children: [
                      Text(movie.releaseDate.toString()),
                      Container(
                        height: size.height / 4,
                        child: Text(movie.overview, overflow: TextOverflow.fade),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
