import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _RegistrarMostrarState();
}

class _RegistrarMostrarState extends State<HomePage> {
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerIdade = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerCpf = TextEditingController();
  final TextEditingController controllerTelefone = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              // Exemplo de lista dinâmica (se você tiver AppList e CustomTitle definidos)
              // ...AppList.listTitles.map((title) {
              //   return CustomTitle(
              //     title: title["title"],
              //     icon: title["icon"],
              //     subtitle: title["valor"],
              //   );
              // }),

              TextFormField(
                controller: controllerNome,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Nome",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 76),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: isObscure,
                controller: controllerIdade,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: "Idade",
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 76),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                obscureText: isObscure,
                controller: controllerEmail,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: "Email",
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 76),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                obscureText: isObscure,
                controller: controllerCpf,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: "CPF",
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 76),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                obscureText: isObscure,
                controller: controllerTelefone,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: "Telefone",
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 76),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                child: Text('Realizar Cadastro'),
                onPressed: () async{
                   print('Hello');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Visualizar Lista'),
                onPressed: () {
                  print('Hello');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
