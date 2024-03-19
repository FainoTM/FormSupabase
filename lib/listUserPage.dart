import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_aula/database/operationSupabase.dart';
import 'package:supabase_aula/routes/AppRoutes.dart';


class ListCadastro extends StatefulWidget {
  const ListCadastro({super.key});

  @override
  State<ListCadastro> createState() => _ListCadastroState();
}

class _ListCadastroState extends State<ListCadastro> {
  final OperationsSupaBaseDB _getCadastro = OperationsSupaBaseDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Lista de Cadastros',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton.icon(onPressed: (){
            Get.offNamed(AppRoutes.HOME);
          }, icon: Icon(Icons.arrow_back_outlined), label: Text('Home', style: TextStyle(color: Colors.white)),)
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getCadastro.getRowSupaBase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar os dados.'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]['nome']),
                  subtitle: Text('Email: ${snapshot.data![index]['email']}'),
                );
              },
            );
          } else {
            return Center(
              child: Text('Nenhum dado encontrado.'),
            );
          }
        },
      ),
    );
  }
}

