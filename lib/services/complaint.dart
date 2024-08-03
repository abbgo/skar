import 'dart:convert';

import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/complaint.dart';
import 'package:http/http.dart' as http;

class ComplaintApiService {
  // fetchComplaints -----------------------------------------------
  Future<List<Complaint>> fetchComplaints() async {
    final Uri uri = Uri.parse('$apiUrl/complaints');

    try {
      http.Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['complaints'] == null) return [];

        var list = jsonData['complaints'] as List;
        var complaints = list
            .map<Complaint>((propJson) => Complaint.fromJson(propJson))
            .toList();
        return complaints;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
