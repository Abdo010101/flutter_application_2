import 'main_text_matched_substring.dart';

class StructuredFormatting {
  String? mainText;
  List<MainTextMatchedSubstring>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  factory StructuredFormatting.fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
      Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text']?.toString(),
      mainTextMatchedSubstrings: (json['main_text_matched_substrings']
              as List<dynamic>?)
          ?.map((e) => MainTextMatchedSubstring
              .fromDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment(
                  Map<String, dynamic>.from(e)))
          .toList(),
      secondaryText: json['secondary_text']?.toString(),
    );
  }

  Map<String, dynamic>
      toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment() {
    return {
      if (mainText != null) 'main_text': mainText,
      if (mainTextMatchedSubstrings != null)
        'main_text_matched_substrings': mainTextMatchedSubstrings
            ?.map((e) => e
                .toDescriptionAlexandriaLibraryMatchedSubstringsLength14Offset0PlaceIdChIJhf5iBYrD9Rqr5yPsMsZMowAReferenceChIJhf5iBYrD9Rqr5yPsMsZMowAStructuredFormattingMainTextAlexandriaLibraryMainTextMatchedSubstringsLength14Offset0SecondaryTextTermsOffset0ValueAlexandriaLibraryOffset20ValueOffset40ValueOffset54ValueTypesTouristAttractionLibraryPointOfInterestEstablishment())
            .toList(),
      if (secondaryText != null) 'secondary_text': secondaryText,
    };
  }
}
