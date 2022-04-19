import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';
import 'package:movies/layers/presentation/home/widgets/custom_elevated_button.dart';
import 'package:movies/layers/presentation/home/widgets/custom_pageview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetMovieListUsecase getMovieListUsecase = GetIt.I.get<GetMovieListUsecase>();
  late List<MovieEntity> movies;
  @override
  void initState() {
    super.initState();
    teste();
  }

  teste() async {
    final response = await getMovieListUsecase.call(page: 5);
    response.fold(
      (l) => print("oxe erro"),
      (r) => movies = r,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: smSpacing, left: normalSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Now Showing',
                style: TextStyle(fontSize: 24),
              ),
              TextButton(
                child: Text('view all'),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 46,
          margin: const EdgeInsets.all(smSpacing),
          child: ListView.builder(
              itemCount: movies.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: smSpacing),
              itemBuilder: (context, index) => CustomElevatedButton(
                  text: movies[index].title,
                  isActive: index == 0,
                  onPressed: () {
                    print('oxe');
                  })),
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: CustomPageView(
            hasFocus: true,
            movies: movies,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Now Showing',
                style: TextStyle(fontSize: 24),
              ),
              TextButton(
                child: Text('view all'),
                onPressed: () {},
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: CustomPageView(
            height: MediaQuery.of(context).size.height * 0.26,
            viewportFraction: 0.36,
            movies: movies,
          ),
        ),
      ]),
    );
  }
}
