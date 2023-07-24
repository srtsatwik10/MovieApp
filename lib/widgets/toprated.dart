import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/decription.dart';
// import '';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Top Rated', color: Colors.white, size: 22),
          SizedBox(height: 20),
          Container(
            height: 270,
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toprated.length, 
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: toprated[index]['original_title'] != null
                                    ? toprated[index]['original_title']
                                        .toString()
                                    : toprated[index]['original_name'],
                                dscrp: toprated[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                vote:
                                    toprated[index]['vote_average'].toInt().round(),
                                launch: toprated[index]['release_date'], vote_count: toprated[index]['vote_count'],)));

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
                          image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                                toprated[index]['poster_path'],
                                ))) ,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding:EdgeInsets.fromLTRB(10,0, 10, 0),
                        child:modified_text(color: Colors.white ,size: 14,
                        text: toprated[index]['title']!=null?toprated[index]['title']:'Loading' ),
                      )
                    ],
                  ),
                ),
              );
            })
          ),
        ],
      ),
    );
  }
}
            