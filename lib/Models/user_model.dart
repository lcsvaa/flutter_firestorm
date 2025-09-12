import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  //Classe sempre com letra maiuscula
  final String? id;
  final String nome;
  final int idade;
  final String email;
  final String cpf;
  final String telefone;

  

  UserModel(
    //Contrutor exige todos os campos
    this.id,
    this.nome,
    this.idade,
    this.email,
    this.cpf,
    this.telefone,
  );

  Map<String, dynamic> toMap() { //Do objeto coverte para o MAP que vai para o banco de dados
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'idade': idade,
      'cpf': cpf,
    };
  }

  factory UserModel.fromMap(String id, Map<String, dynamic> map) { //COnverte do Map para o Objeto, acontece a partir de um map.
    return UserModel(
      id,
      map["nome"],
      map["idade"],
      map["email"],
      map["cpf"],
      map["telefone"],
    ); //A ordem importa
  }
}
