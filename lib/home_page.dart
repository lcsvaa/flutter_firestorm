import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _idadeController = TextEditingController();

  final CollectionReference usuarios =
      FirebaseFirestore.instance.collection('usuarios');

  Future<void> _cadastrarUsuario() async {
    if (_nomeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _idadeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos")),
      );
      return;
    }

    try {
      await usuarios.add({
        "nome": _nomeController.text,
        "email": _emailController.text,
        "idade": int.tryParse(_idadeController.text) ?? 0,
        "dataCadastro": Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário cadastrado com sucesso ✅")),
      );

      _nomeController.clear();
      _emailController.clear();
      _idadeController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao cadastrar: $e")),
      );
    }
  }

  void _abrirLista() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ListaUsuariosPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Usuário")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Idade",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _cadastrarUsuario,
                  child: const Text("Cadastrar"),
                ),
                ElevatedButton(
                  onPressed: _abrirLista,
                  child: const Text("Visualizar Lista"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ListaUsuariosPage extends StatelessWidget {
  const ListaUsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference usuarios =
        FirebaseFirestore.instance.collection('usuarios');

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Usuários")),
      body: StreamBuilder<QuerySnapshot>(
        stream: usuarios.orderBy('dataCadastro', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;

          if (data.isEmpty) {
            return const Center(child: Text("Nenhum usuário cadastrado"));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final doc = data[index];
              final usuario = doc.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(usuario['nome'] ?? ""),
                subtitle: Text(
                    "Email: ${usuario['email'] ?? ""} | Idade: ${usuario['idade'] ?? ""}"),
              );
            },
          );
        },
      ),
    );
  }
}
