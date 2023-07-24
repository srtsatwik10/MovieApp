import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/decription.dart';

class TrendingMovies extends StatelessWidget {
  TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Trending Movies", color: Colors.white, size: 22.0,),
          SizedBox(height: 20),
          Container(
            height: 290,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['original_title'] != null
                                    ? trending[index]['original_title']
                                        .toString()
                                    : trending[index]['original_name'],
                                dscrp: trending[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                vote:
                                    (trending[index]['vote_average'].toInt()).round(),
                                launch: trending[index]['release_date'], vote_count: trending[index]['vote_count'],)));
                  },
                  child: Container(
                    width: 145,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                              ))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Flexible(
                            child: modified_text(
                              size: 14,
                              text: trending[index]['original_title'] != null
                                  ? trending[index]['original_title'].toString()
                                  : trending[index]['original_name'],
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ), // TODO add the list of movies here using a ListView widget and MovieCard
    );
  }
}
