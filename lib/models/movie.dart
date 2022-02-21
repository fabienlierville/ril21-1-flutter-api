class Movie {
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final String imageUrl;
  final double vote;

  Movie({required this.id,required  this.title,required  this.overview,required  this.releaseDate,required  this.imageUrl, required this.vote});

  static List<Movie> moviesFromJson(Map<String,dynamic> json){
    List<dynamic> results = json["results"];

    List<Movie> l = [];
    results.forEach((element) {
      Movie movie = Movie(
          id: element["id"],
          title: element["title"],
          overview: element["overview"],
          releaseDate:DateTime.parse(element["release_date"]),
          imageUrl: element["poster_path"],
          vote: double.tryParse(element["vote_average"].toString()) ?? 0
      );
      l.add(movie);

    });
    return l;
  }

  String getImageUrl(){
    return "https://image.tmdb.org/t/p/w500${this.imageUrl}";
  }


}