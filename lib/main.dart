import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => (runApp(new MyApp()));

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(brightness: Brightness.dark,
       ),
      
    );
  }
}
 
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   

  List trendingmovies = [];
  List topratedmovies = [];
  List tvshows = [];
  
  final String api = '495b6e9481dcf3b8cf23f9fb8456bea7';
  final String accesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTViNmU5NDgxZGNmM2I4Y2YyM2Y5ZmI4NDU2YmVhNyIsInN1YiI6IjY0YmFiYmQ1MDZmOTg0MDBjNGYxZmQ3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LiGNqY0wawsKLQlx7NTa-ySN15NL4wjB0vVleDfox_w';

  @override
  void initState() {
    super.initState();
    loadmovie();
  }

  loadmovie() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(api, accesstoken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult  =  await tmdbWithCustomLogs.v3.movies.getTopRated(); 
    Map tvresult =  await tmdbWithCustomLogs.v3.tv.getTopRated();
    
    print(tvresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tvshows= tvresult['results'];
     
    });

  }
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: modified_text(text: "Recommovie",color: Colors.white,size: 26.0,),
        centerTitle: true,
      ),
      body: ListView(
        children:[
          TV(tv: tvshows, key:null),
          TopRated(toprated: topratedmovies, key: null,),
          TrendingMovies(trending: trendingmovies, key: null,),
          ]
        
      ),
    );
  }
}



  