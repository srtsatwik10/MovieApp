import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/decription.dart';

class TV extends StatelessWidget {
  TV({super.key, required this.tv});

  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Popular TV Shows",
              color: Colors.white,
              size: 22.0),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                        .toString()
                                    : tv[index]['title'].toString(),
                                dscrp: tv[index]['overview'].toString(),
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                vote:
                                    (tv[index]['vote_average'].toInt()).round(),
                                launch: tv[index]['release_date'], 
                                vote_count: tv[index]['vote_count'],)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 270,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                          ),fit:BoxFit.cover )),
                        ), 
                        SizedBox(height: 10,),

                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: modified_text(
                            size: 14,
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'Loading',
                              color: Colors.white,
                              ),
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
