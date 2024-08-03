import 'package:flutter/material.dart';
import 'package:skar/models/complaint.dart';

class FeedbackBody extends StatelessWidget {
  const FeedbackBody({super.key, required this.complaints, required this.isTM});

  final List<Complaint> complaints;
  final bool isTM;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Seslenmanin sebabi'),
        Expanded(
          child: ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              Complaint complaint = complaints[index];
              return Text(isTM ? complaint.textTM : complaint.textRU);
            },
          ),
        ),
      ],
    );
  }
}
