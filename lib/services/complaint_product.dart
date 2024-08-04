import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/complaint_product.dart';
import 'package:http/http.dart' as http;

class ComplaintProductApiService {
  // create complaint product -------------------------------------------------------
  Future<ResultComplaintProduct> createComplaintProduct({
    required ComplaintProduct complaintProduct,
  }) async {
    Uri uri = Uri.parse('$apiUrl/complaint-products');

    try {
      http.Response response = await http.post(
        uri,
        body: json.encode(complaintProduct.toJson()),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['message'] == null) {
          return const ResultComplaintProduct(message: '', error: '');
        }

        return ResultComplaintProduct(message: jsonData['message'], error: '');
      }

      return const ResultComplaintProduct(error: 'some error');
    } catch (e) {
      rethrow;
    }
  }
}

class ResultComplaintProduct extends Equatable {
  final String? message;
  final String error;

  const ResultComplaintProduct({this.message, required this.error});

  factory ResultComplaintProduct.defaultResult() {
    return const ResultComplaintProduct(message: null, error: '');
  }

  @override
  List<Object?> get props => [message, error];
}

class ComplaintProductParams extends Equatable {
  final ComplaintProduct? complaintProduct;
  final BuildContext? context;

  const ComplaintProductParams({this.complaintProduct, this.context});

  @override
  List<Object?> get props => [complaintProduct, context];
}
