import 'package:flutter/foundation.dart';
import '../model/favorite_model.dart';
import '../model/helper/db_helper.dart';

class DbProvider extends ChangeNotifier {
  List<FavoriteModel> _favoriteModels = [];
  late DbHelper _dbHelper;

  List<FavoriteModel> get favoriteModels => _favoriteModels;
  int get favoriteLength => _favoriteModels.length;

  DbProvider() {
    _dbHelper = DbHelper();
    getAllFavorite();
  }

  void getAllFavorite() async {
    _favoriteModels = await _dbHelper.getFavorite();
    notifyListeners();
  }

  Future<void> addFavorite(FavoriteModel favModel) async {
    await _dbHelper.insertFavorite(favModel);
    getAllFavorite();
  }

  Future<void> deleteFavorite(String name) async {
    await _dbHelper.deleteFavorite(name);
    getAllFavorite();
  }
}
