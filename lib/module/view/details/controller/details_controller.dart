import 'dart:convert';
import 'package:get/get.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/utils/constants/constants.dart';

import 'package:movies_app/utils/helpers/api_client.dart';
import 'package:movies_app/utils/helpers/app_logger.dart';

abstract class DetailsScreenController extends GetxController {
  Future<MovieModel> fetchMovieDetails(String id);
}

class DetailsScreenControllerImpl extends DetailsScreenController {
  @override
  Future<MovieModel> fetchMovieDetails(String id) async {
    try {
      final response = await ApiClient.instance
          .get('${Constants.apiLink}/$id?api_key=${Constants.apiKey}');

      final decodedData = jsonDecode(response.body);
      final data = MovieModel.fromJson(decodedData);
      return data;
    } catch (e) {
      AppLogger().error('Something went wrong. please try again: $e');
      return MovieModel.empety();
    }
  }
}
