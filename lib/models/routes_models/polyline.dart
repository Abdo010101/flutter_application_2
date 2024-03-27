class Polyline {
  String? encodedPolyline;

  Polyline({this.encodedPolyline});

  factory Polyline.fromRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME(
      Map<String, dynamic> json) {
    return Polyline(
      encodedPolyline: json['encodedPolyline']?.toString(),
    );
  }

  Map<String, dynamic>
      toRoutesDistanceMeters772Duration165sPolylineEncodedPolylineIpkcFfichVnPJBLoFVwME() {
    return {
      if (encodedPolyline != null) 'encodedPolyline': encodedPolyline,
    };
  }
}
