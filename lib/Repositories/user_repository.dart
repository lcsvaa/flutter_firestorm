import 'package:flutterfirestorm/Models/user_model.dart';
import 'package:flutterfirestorm/services/firebase_service.dart';

class UserRepository {//Os dados do usario serao criado para gravar a sua informacoes nessa classe
  final FirebaseService _firebaseService; // _ "underline " é ENCAPSULAMENTO que sera usado somente nesta pagina

  UserRepository(this._firebaseService);

    Future<String> createUser(UserModel? user) async{
      if(user == null){
        print("Objeto usuário não pode ser nulo");
        return "";
      }
      return await _firebaseService.create(user.toMap());
    }

    //Busca o usuario e retorna ele, caso nao encontrar o usuario ele irá retorna nulo
    Future<UserModel?> getUserById(String id) async{
      Map<String, dynamic>? userFound = await _firebaseService.readById(id);

      if (userFound == null) {
        return null;
      }
      UserModel user = UserModel.fromMap(id, userFound);
      return user;
    }

    //Verificar Toda a lista de usuarios
    Future<List<UserModel>> getAllUsers() async{
      final listAll = await _firebaseService.readAll();
      List<UserModel> listUsers = listAll
      .map((map) => UserModel.fromMap(map['id'], map))
      .toList();
      
      return listUsers;
    }

    //Deletar usuario
    Future<void> deleteUser(String id) async{
        await _firebaseService.delete(id);
    }

    //Update usuario
    Future<void>updateUser(UserModel user) async{
      await _firebaseService.update(user.id!, user.toMap()); //! exclamação GARANTE a chegada do ID (confia)
    }
}