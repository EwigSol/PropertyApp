import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestapp/Controllers/categories_controller.dart';

import '../Controllers/LocationController.dart';
import '../Controllers/listings_controller.dart';
import '../Utils/color_scheme.dart';

class AddListing extends StatefulWidget {
  const AddListing({Key? key}) : super(key: key);

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  final ListingController listingController = Get.put(ListingController());
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final LocationsController locationsController =
      Get.put(LocationsController());
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  String _selectedLocation = '';
  String _selectedCategory = '';
  bool editFilters = false;
  List<XFile>? imageFiles = [];
  var locationId = 0;
  var categoryId = 0;

  addListing() async {
    await listingController.addListing(
        locationId,
        categoryId,
        'rent',
        titleController.text.toString(),
        'approved',
        priceController.text.toString(),
        priceController.text.toString(),
        'is-new',
        descriptionController.text.toString(),
        imageFiles!);
  }

  @override
  void initState() {
    setState(() {
      _selectedLocation = locationsController.locations[0].name!;
      _selectedCategory = categoriesController.categories[0].name!;
    });
    super.initState();
    categoryId = 112;
    titleController.text = '2bd Condo - Park View';
    descriptionController.text = 'Amazing View in a luxury building';
    priceController.text = '\$123,1231,23';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.navigate_before,
                color: lightGreen,
                size: 34,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Add Listing',
              style: TextStyle(
                color: lightGreen,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 12.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Title',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: TextField(
                              controller: titleController,
                              cursorColor: lightGreen,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 12.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: TextField(
                              controller: descriptionController,
                              cursorColor: lightGreen,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.end,
                                  controller: priceController,
                                  cursorColor: lightGreen,
                                  decoration: const InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Category',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              DropdownButton(
                                alignment: AlignmentDirectional.centerEnd,
                                underline: const SizedBox(),
                                iconSize: 0.0,
                                value: _selectedCategory,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCategory = newValue.toString();
                                  });
                                },
                                items: categoriesController.categories
                                    .map((category) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      category.name.toString(),
                                      textAlign: TextAlign.end,
                                    ),
                                    value: category.name.toString(),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Filters',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    editFilters = true;
                                  });
                                },
                                child: const Text(
                                  'Edit Filters',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: darkGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              DropdownButton(
                                alignment: AlignmentDirectional.centerEnd,
                                underline: const SizedBox(),
                                iconSize: 0.0,
                                value: _selectedLocation,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedLocation = newValue.toString();
                                  });
                                },
                                items: locationsController.locations.value
                                    .map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      location.name.toString(),
                                      textAlign: TextAlign.end,
                                    ),
                                    value: location.name.toString(),
                                  );
                                }).toList(),
                              ),
                              // SizedBox(
                              //   width: 190,
                              //   child: TextField(
                              //     maxLines: 2,
                              //     textAlign: TextAlign.end,
                              //     textAlignVertical: TextAlignVertical.center,
                              //     controller: locationController,
                              //     cursorColor: lightGreen,
                              //     decoration: const InputDecoration(
                              //       enabledBorder: InputBorder.none,
                              //       focusedBorder: InputBorder.none,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Add Photos',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await _getFromGallery();
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: lightGreen,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 40,
                                      color: white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: ListView.builder(
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      reverse: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: imageFiles?.length,
                                      itemBuilder: (context, index) {
                                        return imageContainer(
                                            File(imageFiles![index].path));
                                      }),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    addListing();

                                    Get.put(ListingController());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: lightGreen,
                                    onSurface: white,
                                  ),
                                  child: const Text(
                                    'Post Listing',
                                    style: TextStyle(fontSize: 18),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        editFilters
            ? Scaffold(
                backgroundColor: Colors.black38,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          filterOption('Rent or Buy', 'Rent or Buy'),
                          filterOption('Price Range', 'Price Range'),
                          filterOption('Square Feet', 'Square Feet'),
                          filterOption('Bedrooms', 'Bedrooms'),
                          filterOption('Baths', 'Baths'),
                          filterOption('New Construction', 'New Construction'),
                          filterOption('Year Built', 'Year Built'),
                          filterOption('Close to Public Transportation',
                              'Close to Public Transportation'),
                          filterOption(' No Of Units', ' No Of Units'),
                          const SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 70.0, right: 70.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    editFilters = false;
                                  });
                                },
                                child: const Text(
                                  'Save Filters',
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: lightGreen,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Offstage(),
      ],
    );
  }

  _getFromGallery() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    for (int i = 0; i < images!.length; i++) {
      setState(() {
        imageFiles!.addAll(images);
      });
    }
  }

  imageContainer(file) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
                file,
              ),
              fit: BoxFit.cover),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }

  filterOption(title, value) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 14.0, bottom: 14.0, left: 22, right: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              value,
              maxLines: 2,
              textAlign: TextAlign.end,
            ),
          ),
          // DropdownButton(
          //   alignment: AlignmentDirectional.centerEnd,
          //   underline: const SizedBox(),
          //   iconSize: 0.0,
          //   value: selected,
          //   onChanged: (newValue) {
          //     setState(() {
          //       selected = newValue.toString();
          //     });
          //   },
          //   items: list.map((listItem) {
          //     return DropdownMenuItem(
          //       child: Text(
          //         listItem,
          //         textAlign: TextAlign.end,
          //       ),
          //       value: listItem,
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
