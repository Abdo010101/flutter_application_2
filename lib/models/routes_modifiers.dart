class RoutesModifiers {
  bool? avoidTolls;
  bool? avoidHighways;
  bool? avoidFerries;

  RoutesModifiers(
      {this.avoidTolls = false,
      this.avoidHighways = false,
      this.avoidFerries = false});

  factory RoutesModifiers.fromJson(Map<String, dynamic> json) {
    return RoutesModifiers(
      avoidTolls: json['avoidTolls']?.toString().contains("true"),
      avoidHighways: json['avoidHighways']?.toString().contains("true"),
      avoidFerries: json['avoidFerries']?.toString().contains("true"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (avoidTolls != null) 'avoidTolls': avoidTolls,
      if (avoidHighways != null) 'avoidHighways': avoidHighways,
      if (avoidFerries != null) 'avoidFerries': avoidFerries,
    };
  }
}
