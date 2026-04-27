import 'package:flutter/material.dart';
import 'package:new_movie_app/components/custom_category_card.dart';
import 'package:new_movie_app/screens/search_view.dart';
import 'package:new_movie_app/services/tmdb_services.dart';
import '../components/custome_movie_list_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // final itemcount = movies.length;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
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
                        controller: searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
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
                    GestureDetector(
                      onTap: () {
                        if (searchController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchView(query: searchController.text),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please enter a query")),
                          );
                        }
                        ;
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.search_rounded, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ],
                ),
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
                MovieListView(
                  title: "Now Playing Movies",
                  future: MoiveServices().getNowPlayingMovies(),
                ),
                MovieListView(
                  title: "Popular Movies",
                  future: MoiveServices().getPopularMovies(),
                ),
                MovieListView(
                  future: MoiveServices().getTopRatedMovies(),
                  title: "Top Rated Movies",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
