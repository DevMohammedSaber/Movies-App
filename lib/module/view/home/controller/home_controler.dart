import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/utils/constants/constants.dart';
import 'package:movies_app/utils/helpers/api_client.dart';

abstract class HomeController extends GetxController {
  RxList<MovieModel> topRatinglist = <MovieModel>[].obs;
  RxList<MovieModel> upCominglist = <MovieModel>[].obs;
  RxList<MovieModel> popularlist = <MovieModel>[].obs;

  Future<List<MovieModel>> fetchMovies(String urlLink);
  String? initUrlLink;
}

class HomeControllerImpl extends HomeController {
  static HomeControllerImpl get instance => Get.find();

  CarouselController carouselController = CarouselController();
  PageController pageController = PageController();
  Rx<int> currentIndex = 0.obs;

  void updatePageIndicator(index, reason) {
    currentIndex.value = index;
  }

  @override
  Future<List<MovieModel>> fetchMovies(String urlLink) async {
    try {
      final response = await ApiClient.instance.get(urlLink);

      final decodedData = json.decode(response.body)['results'] as List;
      final data =
          decodedData.map((movie) => MovieModel.fromJson(movie)).toList();

      if (initUrlLink == Constants.popularUrl) {
        popularlist.addAll(data);
      } else if (initUrlLink == Constants.topRatedUrl) {
        topRatinglist.addAll(data);
      } else if (initUrlLink == Constants.upComingUrl) {
        upCominglist.addAll(data);
      }

      return data;
    } catch (e) {
      throw Exception('Something went wrong. please try again: $e');
    }
  }
}
