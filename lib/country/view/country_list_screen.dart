import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/country_controller.dart';

class CountryListScreen extends StatelessWidget {
  final CountryController _controller = Get.put(CountryController());

  CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List Screen'),
      ),
      body: Obx(
            () {
          if (_controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: _controller.filteredCountries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_controller.filteredCountries[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}