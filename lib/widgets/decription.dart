import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description(
      {super.key,
      required this.name,
      required this.dscrp,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch, 
      required this.vote_count
      });

  final String name, dscrp, bannerurl, posterurl,  launch;
  final int vote,vote_count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(
                    bottom: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Text(' ⭐ Average rating-$vote/10  ($vote_count)  ',style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,backgroundColor: Colors.amber[50],fontSize: 16, 
                      ),),
                    ))//TODO:ADD TOTAL VOTING
                ],
              ),
            ),
            SizedBox(height: 10),
            
             Container(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: modified_text(text: name, color: Colors.white, size: 24)),
              SizedBox(height: 10),
            
             Container(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: modified_text(text: 'Released on : $launch', color: Colors.white, size: 16)),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(dscrp,style: const TextStyle(
                  fontSize: 18,
                  wordSpacing: 1.0,
                ),),
              ),
                  
                  
              
            
          ],
        ),
      ),
    );
  }
}
