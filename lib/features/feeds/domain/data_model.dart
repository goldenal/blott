// To parse this JSON data, do
//
//     final feedsData = feedsDataFromJson(jsonString);

import 'dart:convert';

List<FeedsData> feedsDataFromJson(String str) => List<FeedsData>.from(json.decode(str).map((x) => FeedsData.fromJson(x)));

String feedsDataToJson(List<FeedsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedsData {
    String? category;
    int? datetime;
    String? headline;
    int? id;
    String? image;
    String? related;
    String? source;
    String? summary;
    String? url;

    FeedsData({
        this.category,
        this.datetime,
        this.headline,
        this.id,
        this.image,
        this.related,
        this.source,
        this.summary,
        this.url,
    });

    factory FeedsData.fromJson(Map<String, dynamic> json) => FeedsData(
        category: json["category"],
        datetime: json["datetime"],
        headline: json["headline"],
        id: json["id"],
        image: json["image"],
        related: json["related"],
        source: json["source"],
        summary: json["summary"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "datetime": datetime,
        "headline": headline,
        "id": id,
        "image": image,
        "related": related,
        "source": source,
        "summary": summary,
        "url": url,
    };
}
