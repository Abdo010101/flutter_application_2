class Term {
  num? offset;
  String? value;

  Term({this.offset, this.value});

  factory Term.fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
      Map<String, dynamic> json) {
    return Term(
      offset: num.tryParse(json['offset'].toString()),
      value: json['value']?.toString(),
    );
  }

  Map<String, dynamic>
      toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment() {
    return {
      if (offset != null) 'offset': offset,
      if (value != null) 'value': value,
    };
  }
}
