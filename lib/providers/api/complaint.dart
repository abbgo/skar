import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/services/complaint.dart';

final complaintApiProvider =
    Provider<ComplaintApiService>((ref) => ComplaintApiService());
