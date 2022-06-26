import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/search_controller.dart';
import 'package:realestapp/Search/Widgets/SearchRessultCard.dart';

import '../AddListings/list_widget.dart';
import '../Controllers/listings_controller.dart';
import '../Home/item_widget.dart';
import '../Utils/color_scheme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for Listings',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.close),
              suffixIconColor: lightGreen,
              prefixIconColor: lightGreen,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: darkGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: lightGreen,
                ),
              ),
            ),
            onSubmitted: (value) {
              searchController.getSearchedListings(value);
            },
          ),
          const SizedBox(
            height: 15,
          ),
<<<<<<< HEAD
         Obx(() {
         return  searchController.searchListings.value.data == null
              ? const CircularProgressIndicator(
                  color: Colors.greenAccent,
                )
              : Expanded(
                  child:  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
=======
          Obx(() {
            return searchController.searchListings.value.data == null
                ? const CircularProgressIndicator(
                    color: Colors.greenAccent,
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
>>>>>>> a190e60bb1ac09e6945e17c6002b2ce5f1d44423
                      itemCount:
                          searchController.searchListings.value.data!.length,
                      itemBuilder: (context, position) {
                        return SearchResultCard(
                          image: searchController
                              .searchListings.value.data![position].images,
                          title: searchController
                              .searchListings.value.data![position].title,
                          city:
                              '${searchController.searchListings.value.data![position].contact!.locations![1].name}, ${searchController.searchListings.value.data![position].contact!.locations![0].name}',
                          price: searchController
                              .searchListings.value.data![position].price,
                          isFovorite: false,
                          description: '',
                          listingId: searchController
                              .searchListings.value.data![position].listingId,
                        );
                      },
                    ),
<<<<<<< HEAD
                );
         }),
=======
                  );
          }),
>>>>>>> a190e60bb1ac09e6945e17c6002b2ce5f1d44423
        ],
      ),
    );
  }
}
