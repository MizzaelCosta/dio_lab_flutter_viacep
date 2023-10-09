import 'dart:convert';

class Cep {
  Cep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
    this.erro = false,
  });

  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;
  final bool erro;

  Cep copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
    bool? erro,
  }) {
    return Cep(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi ?? this.siafi,
      erro: erro ?? this.erro,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
      'erro': erro,
    };
  }

  factory Cep.erro() {
    return Cep(
        cep: '',
        logradouro: '',
        complemento: '',
        bairro: '',
        localidade: '',
        uf: '',
        ibge: '',
        gia: '',
        ddd: '',
        siafi: '',
        erro: true);
  }

  factory Cep.fromMap(Map<dynamic, dynamic> map) {
    bool erro = false;
    if (map.containsKey('erro')) {
      erro = map['erro'];
    }
    return Cep(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      ibge: map['ibge'] as String,
      gia: map['gia'] as String,
      ddd: map['ddd'] as String,
      siafi: map['siafi'] as String,
      erro: erro,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cep.fromJson(String source) =>
      Cep.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''
Cep(
  cep: $cep, 
  logradouro: $logradouro, 
  complemento: $complemento, 
  bairro: $bairro, 
  localidade: $localidade, 
  uf: $uf, 
  ibge: $ibge, 
  gia: $gia, 
  ddd: $ddd, 
  siafi: $siafi)
  ''';
  }
}
