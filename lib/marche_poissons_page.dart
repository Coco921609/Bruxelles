import 'package:flutter/material.dart';

class MarchePoissonsPage extends StatelessWidget {
  const MarchePoissonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Couleurs adaptatives pour le mode clair adouci
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      // AppBar sombre fixe pour un contraste élégant dès le haut de page
      appBar: AppBar(
        title: const Text("Marché aux Poissons 🐟"),
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
      // SelectionArea permet la copie et la recherche internet sur tout le contenu
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SOMBRE (Look Gastronomique & Maritime) ---
              _buildDarkHeroHeader(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- SECTION : LA TRADITION ---
                    _buildSectionTitle("L'Incontournable 🍤", Icons.restaurant_menu),
                    _buildExperienceCard(
                      title: "Dégustation sur le pouce",
                      description: "Le rituel : commander une soupe de poisson ou des croquettes de crevettes chez 'Noordzee' et manger debout sur les tables hautes en métal.",
                      color: Colors.blueAccent,
                      icon: Icons.outdoor_grill,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    // --- SAISONS : L'EAU ET LES LUMIÈRES ---
                    _buildSectionTitle("Saisons 🌊", Icons.waves),
                    _buildSeasonCard(
                      season: "Été (Terrasses)",
                      status: "IDÉAL",
                      desc: "Les fontaines sont allumées et les bancs le long des anciens quais sont parfaits pour se poser après manger.",
                      color: isDark ? Colors.cyanAccent : Colors.cyan.shade700,
                      icon: Icons.light_mode,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    _buildSeasonCard(
                      season: "Hiver (Plaisirs d'Hiver)",
                      status: "TRÈS CHARGÉ",
                      desc: "Le bassin accueille souvent des installations lumineuses. C'est le cœur battant du marché de Noël.",
                      color: isDark ? Colors.orangeAccent : Colors.orange.shade800,
                      icon: Icons.ac_unit,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 25),

                    // --- CONSEILS ---
                    _buildSectionTitle("Conseils d'initié 💡", Icons.tips_and_updates),
                    _buildInfoBox(
                      title: "Évitez le samedi midi",
                      desc: "C'est le moment le plus bondé. Préférez le mardi ou le jeudi pour une ambiance plus locale.",
                      icon: Icons.timer,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoBox(
                      title: "Fraîcheur garantie",
                      desc: "Les restaurants ici sont fournis quotidiennement. C'est le seul endroit de Bruxelles où manger du poisson les yeux fermés.",
                      icon: Icons.verified,
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

  // Header sombre fixe pour un rendu haut de gamme
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
          colors: [Color(0xFF0F0F0F), Color(0xFF004D40)], // Dégradé noir vers vert teal profond
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.set_meal, color: Colors.white, size: 40),
          SizedBox(height: 15),
          Text(
            "LE VENTRE DE BRUXELLES",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
          ),
          SizedBox(height: 10),
          Text(
            "Anciens quais du port où la tradition de la mer rencontre la street-food moderne.",
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
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          ])),
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      ]),
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
      child: Row(children: [
        Icon(icon, color: Colors.amber.shade700, size: 20),
        const SizedBox(width: 15),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        ])),
      ]),
    );
  }
}