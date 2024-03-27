import 'matched_substring.dart';
import 'structured_formatting.dart';
import 'term.dart';

class PlaceAutocompleteModel {
  String? description;
  List<MatchedSubstring>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Term>? terms;
  List<String>? types;

  PlaceAutocompleteModel({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  factory PlaceAutocompleteModel.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteModel(
      description: json['description']?.toString(),
      matchedSubstrings: (json['matched_substrings'] as List<dynamic>?)
          ?.map((e) => MatchedSubstring
              .fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
                  Map<String, dynamic>.from(e)))
          .toList(),
      placeId: json['place_id']?.toString(),
      reference: json['reference']?.toString(),
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : StructuredFormatting
              .fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
                  Map<String, dynamic>.from(json['structured_formatting'])),
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) => Term
              .fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
                  Map<String, dynamic>.from(e)))
          .toList(),
      types: List<String>.from(json['types'] ?? []),
    );
  }

  Map<String, dynamic>
      toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment() {
    return {
      if (description != null) 'description': description,
      if (matchedSubstrings != null)
        'matched_substrings': matchedSubstrings
            ?.map((e) => e
                .toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment())
            .toList(),
      if (placeId != null) 'place_id': placeId,
      if (reference != null) 'reference': reference,
      if (structuredFormatting != null)
        'structured_formatting': structuredFormatting
            ?.toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(),
      if (terms != null)
        'terms': terms
            ?.map((e) => e
                .toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment())
            .toList(),
      if (types != null) 'types': types,
    };
  }
}
