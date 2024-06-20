import 'dart:convert';

class TelefoneModel {
  int ddd;
  String telefone;
  TelefoneModel({
    required this.ddd,
    required this.telefone,
  });

  factory TelefoneModel.empty() {
    return TelefoneModel(
      ddd: 0,
      telefone: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory TelefoneModel.fromMap(Map<String, dynamic> map) {
    return TelefoneModel(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  factory TelefoneModel.fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return TelefoneModel.fromMap(jsonMap);
  }
}
