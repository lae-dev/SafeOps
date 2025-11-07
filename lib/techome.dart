import 'package:flutter/material.dart';

class Techome extends StatefulWidget {
  const Techome({super.key});

  @override
  State<Techome> createState() => _TechomeState();
}

class _TechomeState extends State<Techome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



/*
CODE POUR LES CARTES

import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcule la largeur de la carte pour qu'elle prenne presque la moitié de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2 - 20; // 20 pour la marge totale/padding

    return Container(
      width: cardWidth,
      height: 120, // Hauteur fixe pour toutes les cartes
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:, fontSize: 14),
              ),
              Icon(icon, color: iconColor, size: 24),
            ],
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}*/







/*
CODE POUR LES INCIDENTS
class Incident {
  final String title;
  final String assignees;
  final String date;
  final String status;
  final Color statusColor;

  Incident(this.title, this.assignees, this.date, this.status, this.statusColor);
}

final List<Incident> incidents = [
  Incident('Problème réseau', 'Jean Dupont, Caroline Martin', '22 avril', 'En attente', Colors.orange),
  Incident('Panne matérielle', 'Anne Dubois, Luc Lefèvre', '21 avril', 'En cours', Colors.amber),
  Incident('Problème réseau', 'Michel Durand, Claire Leroy', '20 avril', 'Résolu', Colors.green),
  Incident('Mise à jour logicielle', 'Paul Martin, Lucas Bernard', '19 avril', 'En attente', Colors.orange),
  // Ajoutez d'autres incidents si nécessaire pour tester le scroll
];


 */










/*
STRUTURE TOTALE

import 'package:flutter/material.dart';

// --- 1. Classes de Données (Peut être déplacé dans un fichier séparé si vous le souhaitez) ---

class Incident {
  final String title;
  final String assignees;
  final String date;
  final String status;
  final Color statusColor;

  Incident(this.title, this.assignees, this.date, this.status, this.statusColor);
}

final List<Incident> incidents = [
  Incident('Problème réseau', 'Jean Dupont, Caroline Martin', '22 avril', 'En attente', Colors.orange),
  Incident('Panne matérielle', 'Anne Dubois, Luc Lefèvre', '21 avril', 'En cours', Colors.amber),
  Incident('Problème réseau', 'Michel Durand, Claire Leroy', '20 avril', 'Résolu', Colors.green),
  Incident('Mise à jour logicielle', 'Paul Martin, Lucas Bernard', '19 avril', 'En attente', Colors.orange),
];


// --- 2. Widget StatCard (Peut être déplacé dans un fichier séparé) ---

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Ajusté pour prendre en compte le padding du Column parent
    final cardWidth = screenWidth / 2 - 24; 

    return Container(
      width: cardWidth,
      height: 120,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:,
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}


// --- 3. La page principale Adminhome (votre fichier principal) ---

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Votre AppBar existante
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Color.fromARGB(255, 240, 218, 189),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:,
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
      // --- Le Body ajouté ici ---
      body: Column(
        children: [
          // --- Partie 1: Les cartes (Statique) ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 15.0, // Espace horizontal
              runSpacing: 15.0, // Espace vertical
              children: [
                StatCard(
                  title: 'Incidents totaux',
                  value: '42',
                  icon: Icons.assignment,
                  iconColor: Colors.orange,
                ),
                StatCard(
                  title: "En attente d'affectation",
                  value: '5',
                  icon: Icons.assignment_late,
                  iconColor: Colors.red,
                ),
                StatCard(
                  title: 'En cours de traitement',
                  value: '28',
                  icon: Icons.assignment_turned_in,
                  iconColor: Colors.blue,
                ),
                StatCard(
                  title: 'Résolus / Fermés',
                  value: '16',
                  icon: Icons.check_circle,
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
          
          // Titre "Incidents récents"
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Incidents récents',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // --- Partie 2: La liste défilante (Expanded + ListView) ---
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: incidents.length,
              itemBuilder: (context, index) {
                final incident = incidents[index];
                return ListTile(
                  title: Text(incident.title),
                  subtitle: Text(incident.assignees),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // --- Vous pouvez ajouter votre BottomNavigationBar ici si vous le souhaitez ---
      // bottomNavigationBar: BottomNavigationBar(...), 
    );
  }
}


 */
