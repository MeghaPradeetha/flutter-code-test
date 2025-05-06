import 'package:flutter/material.dart';
import '../services/search_service.dart';

class SearchProvider with ChangeNotifier {
  final SearchService _searchService = SearchService();
  String _searchResult = '';
  String _error = '';

  String get searchResult => _searchResult;
  String get error => _error;

  // Search function, connected with RxDart stream
  void search(String query) {
    _searchService.search(query);
    _searchService.searchStream.listen(
      (result) {
        _searchResult = result;
        _error = '';
        notifyListeners();
      },
      onError: (e) {
        _error = e.toString();
        _searchResult = '';
        notifyListeners();
      },
    );
  }

  void dispose() {
    _searchService.dispose();
    super.dispose();
  }
}
