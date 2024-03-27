class MatchedSubstring {
  num? length;
  num? offset;

  MatchedSubstring({this.length, this.offset});

  factory MatchedSubstring.fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
      Map<String, dynamic> json) {
    return MatchedSubstring(
      length: num.tryParse(json['length'].toString()),
      offset: num.tryParse(json['offset'].toString()),
    );
  }

  Map<String, dynamic>
      toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment() {
    return {
      if (length != null) 'length': length,
      if (offset != null) 'offset': offset,
    };
  }
}
