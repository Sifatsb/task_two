import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryController extends GetxController {
  RxList<String> filteredCountries = <String>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    filterCountries();
    super.onInit();
  }

  Future<List<dynamic>> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> filterCountries() async {
    isLoading.value = true;
    final countriesData = await fetchCountries();
    final List<String> filteredList = [];

    for (var countryData in countriesData) {
      final currencies = countryData['currencies'];
      if (currencies != null &&
          currencies is Map &&
          currencies.length == 1 &&
          currencies.values.first is Map) {
        final currencyName = currencies.values.first['name'];
        if (currencyName != null && currencyName.split(' ').length == 2) {
          filteredList.add(countryData['name']['common']);
        }
      }
    }

    filteredCountries.value = filteredList;
    isLoading.value = false;
  }
}
