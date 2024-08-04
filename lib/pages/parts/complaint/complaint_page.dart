import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/helpers/static_data.dart';
import 'package:skar/models/complaint.dart';
import 'package:skar/pages/parts/error.dart';
import 'package:skar/pages/parts/complaint/complaint_body.dart';
import 'package:skar/providers/api/complaint.dart';
import 'package:skar/providers/local_storadge/setting.dart';
import 'package:skar/services/complaint.dart';
import 'package:skar/styles/colors.dart';

class ComplaintPage extends ConsumerWidget {
  const ComplaintPage({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);
    AsyncValue<ResultComplaint> complaints = ref.watch(fetchComplaintsProvider);
    bool isTM = ref.watch(langProvider) == 'tr';

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isLightBrightness ? Colors.white : dialogColorDarkTheme,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: complaints.when(
        data: (response) {
          if (response.error != '') {
            return const SomeThingWrong();
          }

          List<Complaint> complaints = response.complaints!;
          return ComplaintBody(
            complaints: complaints,
            isTM: isTM,
            productID: productID,
          );
        },
        error: (error, stackTrace) => errorMethod(error),
        loading: () => loadWidget,
      ),
    );
  }
}
