import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/utils/helpers/api_client.dart';
import 'package:movies_app/utils/helpers/app_logger.dart';

abstract class SubCategoryController extends GetxController {
  final controller = ScrollController();
  String? initUrlLink;

  int page = 1;
  int limitpage = 20;
  bool hasMore = true;

  RxList<MovieModel> movieslist = <MovieModel>[].obs;
  Future<List<MovieModel>> fetchMovies(String urlLink);
}

class SubCategoryControllerImpl extends SubCategoryController {
  @override
  void onInit() {
    fetchMovies(initUrlLink!);
    controller.addListener(() {
      if (page < limitpage) {
        if (controller.position.maxScrollExtent == controller.offset) {
          page++;
          if (hasMore) {
            fetchMovies(initUrlLink!);
          }
          if (page == limitpage) {
            hasMore = false;
          }
        }
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Future<List<MovieModel>> fetchMovies(String urlLink) async {
    try {
      final response = await ApiClient.instance.get('$urlLink&page=$page');

      final decodedData = json.decode(response.body)['results'] as List;
      final data =
          decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
      movieslist.addAll(data);

      return data;
    } catch (e) {
      AppLogger().error('Something went wrong. please try again: $e');
      return [];
    }
  }
}
