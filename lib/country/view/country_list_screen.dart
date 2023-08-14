import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controller/country_controller.dart';

class CountryListScreen extends StatelessWidget {
  final CountryController _controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Countries'),
      ),
      body: Obx(
        () {
          if (_controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.custom(
              gridDelegate: SliverStairedGridDelegate(
                crossAxisSpacing: 48,
                mainAxisSpacing: 24,
                startCrossAxisDirectionReversed: true,
                pattern: [
                  const StairedGridTile(0.5, 1),
                  const StairedGridTile(0.5, 3 / 4),
                  const StairedGridTile(1.0, 10 / 4),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: _controller.filteredCountries.length,
                (context, index) => Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _controller.filteredCountries[index],
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            );

            GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(1, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: _controller.filteredCountries.length,
                (context, index) => Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Center(
                      child: Text(
                    _controller.filteredCountries[index],
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
