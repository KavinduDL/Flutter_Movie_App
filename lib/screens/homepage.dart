import 'package:flutter/material.dart';
import 'package:new_movie_app/components/custom_category_card.dart';
import 'package:new_movie_app/models/custom_movie_model.dart';

import '../components/custome_name_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<MovieModel> movies = [
    MovieModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_HfU8XK6GBU_ply9iN6s0ifVrwRP15DtYuQ&s",
      name: "Avatar",
      date: "Dec 18, 2009",
    ),
    MovieModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmkq35zEZtIgZWAHKWdGD_IRMUx-c9EOgrcQ&s",
      name: "Inception",
      date: "Jul 16, 2010",
    ),
    MovieModel(
      image: "https://m.media-amazon.com/images/I/81YdUDaMiWL.jpg",
      name: "Interstellar",
      date: "Nov 07, 2014",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final itemcount = movies.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Kavindu 👋",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Book your favourite movie",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/a/ACg8ocKAPXrr_3Y0gBctvywDyW7HqAyFC7kOIDGh2zHqaW7WSJnofS6V=s360-c-no",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.75,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        prefixIcon: Icon(
                          size: 25,
                          Icons.search_rounded,
                          color: Colors.indigoAccent,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.indigoAccent),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.filter_alt_rounded, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomNameWidget(headingName: "Category"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCategoryCard(
                    CategoryIcon: "🥰",
                    CategoryName: "Romance",
                  ),
                  CustomCategoryCard(
                    CategoryIcon: "😂",
                    CategoryName: "Comedy",
                  ),
                  CustomCategoryCard(
                    CategoryIcon: "😎",
                    CategoryName: "Action",
                  ),
                  CustomCategoryCard(
                    CategoryIcon: "😨",
                    CategoryName: "Horror",
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomNameWidget(headingName: "Latest Movie"),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(itemcount, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(movies[index].image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Text(
                            movies[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          Text(
                            movies[index].date,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
