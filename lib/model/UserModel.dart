class UserModel {
  final int id;
  final int tipo;
  final String email;
  final String senha;
  final String nome;
  final String endereco;
  final String bairro;
  final String cidade;
  final String cep;
  final String telefone;
  String turma;
  final String dataprimeiraaula;
  final String nascimento;
  final String foto;

  UserModel({this.id, this.tipo, this.email, this.senha, this.nome,
    this.endereco, this.bairro, this.cidade, this.cep, this.telefone,
    this.turma, this.dataprimeiraaula, this.nascimento, this.foto});


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      tipo: json['tipo'],
      email: json['email'],
      senha: json['senha'],
      nome: json['nome'],
      endereco: json['endereco'],
      bairro: json['bairro'],
      foto: json['foto'],
      cidade: json['cidade'],
      cep: json['cep'],
      telefone: json['telefone'],
      turma: json['turma'],
      dataprimeiraaula: json['dataprimeiraaula'],
      nascimento: json['nascimento']
    );
  }



  @override
  String toString() {
    return 'id: $id, tipo: $tipo, email: $email, senha: $senha, nome: $nome, endereco: $endereco, bairro: $bairro, cidade: $cidade, cep: $cep, telefone: $telefone, turma: $turma, dataprimeiraaula: $dataprimeiraaula, nascimento: $nascimento}';
  }
  String toStringNoId() {
    return 'tipo: $tipo, email: $email, senha: $senha, nome: $nome, endereco: $endereco, bairro: $bairro, cidade: $cidade, cep: $cep, telefone: $telefone, turma: $turma, dataprimeiraaula: $dataprimeiraaula, nascimento: $nascimento}';
  }
}