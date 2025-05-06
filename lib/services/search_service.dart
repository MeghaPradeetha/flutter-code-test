import 'dart:async';
import 'dart:math';
import 'package:rxdart/rxdart.dart';

class SearchService {
  final _searchController = BehaviorSubject<String>();

  Stream<String> get searchStream => _searchController.stream
      .debounceTime(Duration(milliseconds: 500))
      .distinct()
      .switchMap((query) => _mockApiCall(query));

  void search(String query) {
    _searchController.sink.add(query);
  }

  Stream<String> _mockApiCall(String query) async* {
    if (Random().nextBool()) {
      yield 'Results for $query';
    } else {
      throw Exception('Something went wrong');
    }
  }

  void dispose() {
    _searchController.close();
  }
}
