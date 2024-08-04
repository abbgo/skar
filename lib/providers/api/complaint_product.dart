import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/services/complaint_product.dart';

final complaintProductApiProvider =
    Provider<ComplaintProductApiService>((ref) => ComplaintProductApiService());
