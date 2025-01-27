import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlantGrid {
  String name;
  String image;
  String commonNames;
  String scientificNames;
  String family;
  String genus;
  String species;
  String season;
  String desc;
  String producerStates;
  String sownMonth;
  String harvestMonth;
  String avgRainfall;
  String avgTemp;
  String pricePerTonn;
  String preferredSoil;
  String phRange;
  String moistureRange;
  String seedLink;
  String sowingMethod;
  String sowingDepth;
  String sowingDistBwtSeeds;
  String sowingDistBwtRows;
  String germinationTemp;
  String harvestTime;
  String plantingVideo;

  String get videoThumbnail => getThumbnail();

  String getThumbnail() {
    String id = plantingVideo.split('=').last;

    String link = 'http://img.youtube.com/vi/$id/0.jpg';

    return link;
  }

  PlantGrid({
    required this.name,
    required this.image,
    required this.commonNames,
    required this.scientificNames,
    required this.family,
    required this.genus,
    required this.species,
    required this.season,
    required this.desc,
    required this.producerStates,
    required this.sownMonth,
    required this.harvestMonth,
    required this.avgRainfall,
    required this.avgTemp,
    required this.pricePerTonn,
    required this.preferredSoil,
    required this.phRange,
    required this.moistureRange,
    required this.seedLink,
    required this.sowingMethod,
    required this.sowingDepth,
    required this.sowingDistBwtSeeds,
    required this.sowingDistBwtRows,
    required this.germinationTemp,
    required this.harvestTime,
    required this.plantingVideo,
  });

  PlantGrid copyWith({
    String? name,
    String? image,
    String? commonNames,
    String? scientificNames,
    String? family,
    String? genus,
    String? species,
    String? season,
    String? desc,
    String? producerStates,
    String? sownMonth,
    String? harvestMonth,
    String? avgRainfall,
    String? avgTemp,
    String? pricePerTonn,
    String? preferredSoil,
    String? phRange,
    String? moistureRange,
    String? seedLink,
    String? sowingMethod,
    String? sowingDepth,
    String? sowingDistBwtSeeds,
    String? sowingDistBwtRows,
    String? germinationTemp,
    String? harvestTime,
    String? plantingVideo,
  }) {
    return PlantGrid(
      name: name ?? this.name,
      image: image ?? this.image,
      commonNames: commonNames ?? this.commonNames,
      scientificNames: scientificNames ?? this.scientificNames,
      family: family ?? this.family,
      genus: genus ?? this.genus,
      species: species ?? this.species,
      season: season ?? this.season,
      desc: desc ?? this.desc,
      producerStates: producerStates ?? this.producerStates,
      sownMonth: sownMonth ?? this.sownMonth,
      harvestMonth: harvestMonth ?? this.harvestMonth,
      avgRainfall: avgRainfall ?? this.avgRainfall,
      avgTemp: avgTemp ?? this.avgTemp,
      pricePerTonn: pricePerTonn ?? this.pricePerTonn,
      preferredSoil: preferredSoil ?? this.preferredSoil,
      phRange: phRange ?? this.phRange,
      moistureRange: moistureRange ?? this.moistureRange,
      seedLink: seedLink ?? this.seedLink,
      sowingMethod: sowingMethod ?? this.sowingMethod,
      sowingDepth: sowingDepth ?? this.sowingDepth,
      sowingDistBwtSeeds: sowingDistBwtSeeds ?? this.sowingDistBwtSeeds,
      sowingDistBwtRows: sowingDistBwtRows ?? this.sowingDistBwtRows,
      germinationTemp: germinationTemp ?? this.germinationTemp,
      harvestTime: harvestTime ?? this.harvestTime,
      plantingVideo: plantingVideo ?? this.plantingVideo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'commonNames': commonNames,
      'scientificNames': scientificNames,
      'family': family,
      'genus': genus,
      'species': species,
      'season': season,
      'desc': desc,
      'producerStates': producerStates,
      'sownMonth': sownMonth,
      'harvestMonth': harvestMonth,
      'avgRainfall': avgRainfall,
      'avgTemp': avgTemp,
      'pricePerTonn': pricePerTonn,
      'preferredSoil': preferredSoil,
      'phRange': phRange,
      'moistureRange': moistureRange,
      'seedLink': seedLink,
      'sowingMethod': sowingMethod,
      'sowingDepth': sowingDepth,
      'sowingDistBwtSeeds': sowingDistBwtSeeds,
      'sowingDistBwtRows': sowingDistBwtRows,
      'germinationTemp': germinationTemp,
      'harvestTime': harvestTime,
      'plantingVideo': plantingVideo,
    };
  }

  factory PlantGrid.fromMap(Map<String, dynamic> map) {
    print(map);
    return PlantGrid(
      name: map['cropName'] as String,
      image: map['image'] as String,
      commonNames: map['common_names'] as String,
      scientificNames: map['scientific_name'] as String,
      family: map['family'] as String,
      genus: map['genus'] as String,
      species: map['species'] as String,
      season: map['season'] as String,
      desc: map['desc'] as String,
      producerStates: map['producer_states'] as String,
      sownMonth: map['sown_month'] as String,
      harvestMonth: map['harvest_month'] as String,
      avgRainfall: map['avg_rainfall'] as String,
      avgTemp: map['avg_temp'] as String,
      pricePerTonn: map['price_per_tonn'] as String,
      preferredSoil: map['preferred_soil '] as String,
      phRange: map['ideal_soil_ph_range'] as String,
      moistureRange: map['average_moisture_range'] as String,
      seedLink: map['seed_link'] as String,
      sowingMethod: map['sowing_method'] as String,
      sowingDepth: map['sowing_depth'] as String,
      sowingDistBwtSeeds: map['sowing_distance_between_seeds'] as String,
      sowingDistBwtRows: map['sowing_distance_between_rows'] as String,
      germinationTemp: map['germination_temperature'] as String,
      harvestTime: map['harvest_time'] as String,
      plantingVideo: map['planting_link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantGrid.fromJson(String source) =>
      PlantGrid.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlantGrid(name: $name, image: $image, commonNames: $commonNames, scientificNames: $scientificNames, family: $family, genus: $genus, species: $species, season: $season, desc: $desc, producerStates: $producerStates, sownMonth: $sownMonth, harvestMonth: $harvestMonth, avgRainfall: $avgRainfall, avgTemp: $avgTemp, pricePerTonn: $pricePerTonn, preferredSoil: $preferredSoil, phRange: $phRange, moistureRange: $moistureRange, seedLink: $seedLink, sowingMethod: $sowingMethod, sowingDepth: $sowingDepth, sowingDistBwtSeeds: $sowingDistBwtSeeds, sowingDistBwtRows: $sowingDistBwtRows, germinationTemp: $germinationTemp, harvestTime: $harvestTime, plantingVideo: $plantingVideo)';
  }

  @override
  bool operator ==(covariant PlantGrid other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.commonNames == commonNames &&
        other.scientificNames == scientificNames &&
        other.family == family &&
        other.genus == genus &&
        other.species == species &&
        other.season == season &&
        other.desc == desc &&
        other.producerStates == producerStates &&
        other.sownMonth == sownMonth &&
        other.harvestMonth == harvestMonth &&
        other.avgRainfall == avgRainfall &&
        other.avgTemp == avgTemp &&
        other.pricePerTonn == pricePerTonn &&
        other.preferredSoil == preferredSoil &&
        other.phRange == phRange &&
        other.moistureRange == moistureRange &&
        other.seedLink == seedLink &&
        other.sowingMethod == sowingMethod &&
        other.sowingDepth == sowingDepth &&
        other.sowingDistBwtSeeds == sowingDistBwtSeeds &&
        other.sowingDistBwtRows == sowingDistBwtRows &&
        other.germinationTemp == germinationTemp &&
        other.harvestTime == harvestTime &&
        other.plantingVideo == plantingVideo;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        commonNames.hashCode ^
        scientificNames.hashCode ^
        family.hashCode ^
        genus.hashCode ^
        species.hashCode ^
        season.hashCode ^
        desc.hashCode ^
        producerStates.hashCode ^
        sownMonth.hashCode ^
        harvestMonth.hashCode ^
        avgRainfall.hashCode ^
        avgTemp.hashCode ^
        pricePerTonn.hashCode ^
        preferredSoil.hashCode ^
        phRange.hashCode ^
        moistureRange.hashCode ^
        seedLink.hashCode ^
        sowingMethod.hashCode ^
        sowingDepth.hashCode ^
        sowingDistBwtSeeds.hashCode ^
        sowingDistBwtRows.hashCode ^
        germinationTemp.hashCode ^
        harvestTime.hashCode ^
        plantingVideo.hashCode;
  }
}
