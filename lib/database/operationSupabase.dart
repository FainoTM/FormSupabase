import 'package:supabase_flutter/supabase_flutter.dart';


class OperationsSupaBaseDB {
  final supabase = Supabase.instance.client;

  Future<void> insertRowSupaBase(String nome, String email, String telefone) async {
    await supabase
        .from('cadastrarPessoas')
        .insert({'nome': nome, 'email': email, 'telefone': telefone});
  }



  Future<List<Map<String, dynamic>>> getRowSupaBase() async {
    final usu = await supabase.from('cadastrarPessoas').select('nome, email');

    final List<Map<String, dynamic>> data = usu;
    return data;
  }
}