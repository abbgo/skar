import 'package:flutter/material.dart';
import 'package:skar/models/complaint.dart';

class ComplaintBody extends StatelessWidget {
  const ComplaintBody(
      {super.key, required this.complaints, required this.isTM});

  final List<Complaint> complaints;
  final bool isTM;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text(
            'Seslenmanin sebabini saylan',
            style: TextStyle(fontWeight: FontWeight.bold),
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
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: Text(isTM ? complaint.textTM : complaint.textRU),
                onTap: () {
                  print('seslenme ugradyldy');
                  // show snackbar gosaly
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
