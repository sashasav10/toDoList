import 'dart:convert';

class ImageResult {
  ImageResult({
    required this.value,
  });

  List<Value> value;

  factory ImageResult.fromJson(Map<String, dynamic> json) => ImageResult(
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  // Map<String, dynamic> toJson() =>
  //     {
  //
  //       "value": List<dynamic>.from(value.map((x) => x.toJson()));
  //     }
}

class Instrumentation {
  Instrumentation({
    required this.type,
  });

  String type;

  factory Instrumentation.fromJson(Map<String, dynamic> json) =>
      Instrumentation(
        type: json["_type"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
      };
}

class PivotSuggestion {
  PivotSuggestion({
    required this.pivot,
    required this.suggestions,
  });

  String pivot;
  List<dynamic> suggestions;

  factory PivotSuggestion.fromJson(Map<String, dynamic> json) =>
      PivotSuggestion(
        pivot: json["pivot"],
        suggestions: List<dynamic>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pivot": pivot,
        "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
      };
}

class QueryContext {
  QueryContext({
    required this.originalQuery,
    required this.alterationDisplayQuery,
    required this.alterationOverrideQuery,
    required this.alterationMethod,
    required this.alterationType,
  });

  String originalQuery;
  String alterationDisplayQuery;
  String alterationOverrideQuery;
  String alterationMethod;
  String alterationType;

  factory QueryContext.fromJson(Map<String, dynamic> json) => QueryContext(
        originalQuery: json["originalQuery"],
        alterationDisplayQuery: json["alterationDisplayQuery"],
        alterationOverrideQuery: json["alterationOverrideQuery"],
        alterationMethod: json["alterationMethod"],
        alterationType: json["alterationType"],
      );

  Map<String, dynamic> toJson() => {
        "originalQuery": originalQuery,
        "alterationDisplayQuery": alterationDisplayQuery,
        "alterationOverrideQuery": alterationOverrideQuery,
        "alterationMethod": alterationMethod,
        "alterationType": alterationType,
      };
}

class QueryExpansion {
  QueryExpansion({
    required this.text,
    required this.displayText,
    required this.webSearchUrl,
    required this.searchLink,
    required this.thumbnail,
  });

  String text;
  String displayText;
  String webSearchUrl;
  String searchLink;
  QueryExpansionThumbnail thumbnail;

  factory QueryExpansion.fromJson(Map<String, dynamic> json) => QueryExpansion(
        text: json["text"],
        displayText: json["displayText"],
        webSearchUrl: json["webSearchUrl"],
        searchLink: json["searchLink"],
        thumbnail: QueryExpansionThumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "displayText": displayText,
        "webSearchUrl": webSearchUrl,
        "searchLink": searchLink,
        "thumbnail": thumbnail.toJson(),
      };
}

class QueryExpansionThumbnail {
  QueryExpansionThumbnail({
    required this.thumbnailUrl,
  });

  String thumbnailUrl;

  factory QueryExpansionThumbnail.fromJson(Map<String, dynamic> json) =>
      QueryExpansionThumbnail(
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnailUrl": thumbnailUrl,
      };
}

class Value {
  Value({
    required this.webSearchUrl,
    required this.name,
    required this.thumbnailUrl,
    required this.datePublished,
    required this.isFamilyFriendly,
    required this.contentUrl,
    required this.hostPageUrl,
    required this.contentSize,
    required this.encodingFormat,
    required this.hostPageDisplayUrl,
    required this.width,
    required this.height,
    required this.hostPageDiscoveredDate,
    required this.thumbnail,
    required this.imageInsightsToken,
    required this.insightsMetadata,
    required this.imageId,
    required this.accentColor,
    this.hostPageFavIconUrl,
    this.hostPageDomainFriendlyName,
    this.creativeCommons,
  });

