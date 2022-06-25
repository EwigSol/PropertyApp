import 'dart:async';

import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realestapp/Chat/chat_ui.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
// import 'package:realestapp/Controllers/review_controller.dart';
import '../Models/review_model.dart';
import '../Utils/color_scheme.dart';

class ListingDetails extends StatefulWidget {
  var title;
  var id;
  var price;
  var images;
  var description;
  ListingDetails({
    this.description,
    this.id,
    this.price,
    this.title,
    this.images,
    Key? key,
  }) : super(key: key);

  @override
  State<ListingDetails> createState() => _ListingDetailsState();
}

class _ListingDetailsState extends State<ListingDetails> {
  @override
  void initState() {
    super.initState();
  }

  final listingDetailsController = Get.put(ListingDetailsController());
String icons='shower';
  @override
  Widget build(BuildContext context) {
    var listing = Get.find<ListingDetailsController>().listingDetail.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: lightGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: lightGreen,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(ChatUi(listingId: widget.id, title: widget.title));
              },
              icon: const Icon(
                Icons.chat_sharp,
                color: lightGreen,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listingDetailsController.listingDetail.value.customFields.length,
        itemBuilder: (context, index) {
          return Icon(FlatIcons.get(icons));
        },
      ),
      //  SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       ImageSlideshow(
      //         width: double.infinity,
      //         height: 200,
      //         initialPage: 0,
      //         indicatorColor: lightGreen,
      //         indicatorBackgroundColor: mediumGrey,
      //         children: images,
      //         autoPlayInterval: 3000,
      //         isLoop: true,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(22.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   widget.title,
      //                   style: const TextStyle(
      //                     color: darkGrey,
      //                     fontSize: 18,
      //                   ),
      //                 ),
      //                 Text(
      //                   '\$${widget.price}',
      //                   style: const TextStyle(
      //                     color: darkGrey,
      //                     fontSize: 18,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(
      //               height: 15,
      //             ),
      //             Text(
      //               widget.description,
      //               style: const TextStyle(
      //                 color: mediumGrey,
      //                 fontSize: 16,
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 15,
      //             ),
      //             const Text(
      //               'Location',
      //               style: TextStyle(
      //                 color: darkGrey,
      //                 fontSize: 20,
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //           ],
      //         ),
      //       ),
      //       // SizedBox(
      //       //   width: double.infinity,
      //       //   height: 300,
      //       //   child: GoogleMap(
      //       //     mapType: MapType.hybrid,
      //       //     initialCameraPosition: CameraPosition(
      //       //       target: LatLng(
      //       //           double.parse(listingDetailsController
      //       //               .listingDetail.value.listing.contact.latitude
      //       //               .toString()),
      //       //           double.parse(listingDetailsController
      //       //               .listingDetail.value.listing.contact.longitude
      //       //               .toString())),
      //       //       zoom: 14.4746,
      //       //     ),
      //       //     onMapCreated: (GoogleMapController controller) {
      //       //       _controller.complete(controller);
      //       //     },
      //       //   ),
      //       // ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: const [
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text(
      //               'Extra Info',
      //               style: TextStyle(
      //                 color: darkGrey,
      //                 fontSize: 20,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             // extraInfo('Bath', '1ba'),
      //             // extraInfo('Rent or Buy', 'Rent'),
      //             // extraInfo('Bedrooms', '1bd'),
      //             // extraInfo('Close to Public', 'Yes'),
      //             // extraInfo('New Construction', 'No'),
      //             // extraInfo('Year Built', '2000'),
      //             // extraInfo('Square Feet', '100ft - 500ft'),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text(
      //               'Reviews',
      //               style: TextStyle(
      //                 color: darkGrey,
      //                 fontSize: 20,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //             // SizedBox(
      //             //   height: 300,
      //             //   child: Obx(
      //             //     () => reviewController.reviewList.value.pagination != null
      //             //         ? ListView.builder(
      //             //             itemCount:
      //             //                 reviewController.reviewList.value.data.length,
      //             //             itemBuilder: ((context, index) => review(
      //             //                   reviewController
      //             //                       .reviewList.value.data[index],
      //             //                 )),
      //             //           )
      //             //         : const Text('No Reviews for this Listing'),
      //             //   ),
      //             // ),
      //             SizedBox(
      //               height: 20,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
  IconData getIconData(Map<String, dynamic> icon) {
  return IconData(
    icon['icon'],
  );
}

  extraInfo(title, value) {
    return Padding(
      padding: const EdgeInsets.only(right: 60.0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkGrey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: mediumGrey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
  

}

  review(Data review) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: mediumGrey),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          review.authorAvatarUrls.entries.first.value),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.authorName,
                      style: const TextStyle(fontSize: 16, color: darkGrey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      review.date.toString().substring(0, 10),
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 14,
                          color: mediumGrey,
                          overflow: TextOverflow.clip),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: review.rating.toDouble(),
                  minRating: 1,
                  itemSize: 25,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: lightGreen,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            Text(
              review.content.raw,
              style: const TextStyle(fontSize: 16, color: darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
