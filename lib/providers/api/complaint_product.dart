import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/providers/internet_connection.dart';
import 'package:skar/services/complaint_product.dart';

final complaintProductApiProvider =
    Provider<ComplaintProductApiService>((ref) => ComplaintProductApiService());

var createComplaintProductProvider = FutureProvider.autoDispose
    .family<ResultComplaintProduct, ComplaintProductParams>(
  (ref, arg) async {
    ResultComplaintProduct result = ResultComplaintProduct.defaultResult();

    try {
      bool hasInternert =
          await ref.read(checkInternetConnProvider(arg.context!).future);

      if (hasInternert) {
        ResultComplaintProduct resultProduct = await ref
            .read(complaintProductApiProvider)
            .createComplaintProduct(complaintProduct: arg.complaintProduct!);

        if (resultProduct.error == 'some error') {
          if (arg.context!.mounted) showSomeErr(arg.context!);
        }

        result = resultProduct;
      }
    } catch (e) {
      result = ResultComplaintProduct(error: e.toString());
    }

    return result;
  },
);
