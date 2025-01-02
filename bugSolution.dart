```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart'; //Import logging package

final _log = Logger('fetchData'); //Create a logger instance

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Process jsonData
    } else {
      _log.severe('Request failed with status: ${response.statusCode}.', response.body);
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } on FormatException catch (e) {
    _log.severe('JSON format exception: $e', response.body);
    rethrow; //Rethrow for upper levels to handle
  } catch (e, stacktrace) {
    _log.severe('Error fetching data: $e', null, stacktrace); //Log stack trace
    rethrow; 
  }
}
```