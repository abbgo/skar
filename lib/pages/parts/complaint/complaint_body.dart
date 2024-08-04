import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/snackbars.dart';
import 'package:skar/models/complaint.dart';
import 'package:skar/models/complaint_product.dart';
import 'package:skar/providers/api/complaint_product.dart';
import 'package:skar/services/complaint_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ComplaintBody extends StatelessWidget {
  const ComplaintBody({
    super.key,
    required this.complaints,
    required this.isTM,
    required this.productID,
  });

  final List<Complaint> complaints;
  final bool isTM;
  final String productID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            lang.selectReasonFeedback,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              Complaint complaint = complaints[index];
              return Consumer(
                builder: (context, ref, child) => ListTile(
                  contentPadding: const EdgeInsets.only(left: 20),
                  title: Text(isTM ? complaint.textTM : complaint.textRU),
                  onTap: () async {
                    ComplaintProduct complaintProduct = ComplaintProduct(
                      complaintID: complaint.id,
                      productID: productID,
                    );

                    var params = ComplaintProductParams(
                      context: context,
                      complaintProduct: complaintProduct,
                    );

                    ResultComplaintProduct result = await ref
                        .watch(createComplaintProductProvider(params).future);

                    if (result.error == '') {
                      if (context.mounted) {
                        showSuccess(context, lang.feedbackSent);
                        Navigator.pop(context);
                      }
                    }
                    ;
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