  String webSearchUrl;
  String name;
  String thumbnailUrl;
  DateTime datePublished;
  bool isFamilyFriendly;
  String contentUrl;
  String hostPageUrl;
  String contentSize;
  EncodingFormat encodingFormat;
  String hostPageDisplayUrl;
  int width;
  int height;
  DateTime hostPageDiscoveredDate;
  ValueThumbnail thumbnail;
  String imageInsightsToken;
  InsightsMetadata insightsMetadata;
  String imageId;
  String accentColor;
  String? hostPageFavIconUrl;
  String? hostPageDomainFriendlyName;
  String? creativeCommons;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        webSearchUrl: json["webSearchUrl"],
        name: json["name"],
        thumbnailUrl: json["thumbnailUrl"],
        datePublished: DateTime.parse(json["datePublished"]),
        isFamilyFriendly: json["isFamilyFriendly"],
        contentUrl: json["contentUrl"],
        hostPageUrl: json["hostPageUrl"],
        contentSize: json["contentSize"],
        encodingFormat: encodingFormatValues.map[json["encodingFormat"]]!,
        hostPageDisplayUrl: json["hostPageDisplayUrl"],
        width: json["width"],
        height: json["height"],
        hostPageDiscoveredDate: DateTime.parse(json["hostPageDiscoveredDate"]),
        thumbnail: ValueThumbnail.fromJson(json["thumbnail"]),
        imageInsightsToken: json["imageInsightsToken"],
        insightsMetadata: InsightsMetadata.fromJson(json["insightsMetadata"]),
        imageId: json["imageId"],
        accentColor: json["accentColor"],
        hostPageFavIconUrl: json["hostPageFavIconUrl"],
        hostPageDomainFriendlyName: json["hostPageDomainFriendlyName"],
        creativeCommons: json["creativeCommons"],
      );

  Map<String, dynamic> toJson() => {
        "webSearchUrl": webSearchUrl,
        "name": name,
        "thumbnailUrl": thumbnailUrl,
        "datePublished": datePublished.toIso8601String(),
        "isFamilyFriendly": isFamilyFriendly,
        "contentUrl": contentUrl,
        "hostPageUrl": hostPageUrl,
        "contentSize": contentSize,
        "encodingFormat": encodingFormatValues.reverse[encodingFormat],
        "hostPageDisplayUrl": hostPageDisplayUrl,
        "width": width,
        "height": height,
        "hostPageDiscoveredDate": hostPageDiscoveredDate.toIso8601String(),
        "thumbnail": thumbnail.toJson(),
        "imageInsightsToken": imageInsightsToken,
        "insightsMetadata": insightsMetadata.toJson(),
        "imageId": imageId,
        "accentColor": accentColor,
        "hostPageFavIconUrl": hostPageFavIconUrl,
        "hostPageDomainFriendlyName": hostPageDomainFriendlyName,
        "creativeCommons": creativeCommons,
      };
}

enum EncodingFormat { GIF, JPEG, PNG }

final encodingFormatValues = EnumValues({
  "gif": EncodingFormat.GIF,
  "jpeg": EncodingFormat.JPEG,
  "png": EncodingFormat.PNG
});

class InsightsMetadata {
  InsightsMetadata({
    required this.pagesIncludingCount,
    required this.availableSizesCount,
    this.videoObject,
  });

  int pagesIncludingCount;
  int availableSizesCount;
  VideoObject? videoObject;

  factory InsightsMetadata.fromJson(Map<String, dynamic> json) =>
      InsightsMetadata(
        pagesIncludingCount: json["pagesIncludingCount"],
        availableSizesCount: json["availableSizesCount"],
        videoObject: json["videoObject"] == null
            ? null
            : VideoObject.fromJson(json["videoObject"]),
      );

  Map<String, dynamic> toJson() => {
        "pagesIncludingCount": pagesIncludingCount,
        "availableSizesCount": availableSizesCount,
        "videoObject": videoObject?.toJson(),
      };
}

class VideoObject {
  VideoObject({
    required this.creator,
    required this.duration,
    required this.embedHtml,
    required this.allowHttpsEmbed,
    required this.videoId,
    required this.allowMobileEmbed,
  });

  Creator creator;
  String duration;
  String embedHtml;
  bool allowHttpsEmbed;
  String videoId;
  bool allowMobileEmbed;

  factory VideoObject.fromJson(Map<String, dynamic> json) => VideoObject(
        creator: Creator.fromJson(json["creator"]),
        duration: json["duration"],
        embedHtml: json["embedHtml"],
        allowHttpsEmbed: json["allowHttpsEmbed"],
        videoId: json["videoId"],
        allowMobileEmbed: json["allowMobileEmbed"],
      );

  Map<String, dynamic> toJson() => {
        "creator": creator.toJson(),
        "duration": duration,
        "embedHtml": embedHtml,
        "allowHttpsEmbed": allowHttpsEmbed,
        "videoId": videoId,
        "allowMobileEmbed": allowMobileEmbed,
      };
}

class Creator {
  Creator({
    required this.name,
  });

  String name;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ValueThumbnail {
  ValueThumbnail({
    required this.width,
    required this.height,
  });

  int width;
  int height;

  factory ValueThumbnail.fromJson(Map<String, dynamic> json) => ValueThumbnail(
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
