import 'package:flutter/material.dart';

class PlacePoelaertPage extends StatelessWidget {
  const PlacePoelaertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
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
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- IMAGE PANORAMIQUE R ---
              _buildMainImage('assets/R.jpg'),

              // --- HEADER SOMBRE ---
              _buildDarkHeroHeader(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      desc: "Les plus beaux couchers de soleil. Le ciel prend des teintes dramatiques.",
                      gradientColors: [Colors.purpleAccent, Colors.redAccent],
                      icon: Icons.auto_awesome,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    _buildSkySeasonCard(
                      season: "Hiver",
                      colorName: "Bleu Glacé & Or",
                      desc: "Ciel pur et soleil doré qui descend dès 16h30.",
                      gradientColors: [Colors.blueAccent, Colors.amberAccent],
                      icon: Icons.ac_unit,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    _buildSectionTitle("La Vue Panoramique 🔭", Icons.visibility),
                    _buildExperienceCard(
                      title: "Belvédère de Bruxelles",
                      description: "Vue imprenable sur les toits, la flèche de l'Hôtel de Ville et l'Atomium au loin.",
                      color: Colors.blueAccent,
                      icon: Icons.map,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    _buildSectionTitle("Aux alentours 🚶‍♂️", Icons.explore),
                    _buildInfoBox(
                      title: "L'Ascenseur des Marolles",
                      desc: "Descendez gratuitement vers le quartier des antiquaires.",
                      icon: Icons.elevator,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoBox(
                      title: "Palais de Justice",
                      desc: "Le géant de pierre juste derrière vous.",
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

  // Widget pour l'image principale
  Widget _buildMainImage(String path) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)],
      ),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[900],
          child: const Icon(Icons.broken_image, color: Colors.white24, size: 50),
        ),
      ),
    );
  }

  Widget _buildDarkHeroHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F0F),
        gradient: LinearGradient(
          colors: [Color(0xFF0F0F0F), Color(0xFF2C1A4D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.wb_twilight, color: Colors.amber, size: 30),
          SizedBox(height: 10),
          Text(
            "MOMENT PANORAMIQUE",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
          ),
          SizedBox(height: 8),
          Text(
            "Observez le changement de couleur du ciel au-dessus de la capitale.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(1.2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: gradientColors.map((c) => c.withOpacity(0.3)).toList()),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradientColors),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(season, style: TextStyle(fontSize: 10, color: isDark ? Colors.grey : Colors.grey.shade600, fontWeight: FontWeight.bold)),
                  Text(colorName, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: gradientColors[0])),
                  Text(desc, style: TextStyle(color: isDark ? Colors.white70 : const Color(0xFF444444), fontSize: 11, height: 1.3)),
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(children: [
        Icon(icon, color: Colors.amber.shade700, size: 18),
        const SizedBox(width: 10),
        Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.amber.shade800))
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Icon(icon, color: color, size: 20), const SizedBox(width: 10), Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 8),
          Text(description, style: TextStyle(color: isDark ? Colors.white70 : const Color(0xFF444444), fontSize: 12, height: 1.4)),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.white10 : Colors.black.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber.shade700, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark ? Colors.white : Colors.black87)),
              Text(desc, style: TextStyle(color: isDark ? Colors.grey : Colors.grey.shade600, fontSize: 11)),
            ]),
          ),
        ],
      ),
    );
  }
}