class DireccionModel {
  final String direccion;
  final String complemento;
  final String departamento;
  final String municipio;

  const DireccionModel({
    required this.direccion,
    required this.complemento,
    required this.departamento,
    required this.municipio,
  });

  DireccionModel copyWith({
    String? direccion,
    String? complemento,
    String? departamento,
    String? municipio,
  }) {
    return DireccionModel(
      direccion: direccion ?? this.direccion,
      complemento: complemento ?? this.complemento,
      departamento: departamento ?? this.departamento,
      municipio: municipio ?? this.municipio,
    );
  }

  @override
  String toString() =>
      "Direccion(direccion: $direccion, complemento: $complemento, departamento: $departamento, municipio: $municipio)";
}
