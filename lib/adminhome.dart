import 'package:flutter/material.dart';


class StatCard extends StatelessWidget {
  final String title;
  final String valeur;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const StatCard({
    Key? key,
    required this.title,
    required this.valeur,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor,size: 32),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            valeur,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
        ),
    );
  }
}


class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Color.fromARGB(255, 240, 218, 189),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/autres/logo.png',
            width: 140,
            height: 120,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Brother Fire",
                    style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    Text("Administrateur",
                    
                    style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 161, 160, 160), fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/autres/img5.jpg'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text("Tableau de bord Administrateur",
          style: TextStyle(
            fontSize: 20,
            color: Colors.amber[600],
            fontWeight: FontWeight.bold,
          ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StatCard(
              title: "Incients totaux",
              valeur: "42",
              icon: Icons.assignment,
              iconColor: Colors.amber,
              bgColor: Colors.white,
              ),

              StatCard(
              title: "En attente d'affectation",
              valeur: "5",
              icon: Icons.assignment_late,
              iconColor: Colors.amber,
              bgColor: Colors.white,
              ),

              StatCard(
              title: "En cours de traitement",
              valeur: "28",
              icon: Icons.punch_clock_rounded,
              iconColor: Colors.amber,
              bgColor: Colors.white,
              ),

              StatCard(
              title: "Résolus / fermés",
              valeur: "16",
              icon: Icons.check_circle,
              iconColor: Colors.amber,
              bgColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}