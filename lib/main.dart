import 'package:flutter/material.dart';
import 'connect.dart';

void main() {
  runApp(const MyApp());
}

// Mon widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 249, 191, 115),
      ),
      debugShowCheckedModeBanner: false, // je désactive la bannière debug
      home:
          const OnboardingScreen(), // je définis mon onboarding comme première page
    );
  }
}

// Classe OnboardingInfo : je regroupe toutes les infos d'une page ici
class OnboardingInfo {
  final String image;
  final String title;
  final String description;
  final Color bgColor;

  OnboardingInfo({
    required this.image,
    required this.title,
    required this.description,
    required this.bgColor, // Ici : je définis la couleur de fond pour cette page, chaque instance représente une page complète de mon onboarding
  });
}

// Liste des 4 pages : je crée toutes mes pages ici avec leurs images, titres, descriptions et couleurs
final List<OnboardingInfo> onboardingPages = [
  OnboardingInfo(
    image: 'assets/onboarding/img1.png',
    title: 'Bienvenue sur SafeOps !',
    description:
        'Votre application de gestion des incidents.\nSécurisez vos opérations et gardez le contrôle en un seul endroit.',
    bgColor: const Color.fromARGB(255, 245, 222, 222),
  ),
  OnboardingInfo(
    image: 'assets/onboarding/img2.png',
    title: 'Déclarez vos incidents facilement',
    description:
        'Renseignez les détails de chaque incident grâce à un formulaire intuitif.\nUn suivi précis commence ici.',
    bgColor: const Color.fromARGB(255, 221, 239, 221),
  ),
  OnboardingInfo(
    image: 'assets/onboarding/img3.png',
    title: 'Suivez vos incidents',
    description: 'et observez leur resolution par des Techniciens compétents.',
    bgColor: const Color.fromARGB(255, 230, 243, 249),
  ),
  OnboardingInfo(
    image: 'assets/onboarding/img4.png',
    title: 'Commencez',
    description: 'dès maintenant et facilitez la gestion de vos incidnets',
    bgColor: const Color.fromARGB(255, 247, 234, 216),
  ),
];

// Mon StatefulWidget pour l’onboarding
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller =
      PageController(); // je crée un PageController pour gérer le défilement des pages
  int _currentPage = 0; // je garde en mémoire l’index de la page active

  @override
  void dispose() {
    _controller
        .dispose(); // je libère le controller pour éviter les fuites mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // je superpose les éléments pour pouvoir placer Skip et Back en haut et les dots/Next en bas
        children: [
          PageView.builder(
            controller: _controller,
            itemCount:
                onboardingPages.length, // je définis le nombre total de pages
            onPageChanged: (index) {
              setState(() {
                _currentPage =
                    index; // je mets à jour l’index de la page active
              });
            },
            itemBuilder: (context, index) {
              final page =
                  onboardingPages[index]; // je récupère les infos de la page actuelle

              return Container(
                color: page
                    .bgColor, // je mets la couleur de fond spécifique à cette page
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      page.image,
                      height: 250,
                    ), // je montre l’image de la page
                    const SizedBox(height: 30),
                    Text(
                      page.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center, // je centre le titre
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        page.description,
                        style: const TextStyle(fontSize: 19),
                        textAlign:
                            TextAlign.center, // je centre aussi la description
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Skip et Back en haut
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back
                if (_currentPage != 0)
                  IconButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      ); // je passe à la page précédente avec animation
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 35,
                    ),
                  )
                else
                  const SizedBox(
                    width: 50,
                  ), // je garde l’espace pour aligner le Skip
                // Skip
                TextButton(
                  onPressed: () {
                    _controller.jumpToPage(
                      3,
                    ); // je saute directement à la dernière page
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 203, 22, 235),
                  ),
                  child: const Text("Skip"),
                ),
              ],
            ),
          ),

          // Dots + Next / Commencer en bas
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Dots indicateurs
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingPages.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.black
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ), // je change la couleur selon la page active
                    );
                  }),
                ),
                const SizedBox(height: 15),
                // Next ou Commencer
                Align(
                  alignment: Alignment.bottomRight,
                  child: _currentPage != 3
                      ? IconButton(
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            ); // je passe à la page suivante
                          },
                          icon: const Icon(Icons.double_arrow, size: 40),
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Connect(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color.fromARGB(
                              255,
                              203,
                              22,
                              235,
                            ),
                          ),
                          child: const Text("Commencer !"),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
