import 'package:flutter/material.dart';
import 'package:supabase_aula/components/customTextFormField.dart';
import 'package:supabase_aula/database/operationSupabase.dart';
import 'package:get/get.dart';
import 'package:supabase_aula/routes/AppRoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller_nome = TextEditingController();
    TextEditingController controller_email = TextEditingController();
    TextEditingController controller_telefone = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 25,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text('Cadastro Pessoa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            CustomTextFormField( campo: 'Nome Completo', controlador: controller_nome,),
            SizedBox(height: 15,),
            CustomTextFormField(campo: 'E-mail', controlador: controller_email,),
            SizedBox(height: 15,),
            CustomTextFormField(campo: 'Telefone', controlador: controller_telefone,),
            SizedBox(height: 15,),
            ElevatedButton.icon(
              onPressed: (){
                OperationsSupaBaseDB().insertRowSupaBase(controller_nome.text, controller_email.text, controller_telefone.text);
              },
              icon: Icon(Icons.add, color: Colors.white,),
              label: Text('Salvar', style: TextStyle(color: Colors.white), ),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              ),
            ),
            ElevatedButton.icon(
              onPressed: (){
                Get.offNamed(AppRoutes.LIST_USERS);
              },
              icon: Icon(Icons.search_outlined, color: Colors.white,),
              label: Text('Ver', style: TextStyle(color: Colors.white), ),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
