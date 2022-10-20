import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/utils/constants.dart';
import 'package:movies/src/core/utils/enums.dart';
import 'package:movies/src/injector.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/movies/presentation/pages/home/dummy.dart';
import 'package:movies/src/movies/presentation/pages/home/home_state.dart';

import 'package:shimmer/shimmer.dart';

import 'home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(getIt(), getIt(), getIt()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(GetNowPlayingEvent());
    bloc.add(GetPopularEvent());
    bloc.add(GetTopRatedEvent());

    return SingleChildScrollView(
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: ((previous,
                current) => current is NowPlayingRequestState),
            builder: (context, state) {
              switch (state.nowPlayingRequestState) {
                case RequestState.loading:
                  return Container(height: 400,);
                case RequestState.loaded:
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {},
                      ),
                      items: state.nowPlaying.map(
                            (item) {
                          return GestureDetector(
                            key: const Key('openMovieMinimalDetail'),
                            onTap: () {
                              /// TODO : NAVIGATE TO MOVIE DETAILS
                            },
                            child: Stack(
                              children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        // fromLTRB
                                        Colors.transparent,
                                        Colors.black,
                                        Colors.black,
                                        Colors.transparent,
                                      ],
                                      stops: [0, 0.3, 0.5, 1],
                                    ).createShader(
                                      Rect.fromLTRB(
                                          0, 0, rect.width, rect.height),
                                    );
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: CachedNetworkImage(
                                    height: 560.0,
                                    imageUrl:
                                    Constants.imageUrl(item.backdropPath!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.redAccent,
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              'Now Playing'.toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                        child: Text(
                                          item.title!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  );
                case RequestState.error:
                // TODO: Handle this case.
                  return Container(height: 400,);
              }
            },
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO POPULAR SCREEN
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('See More'),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: ((previous, current) => current is PopularRequestState),
            builder: (context, state) {
              switch (state.popularRequestState) {
                case RequestState.loading:
                  return Container(height: 170.0,);

                case RequestState.loaded:
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: state.popular.length,
                        itemBuilder: (context, index) {
                          final movie = state.popular[index];
                          return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                /// TODO : NAVIGATE TO  MOVIE DETAILS
                              },
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  imageUrl: Constants.imageUrl(
                                      movie.backdropPath!),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 170.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                                8.0),
                                          ),
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                case RequestState.error:
                  return Container(height: 170.0,);
              }
            },
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(
              16.0,
              24.0,
              16.0,
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Rated",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO Top Rated Movies Screen
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('See More'),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => current is TopRateRequestState,
            builder: (context, state) {
              switch(state.topRateRequestState){

                case RequestState.loading:
                return Container(height: 170,);
                case RequestState.loaded:
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: state.topRate.length,
                        itemBuilder: (context, index) {
                          final movie = state.topRate[index];
                          return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                /// TODO : NAVIGATE TO  MOVIE DETAILS
                              },
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  imageUrl: Constants.imageUrl(movie.backdropPath!),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 170.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                                8.0),
                                          ),
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                case RequestState.error:
               return Container(height: 170,);
              }

            },
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
