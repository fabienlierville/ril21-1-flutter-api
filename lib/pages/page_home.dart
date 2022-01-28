import 'package:api/api/movie_api.dart';
import 'package:api/models/movie.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Movie>? movies;

  @override
  void initState() {
    callFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des films"),
        actions: [
          IconButton(
              onPressed: callFilms,
              icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: Center(),
    );
  }

  Future<void> callFilms() async{
    MovieApi movieApi = MovieApi();
    //Todo écran pour faire patienter
    Map<String,dynamic> mapMovies =  await movieApi.getPopular();
    if(mapMovies["code"] == 200){
      setState(() {
        movies = Movie.moviesFromJson(mapMovies["body"]);
      });

      movies?.forEach((Movie movie) {
        print(movie.title);
      });

      //Todo affichge la liste des films
    }else{
      //Todo
    }
  }
}
