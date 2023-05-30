import 'package:shoe_store/models/sneaker_model.dart';
import 'package:flutter/services.dart' as the_bundle;

class Helper {
  // Get All
  Future<List<Sneaker>> getMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleList = sneakerFromJson(data);
    return maleList;
  }

  Future<List<Sneaker>> getFemaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleList = sneakerFromJson(data);
    return femaleList;
  }

  Future<List<Sneaker>> getKidsSneakers() async {
    final data = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidsList = sneakerFromJson(data);
    return kidsList;
  }

  // Get Single -> Filter By ID
  Future<Sneaker> getMaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleList = sneakerFromJson(data);
    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }

  Future<Sneaker> getFemaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleList = sneakerFromJson(data);
    final sneaker = femaleList.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }

  Future<Sneaker> getKidsSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidsList = sneakerFromJson(data);
    final sneaker = kidsList.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }
  

}