import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                provider.search(query);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (provider.error.isNotEmpty)
              Text(
                'Error: ${provider.error}',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            if (provider.searchResult.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Search Result: ${provider.searchResult}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            if (provider.searchResult.isEmpty && provider.error.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                )),
              ),
          ],
        ),
      ),
    );
  }
}
