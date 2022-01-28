import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieApi{
  final String baseURl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "f5a8a486fb069fcb10396a7a3e49ceb4";
  final String lang = "fr-FR";

  // {"code":200, "body": jsondecode}
  Future<Map<String, dynamic>> getPopular() async{
    String completeUrl = "${baseURl}/popular?api_key=${apiKey}&language=${lang}";
    print(completeUrl);
    
    http.Response response =  await http.get(Uri.parse(completeUrl));
    
    if(response.statusCode == 200){
      return {
        "code": 200,
        "body": jsonDecode(response.body)
      };
    }

    return {
      "code": response.statusCode,
      "body": response.body
    };
  }

}