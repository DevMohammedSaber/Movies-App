import 'dart:convert';
import 'package:get/get.dart';
import 'package:movies_app/module/model/movie_model.dart';
import 'package:movies_app/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

abstract class DetailsScreenController extends GetxController {
  Future<MovieModel> fetchMovieDetails(String id);
}

class DetailsScreenControllerImpl extends DetailsScreenController {
  @override
  Future<MovieModel> fetchMovieDetails(String id) async {
    try {
      final response = await http.get(
          Uri.parse('${Constants.apiLink}/$id?api_key=${Constants.apiKey}'));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        final data = MovieModel.fromJson(decodedData);
        return data;
      } else {
        throw Exception('Something went wrong. please try again');
      }
    } on Exception catch (e) {
      throw Exception('Something went wrong. please try again === $e');
    }
  }
}
