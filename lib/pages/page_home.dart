import 'package:api/api/movie_api.dart';
import 'package:api/models/movie.dart';
import 'package:api/widgets/movie_grid.dart';
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
              onPressed: (){
                setState(() {
                });
              },
              icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: callFilms(),
        builder: (context,AsyncSnapshot<List<Movie>> snapshot){
          print(snapshot);
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text("Error"));
          }
          List<Movie>? moviList = snapshot.data;
          return MovieList(movies: moviList!);
        },
      ),
    );
  }

  /*
  Widget bodynamic(){
    if(statusApi == StatusApi.chargement){
      return Center(child: CircularProgressIndicator(),);
    }

    if(statusApi == StatusApi.error){
      return Center(child: Text("Error"),);
    }
    if(MediaQuery.of(context).orientation == Orientation.landscape){
      return Center(child: MovieGrid(movies: movies!,),);
    }
    return Center(child: MovieList(movies: movies!,),);

  }
   */


  Future<List<Movie>> callFilms() async{
    List<Movie> moviList = [];
    MovieApi movieApi = MovieApi();
    await Future.delayed(Duration(seconds: 3));
    Map<String,dynamic> mapMovies =  await movieApi.getPopular();
    if(mapMovies["code"] == 200){
      moviList = Movie.moviesFromJson(mapMovies["body"]);
    }
    return moviList;
  }
}

enum StatusApi {
  chargement,
  error,
  ok
}
