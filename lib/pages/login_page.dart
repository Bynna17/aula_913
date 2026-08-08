import 'package:aula_913/db/shared_prefs.dart';
import 'package:aula_913/db/user_dao.dart';
import 'package:aula_913/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPrefs prefs = SharedPrefs();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Entre ou cadastre-se no Airbnb',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  // focusedBorder: buildUserOutlineInputBorder(),
                  // border: buildUserOutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  // focusedBorder: buildPasswordOutlineInputBorder(),
                  // border: buildPasswordOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE41D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Cadastrar Usuário',
                  style: TextStyle(
                    color: Color(0xFFE41D56),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/*Nessa classe, basicamente, quando o usuário aperta no botão 'Entrar', é enviado usuário e senha para que o método 'login' (na classe DAO de User), que analisa se eles estão certos (se os dois estiverem corretos,
  retorna um true ( que ficará armazenado na variável booleana isAuth) ou pode retornar um false, caso tenha algo errado. Após isso, se tudo estiver ok, o usuário pode entrar na página inicial e no shared_preferencies, é marcado como 'true' (usuário logado -- para próximas vezes em que ele entrar, o app já saberá que ele está logado).
  No entanto, se algo estiver errado, aparece uma mensagem dizendo que tem algo errado no usuáro e/ou senha. */
  onPressed() async {
    String username = userController.text;
    String password = passwordController.text;

    bool isAuth = await UserDao().login(username, password);

    if (isAuth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );

      prefs.setUserStatus(true);
    } else {
      print('Usuario e/ou Senha incorreto');
    }
  }
}
