import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omar_apps/model/product_models.dart';
import 'package:omar_apps/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var FavoritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

  // Search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedShopings = stoarge.read<List>('isFavoritesList');
    if (storedShopings != null) {
      FavoritesList =
          storedShopings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFaforites(int productId) async {
    var existingIndex =
        FavoritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      FavoritesList.removeAt(existingIndex);
      await stoarge.remove('isFavoritesList');
    } else {
      FavoritesList.add(
          productList.firstWhere((element) => element.id == productId));

      await stoarge.write('isFavoritesList', FavoritesList);
    }
  }

  bool isFavorites(int productId) {
    return FavoritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
