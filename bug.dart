```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle non-200 status code
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    // Handle exceptions
    print('Error fetching data: $e');
    //Consider rethrowing the error or handling it more gracefully for production app
    rethrow;
  }
}
```