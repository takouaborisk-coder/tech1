 import 'package:flutter/material.dart';
import 'package:tech1/Pages/SousPages/requette/requette.dart';


class Sams extends StatefulWidget {
  const Sams({super.key});

  @override
  State<Sams> createState() => _SamsState();
}

class _SamsState extends State<Sams> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
      ),
      child: FutureBuilder(
          future: fetchpost(mobile: 'samsung'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text('Erreur'),);
            }
            final posts = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  SizedBox(
                    width: MediaQuery.of(context).size.height*0.4,
                    height: MediaQuery.of(context).size.height*0.15,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: posts.length,
                      itemBuilder: (contex, index){
                        return Stack(
                            children: [ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(posts[index]['urlToImage'], fit: BoxFit.cover,),
                            ),
                            ]);
                      }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 10,); },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final article = posts[index];
                        return ListTile(
                          title: Text(article['title'] ?? '', style: TextStyle(fontWeight: FontWeight.w600),),
                          subtitle: Text(article['description'] ?? ''),
                          leading: article['urlToImage'] != null
                              ? Image.network(
                            article['urlToImage'],
                            height: 200,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                              : Icon(Icons.image),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
