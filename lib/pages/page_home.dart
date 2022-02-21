import 'package:api/api/movie_api.dart';
import 'package:api/models/movie.dart';
import 'package:api/widgets/movie_list.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Movie>? movies;
  StatusApi statusApi = StatusApi.chargement;

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
      body: bodynamic(),
    );
  }

  Widget bodynamic(){
    if(statusApi == StatusApi.chargement){
      return Center(child: CircularProgressIndicator(),);
    }

    if(statusApi == StatusApi.error){
      return Center(child: Text("Error"),);
    }
    //TODO : Tester si Portrait/Paysage et afficher ListView ou GridView
    return Center(child: MovieList(movies: movies!,),);

  }


  Future<void> callFilms() async{
    MovieApi movieApi = MovieApi();
    setState(() {
      statusApi = StatusApi.chargement;
    });
    await Future.delayed(Duration(seconds: 3));
    Map<String,dynamic> mapMovies =  await movieApi.getPopular();
    if(mapMovies["code"] == 200){
      setState(() {
        movies = Movie.moviesFromJson(mapMovies["body"]);
        statusApi = StatusApi.ok;
      });

      movies?.forEach((Movie movie) {
        print(movie.title);
      });

    }else{
      setState(() {
        statusApi = StatusApi.error;
      });
    }
  }
}

enum StatusApi {
  chargement,
  error,
  ok
}
