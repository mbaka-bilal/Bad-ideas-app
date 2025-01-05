class Response {
  final bool success;
  final String message;
  dynamic data;

  Response({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      success: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] ?? {},
    );
  }

  @override
  String toString() {
    return 'Response{status: $success, message: $message, data: $data}';
  }
}
