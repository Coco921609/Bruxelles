import 'package:flutter/material.dart';

class PlacePoelaertPage extends StatelessWidget {
  const PlacePoelaertPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Couleurs de fond pour éviter le "tout blanc"
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      // L'AppBar est forcée en noir pour un look élégant en haut
      appBar: AppBar(
        title: const Text("Place Poelaert 🌅"),
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Active la sélection, la copie et la recherche web
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SOMBRE (Fixe pour éviter l'éblouissement) ---
              _buildDarkHeroHeader(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- SECTION : LES COULEURS DU CIEL ---
                    _buildSectionTitle("Les Couleurs du Ciel 🎨", Icons.palette),

                    _buildSkySeasonCard(
                      season: "Printemps & Été",
                      colorName: "Rose & Orange Éclatant",
                      desc: "Le ciel devient rose bonbon puis orange vif. Le soleil se couche très tard (vers 22h en juin).",
                      gradientColors: [Colors.pinkAccent, Colors.orangeAccent],
                      icon: Icons.wb_sunny,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    _buildSkySeasonCard(
                      season: "Automne",
                      colorName: "Violet & Rouge Feu",
                      desc: "Les plus beaux couchers de soleil. Le ciel prend des teintes dramatiques et rouges intenses.",
                      gradientColors: [Colors.purpleAccent, Colors.redAccent],
                      icon: Icons.auto_awesome,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    _buildSkySeasonCard(
                      season: "Hiver",
                      colorName: "Bleu Glacé & Or",
                      desc: "Le ciel est très pur et bleu clair, avec un soleil doré qui descend dès 16h30.",
                      gradientColors: [Colors.blueAccent, Colors.amberAccent],
                      icon: Icons.ac_unit,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    // --- SECTION VUE & PANORAMA ---
                    _buildSectionTitle("La Vue Panoramique 🔭", Icons.visibility),
                    _buildExperienceCard(
                      title: "Belvédère de Bruxelles",
                      description: "Une vue imprenable sur les toits, la flèche de l'Hôtel de Ville et l'Atomium qui brille au loin.",
                      color: Colors.blueAccent,
                      icon: Icons.map,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    // --- QUE FAIRE AUX ALENTOURS ---
                    _buildSectionTitle("Aux alentours 🚶‍♂️", Icons.explore),
                    _buildInfoBox(
                      title: "L'Ascenseur des Marolles",
                      desc: "Descendez gratuitement vers le quartier des antiquaires et l'ambiance populaire.",
                      icon: Icons.elevator,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoBox(
                      title: "Palais de Justice",
                      desc: "Juste derrière vous, le géant de pierre. Entrée gratuite en semaine.",
                      icon: Icons.gavel,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header qui reste foncé même en mode clair
  Widget _buildDarkHeroHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F0F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF0F0F0F), Color(0xFF2C1A4D)], // Dégradé noir vers violet nuit
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.wb_twilight, color: Colors.amber, size: 40),
          SizedBox(height: 15),
          Text(
            "MOMENT PANORAMIQUE",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
          ),
          SizedBox(height: 10),
          Text(
            "Observez le changement de couleur du ciel au-dessus de la capitale.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSkySeasonCard({
    required String season,
    required String colorName,
    required String desc,
    required List<Color> gradientColors,
    required IconData icon,
    required bool isDark,
    required Color cardColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(1.2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: gradientColors.map((c) => c.withOpacity(0.4)).toList()),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradientColors),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(season, style: TextStyle(fontSize: 11, color: isDark ? Colors.grey : Colors.grey.shade600, fontWeight: FontWeight.bold)),
                  Text(colorName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: gradientColors[0])),
                  const SizedBox(height: 4),
                  Text(desc, style: TextStyle(color: isDark ? Colors.white70 : const Color(0xFF444444), fontSize: 12, height: 1.3)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(children: [
        Icon(icon, color: Colors.amber.shade700, size: 20),
        const SizedBox(width: 10),
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber.shade800))
      ]),
    );
  }

  Widget _buildExperienceCard({
    required String title,
    required String description,
    required Color color,
    required IconData icon,
    required bool isDark,
    required Color cardColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
          boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Icon(icon, color: color, size: 22), const SizedBox(width: 10), Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 10),
          Text(description, style: TextStyle(color: isDark ? Colors.white70 : const Color(0xFF444444), fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    required String title,
    required String desc,
    required IconData icon,
    required bool isDark,
    required Color cardColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
          boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5)]
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber.shade700, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isDark ? Colors.white : Colors.black87)),
              Text(desc, style: TextStyle(color: isDark ? Colors.grey : Colors.grey.shade600, fontSize: 12)),
            ]),
          ),
        ],
      ),
    );
  }
}