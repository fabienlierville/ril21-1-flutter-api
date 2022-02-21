import 'package:api/models/movie.dart';
import 'package:flutter/material.dart';

class MovieGrid extends StatelessWidget {
  MovieGrid({Key? key, required this.movies}) : super(key: key);
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index){
        Movie movie = movies[index];
        return Container(
          child: Image.network(movie.getImageUrl()),
        );
      },
    );
  }
}
