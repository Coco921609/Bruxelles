import 'package:flutter/material.dart';

class SainteCatherinePage extends StatelessWidget {
  const SainteCatherinePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Couleurs de fond pour le mode clair adouci
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      // AppBar sombre fixe pour un look élégant et non éblouissant
      appBar: AppBar(
        title: const Text("Sainte-Catherine ⚓"),
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
      // Active la sélection, la copie et la recherche internet sur tout le texte
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SOMBRE (Look Maritime Premium) ---
              _buildDarkHeroHeader(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- SECTION : GASTRONOMIE (FOOD) ---
                    _buildSectionTitle("Gastronomie & Street-Food 🐟", Icons.restaurant),
                    _buildExperienceCard(
                      title: "Le Marché aux Poissons",
                      description: "Historiquement le port de Bruxelles. Aujourd'hui, c'est l'endroit idéal pour manger des croquettes de crevettes ou des huîtres debout dans la rue.",
                      color: Colors.blueAccent,
                      icon: Icons.set_meal,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    // --- SAISONS : L'ÉVÈNEMENT PHARE ---
                    _buildSectionTitle("Saisons & Ambiance 🎡", Icons.celebration),

                    _buildSeasonCard(
                      season: "Hiver (Décembre)",
                      status: "MAGIQUE",
                      desc: "C'est ici que s'installe la Grande Roue et le plus beau marché de Noël. Spectacles de lumières sur l'église.",
                      color: isDark ? Colors.cyanAccent : Colors.cyan.shade700,
                      icon: Icons.ac_unit,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    _buildSeasonCard(
                      season: "Été",
                      status: "TERRASSES",
                      desc: "Les quais sont envahis de terrasses. Ambiance très détendue, parfaite pour boire une bière en fin de journée.",
                      color: isDark ? Colors.orangeAccent : Colors.orange.shade800,
                      icon: Icons.local_bar,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    // --- QUE VOIR ABSOLUMENT ---
                    _buildSectionTitle("À ne pas rater 🏛️", Icons.visibility),
                    _buildInfoBox(
                      title: "L'Église Sainte-Catherine",
                      desc: "Un mélange unique de styles (Gothique, Renaissance, Roman). L'intérieur est majestueux.",
                      icon: Icons.church,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoBox(
                      title: "Le Bassin de la Tour Noire",
                      desc: "Juste derrière l'église se cache un vestige de la première enceinte de la ville (13ème siècle).",
                      icon: Icons.fort,
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

  // Header Maritime sombre pour éviter le blanc en haut
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
          colors: [Color(0xFF0F0F0F), Color(0xFF003366)], // Bleu marin profond
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.anchor, color: Colors.white, size: 40),
          SizedBox(height: 15),
          Text(
            "QUARTIER MARITIME",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
          ),
          SizedBox(height: 10),
          Text(
            "Le ventre de Bruxelles : poissons frais, terrasses et magie de Noël.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),
        ],
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

  Widget _buildSeasonCard({
    required String season,
    required String status,
    required String desc,
    required Color color,
    required IconData icon,
    required bool isDark,
    required Color cardColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
                Text(
                  season,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    color: isDark ? Colors.white60 : const Color(0xFF444444),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 10),
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold))
          ]),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: isDark ? Colors.white70 : const Color(0xFF444444),
              fontSize: 13,
              height: 1.4,
            ),
          ),
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
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5)
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber.shade700, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              Text(
                desc,
                style: TextStyle(color: isDark ? Colors.grey : Colors.grey.shade600, fontSize: 12),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}