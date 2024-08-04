class ComplaintProduct {
  final String complaintID, productID;

  const ComplaintProduct({
    required this.complaintID,
    required this.productID,
  });

  factory ComplaintProduct.defaultComplaintProduct() {
    return const ComplaintProduct(complaintID: '', productID: '');
  }

  Map<String, dynamic> toJson() {
    return {'complaint_id': complaintID, 'product_id': productID};
  }
}
