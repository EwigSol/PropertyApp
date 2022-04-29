
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_scheme.dart';

class AddListing extends StatefulWidget {
  const AddListing({Key? key}) : super(key: key);

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  String _selectedCategory = 'House';
  final List<String> _categories = [
    'House',
    'Condo',
    'Apartment',
    'Town House',
    'Land',
    'Building',
    'Recently Sold'
  ];
  @override
  void initState() {
    super.initState();
    titleController.text = '2bd Condo - Park View';
    descriptionController.text = 'Amazing View in a luxury building';
    priceController.text = '\$123,1231,23';
    locationController.text =
        '1030 Market Park Steet San Fransico, CA, 94130, USA';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            items: _categories.map((category) {
                              return DropdownMenuItem(
                                child: Text(
                                  category,
                                  textAlign: TextAlign.end,
                                ),
                                value: category,
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
                        children: const [
                          Text(
                            'Filters',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Edit Filters',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 16,
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
                          SizedBox(
                            width: 190,
                            child: TextField(
                              maxLines: 2,
                              textAlign: TextAlign.end,
                              textAlignVertical: TextAlignVertical.center,
                              controller: locationController,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           
                            Container(
                              width: 100,
                              height: 100,
                              decoration:  BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/house1.png'),
                                  fit: BoxFit.cover
                                ),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                             Container(
                              width: 100,
                              height: 100,
                              decoration:  BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/house3.png'),
                                  fit: BoxFit.cover
                                ),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                             Container(
                              width: 100,
                              height: 100,
                              decoration:  BoxDecoration(
                                color: lightGreen,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(Icons.camera_alt,size: 40,color: white,),
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
                        child: ElevatedButton(onPressed: (){}, 
                        style: ElevatedButton.styleFrom(
                          primary: lightGreen,
                          onSurface: white,
                        ),
                        child: const Text('Post Listing',style: TextStyle(fontSize: 18),)))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
