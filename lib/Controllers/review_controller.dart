import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/review_model.dart';

class ReviewController extends GetxController {
  var reviewList = Review(
          data: [],
          pagination:
              Pagination(currentPage: 0, perPage: 0, total: 0, totalPages: 0))
      .obs;

  fetchReviews(listingId) async {
    var response = await http.get(
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/reviews?listing=$listingId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    var reviews = reviewFromJson(response.body);
    reviewList.value = reviews;
  }
}
