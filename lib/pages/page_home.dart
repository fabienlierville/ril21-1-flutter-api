import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
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
    //Todo
  }
}
