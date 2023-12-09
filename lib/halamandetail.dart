import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:responsi/modelDetail.dart';

class HalamanDetail extends StatefulWidget {
  final String id;
  const HalamanDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  late Future<List<DetailMeal>> _meals;
  Uri _url = Uri.parse('https://flutter.dev');
  @override
  void initState() {
    super.initState();
    _meals = fetchMeals();
  }
  Future<List<DetailMeal>> fetchMeals() async {
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.id}"));
    if (response.statusCode == 200) {
      List<DetailMeal> meals = (json.decode(response.body)['meals'] as List)
          .map((data) => DetailMeal.fromJson(data))
          .toList();
      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Detail", style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.075),
          child: FutureBuilder<List<DetailMeal>>(
            future: _meals,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No meals found.'),
                );
              } else {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.075),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.6,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data![0].strMealThumb)
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "${snapshot.data![0].strMeal}",
                          style: TextStyle(
                              fontSize: 25
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Category : ${snapshot.data![0].strCategory}"),
                            SizedBox(width: 20,),
                            Text("Area : ${snapshot.data![0].strArea}")
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bahan-Bahan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (snapshot.data?[0].strIngredient1 != null && snapshot.data![0].strIngredient1!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient1!}"),
                              ],
                              if (snapshot.data?[0].strIngredient2 != null && snapshot.data![0].strIngredient2!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient2!}"),
                              ],
                              if (snapshot.data?[0].strIngredient3 != null && snapshot.data![0].strIngredient3!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient3!}"),
                              ],
                              if (snapshot.data?[0].strIngredient4 != null && snapshot.data![0].strIngredient4!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient4!}"),
                              ],
                              if (snapshot.data?[0].strIngredient5 != null && snapshot.data![0].strIngredient5!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient5!}"),
                              ],
                              if (snapshot.data?[0].strIngredient6 != null && snapshot.data![0].strIngredient6!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient6!}"),
                              ],
                              if (snapshot.data?[0].strIngredient7 != null && snapshot.data![0].strIngredient7!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient7!}"),
                              ],
                              if (snapshot.data?[0].strIngredient8 != null && snapshot.data![0].strIngredient8!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient8!}"),
                              ],
                              if (snapshot.data?[0].strIngredient9 != null && snapshot.data![0].strIngredient9!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient9!}"),
                              ],
                              if (snapshot.data?[0].strIngredient10 != null && snapshot.data![0].strIngredient10!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient10!}"),
                              ],
                              if (snapshot.data?[0].strIngredient11 != null && snapshot.data![0].strIngredient11!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient11!}"),
                              ],
                              if (snapshot.data?[0].strIngredient12 != null && snapshot.data![0].strIngredient12!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient12!}"),
                              ],
                              if (snapshot.data?[0].strIngredient13 != null && snapshot.data![0].strIngredient13!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient13!}"),
                              ],
                              if (snapshot.data?[0].strIngredient14 != null && snapshot.data![0].strIngredient14!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient14!}"),
                              ],
                              if (snapshot.data?[0].strIngredient15 != null && snapshot.data![0].strIngredient15!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient15!}"),
                              ],
                              if (snapshot.data?[0].strIngredient16 != null && snapshot.data![0].strIngredient16!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient16!}"),
                              ],
                              if (snapshot.data?[0].strIngredient17 != null && snapshot.data![0].strIngredient17!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient17!}"),
                              ],
                              if (snapshot.data?[0].strIngredient18 != null && snapshot.data![0].strIngredient18!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient18!}"),
                              ],
                              if (snapshot.data?[0].strIngredient19 != null && snapshot.data![0].strIngredient19!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient19!}"),
                              ],
                              if (snapshot.data?[0].strIngredient20 != null && snapshot.data![0].strIngredient20!.isNotEmpty) ...[
                                Text("${snapshot.data![0].strIngredient20!}"),
                              ]

                            ],
                          ),
                        ),


                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Instructions",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("${snapshot.data![0].strInstructions}")
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                            ),
                            onPressed: () {
                              _launchUrl("${snapshot.data![0].strYoutube}");
                              print("tes");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Watch Tutorial",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(String link) async {
    if (!await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch $_url');
    }
  }
}
