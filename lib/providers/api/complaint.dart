import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/models/complaint.dart';
import 'package:skar/services/complaint.dart';

final complaintApiProvider =
    Provider<ComplaintApiService>((ref) => ComplaintApiService());

var fetchComplaintsProvider = FutureProvider.autoDispose<ResultComplaint>(
  (ref) async {
    ResultComplaint result = ResultComplaint.defaultResult();

    try {
      List<Complaint> complaints =
          await ref.read(complaintApiProvider).fetchComplaints();

      result = ResultComplaint(complaints: complaints, error: '');
    } catch (e) {
      result = ResultComplaint(error: e.toString());
    }

    return result;
  },
);
