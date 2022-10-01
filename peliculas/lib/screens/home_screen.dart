import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies in teathers'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () => showSearch(
                context: context,
                delegate: movieSearchDelegate(),
              ),
            ),
          ],
        ),

        //SingleChildScrollView nos ayuda a hacer scroll en la pantalla
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Targetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //Slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Popular',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
