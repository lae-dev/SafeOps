import 'package:flutter/material.dart';
import 'adminhome.dart';
import 'userhome.dart';
import 'techome.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  //je simumle un faux test pour tester mes redirections avec de fausses variables
  Map<String, String> fakeroles = {
    'lae@gmail.com': 'admin',
    'madi@gmail.com': 'tech',
    'papa@gmail.com': 'user',
  };
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); //Pour valider le formulaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 218, 189),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 218, 189),
        title: Text(
          "Connexion",
          style: TextStyle(
            color: const Color.fromARGB(255, 112, 110, 110),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "E-mail",
                      hintText: "Saisissez votre email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer votre E-mail";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 45),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Mot de passe",
                      hintText: "Entrez votre mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veullez entrer le mot de passe ";
                      }
                      if (value.length < 6) {
                        return "Mot de passe doit contenir au moins 6 caractères";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Mot de passe oublié ?"),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        //recuperer l'email
                        String email = _emailController.text.trim();
                        // Redirection en fonction des roles.
                        String role = fakeroles[email] ?? 'user';
                        Widget targetPage = const Adminhome();

                        if (role == 'tech') {
                          targetPage = Techome();
                        }
                        if (role == 'user') {
                          targetPage = Userhome();
                        }
                        //Ici je gère la redirection
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => targetPage),
                        );
                        if (_formKey.currentState!.validate()) {
                          //Verifer si tous les chmamps sont valides.
                          print('E-mail: ${_emailController.text}');
                          print('Mot de passe: ${_passwordController.text}');
                        }
                      },
                      child: Text(
                        "Se Connecter",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
