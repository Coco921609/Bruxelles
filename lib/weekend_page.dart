import 'package:flutter/material.dart';

class WeekendPage extends StatelessWidget {
  const WeekendPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // Fond adaptatif
        backgroundColor: isDark ? const Color(0xFF0F0F0F) : Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("Week-end à Bruxelles",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          backgroundColor: isDark ? Colors.transparent : Colors.amber.shade700,
          elevation: 0,
          centerTitle: true,
          // Couleurs de l'AppBar et des onglets
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          bottom: TabBar(
            indicatorColor: isDark ? Colors.amber : Colors.white,
            labelColor: isDark ? Colors.amber : Colors.white,
            unselectedLabelColor: isDark ? Colors.white54 : Colors.white70,
            tabs: const [
              Tab(icon: Icon(Icons.account_balance), text: "Grand-Place"),
              Tab(icon: Icon(Icons.nature_people), text: "Parcs & Nature"),
            ],
          ),
        ),
        // SelectionArea pour permettre la copie et la recherche web
        body: SelectionArea(
          child: TabBarView(
            children: [
              _buildGrandPlaceTab(isDark),
              _buildParcTab(isDark),
            ],
          ),
        ),
      ),
    );
  }

  // ================= ONGLET 1 : GRAND-PLACE & HISTOIRE =================
  Widget _buildGrandPlaceTab(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("CŒUR HISTORIQUE", Colors.amber),
          const SizedBox(height: 15),
          _buildExperienceCard("📍 La Grand-Place", "Le joyau de l'UNESCO. Admirez l'asymétrie de l'Hôtel de Ville.", Icons.location_on, isDark),
          _buildExperienceCard("🏛️ La Bourse", "Ancien temple du commerce devenu 'Belgian Beer World'.", Icons.account_balance, isDark),
          _buildExperienceCard("🛍️ Galeries St-Hubert", "Arcades royales, idéal pour le chocolat et l'élégance.", Icons.storefront, isDark),
          _buildExperienceCard("⛪ Cathédrale St-Michel", "Majestueuse église gothique, témoin de l'histoire royale.", Icons.church, isDark),
          _buildExperienceCard("🚶 Rues Commerçantes", "Shopping Rue Neuve ou ambiance typique Rue du Marché aux Herbes.", Icons.shopping_bag, isDark),

          const SizedBox(height: 30),
          _buildSectionHeader("GÉRER LA FOULE 👥", isDark ? Colors.orangeAccent : Colors.orange.shade800),
          const SizedBox(height: 15),
          _buildStatusBox("SI VOUS AIMEZ LA FOULE", "C'est idéal le samedi après-midi ! L'ambiance est électrique et la ville vibre.", isDark),
          const SizedBox(height: 10),
          _buildStatusBox("SI VOUS N'AIMEZ PAS LA FOULE", "Venez le matin très tôt ou privilégiez une visite en semaine pour plus de calme.", isDark),

          const SizedBox(height: 30),
          _buildSectionHeader("LES HISTOIRES 'PIS' 💦", isDark ? Colors.lightBlueAccent : Colors.blue.shade700),
          const SizedBox(height: 15),
          _buildHistoryBox(
            "Manneken-Pis (Le Grand)",
            "Installé en 1619, ce petit bonhomme de bronze représente l'esprit frondeur des Bruxellois. La légende raconte qu'il aurait sauvé la ville en éteignant la mèche d'une bombe avec son jet d'eau.",
            isDark,
          ),
          const SizedBox(height: 12),
          _buildHistoryBox(
            "Jeanneke-Pis (La Petite)",
            "Située dans l'impasse de la Fidélité, elle est la sœur cadette de Manneken-Pis. Créée en 1987 par un restaurateur local pour attirer les curieux, elle symbolise l'égalité homme-femme.",
            isDark,
          ),
          const SizedBox(height: 12),
          _buildHistoryBox(
            "Zinneke-Pis (Le Chien)",
            "N'oubliez pas le chien bâtard ! Situé au coin de la rue des Chartreux, il ne fontaine pas, mais lève la patte. Il représente le mélange des cultures et des origines de Bruxelles.",
            isDark,
          ),

          const SizedBox(height: 30),
          _buildSectionHeader("AGENDA WEEK-END 📅", Colors.amber),
          const SizedBox(height: 15),
          _buildSeasonRow("MATIN (08h-09h)", "Calme royal, idéal pour les photos d'architecture sans personne.", isDark ? Colors.lightBlueAccent : Colors.blue, isDark),
          _buildSeasonRow("SAMEDI SOIR", "Illuminations dorées et ambiance festive autour de la Bourse.", Colors.orange, isDark),
          _buildSeasonRow("DIMANCHE MIDI", "Le moment des familles et des touristes, ambiance gaufre et chocolat.", Colors.pinkAccent, isDark),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ================= ONGLET 2 : PARCS & ESPACES VERTS =================
  Widget _buildParcTab(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("STRATÉGIE SAISONS 🍂", isDark ? Colors.greenAccent : Colors.green.shade700),
          const SizedBox(height: 15),
          _buildExperienceCard("Automne", "CONSEILLÉ : Couleurs des feuilles et soleil doux.", Icons.wb_sunny, isDark, color: Colors.orange),
          _buildExperienceCard("Printemps", "CONSEILLÉ : L'air frais et le réveil de la nature.", Icons.local_florist, isDark, color: Colors.pinkAccent),
          _buildExperienceCard("Été", "VIGILANCE : Évitez l'après-midi (chaleur). Privilégiez matin très tôt ou soir.", Icons.wb_sunny_outlined, isDark, color: isDark ? Colors.yellow : Colors.orangeAccent),
          _buildExperienceCard("Hiver", "À ÉVITER : Souvent trop gris et froid.", Icons.ac_unit, isDark, color: Colors.blueAccent),

          const SizedBox(height: 30),
          _buildSectionHeader("LES ÉVASIONS VERTES 🌳", isDark ? Colors.greenAccent : Colors.green.shade700),
          const SizedBox(height: 15),

          _buildParcDetail(
            "Forêt de Soignes",
            "Immense forêt cathédrale de hêtres. Un poumon vert massif idéal pour de longues randonnées ou du vélo.",
            "Forêt de Soignes, 1150 Woluwe-Saint-Pierre",
            isDark ? Colors.green : Colors.green.shade800,
            isDark,
          ),
          _buildParcDetail(
            "Parc Josaphat",
            "Le plus beau parc de Schaerbeek. Vallonné, avec des étangs et une ambiance de quartier authentique.",
            "Parc Josaphat, 1030 Schaerbeek",
            isDark ? Colors.lightGreen : Colors.lightGreen.shade800,
            isDark,
          ),
          _buildParcDetail(
            "Parc Elisabeth",
            "Situé au pied de la Basilique de Koekelberg. Longues allées de promenade très structurées.",
            "Parc Elisabeth, 1081 Koekelberg",
            isDark ? Colors.teal : Colors.teal.shade800,
            isDark,
          ),
          _buildParcDetail(
            "Étangs d'Ixelles",
            "Série de plans d'eau magnifiques entourés d'architecture Art Déco. Très romantique au coucher du soleil.",
            "Étangs d'Ixelles, 1050 Ixelles",
            isDark ? Colors.blueAccent : Colors.blue.shade800,
            isDark,
          ),
          _buildParcDetail(
            "Parc du Bergoje",
            "Un parc sauvage et caché en pleine ville. Ancien vallon escarpé avec un charme rustique et boisé.",
            "Rue Jacques Bassem, 1160 Auderghem",
            isDark ? Colors.brown : Colors.brown.shade800,
            isDark,
          ),
          _buildParcDetail(
            "Parc d'Osseghem (Vue Atomium)",
            "Magnifique parc vallonné offrant une vue imprenable sur l'Atomium. Idéal pour les pique-niques avec vue.",
            "Près de l'Atomium, 1020 Laeken",
            isDark ? Colors.amber : Colors.amber.shade800,
            isDark,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // --- WIDGETS DE CONSTRUCTION ---

  Widget _buildSectionHeader(String title, Color color) {
    return Row(
      children: [
        Flexible(child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color, letterSpacing: 1))),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: color.withOpacity(0.3))),
      ],
    );
  }

  Widget _buildExperienceCard(String title, String desc, IconData icon, bool isDark, {Color color = Colors.amber}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isDark ? Colors.transparent : Colors.black.withOpacity(0.05)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 15),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87, fontSize: 13)),
              Text(desc, style: TextStyle(color: isDark ? Colors.white54 : Colors.black54, fontSize: 11)),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildParcDetail(String name, String desc, String loc, Color accent, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withOpacity(0.2)),
        boxShadow: isDark ? [] : [BoxShadow(color: accent.withOpacity(0.1), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: accent)),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, fontSize: 12, height: 1.4)),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: accent),
              const SizedBox(width: 5),
              Expanded(child: Text(loc, style: TextStyle(color: isDark ? Colors.white38 : Colors.black45, fontSize: 10))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatusBox(String title, String desc, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontWeight: FontWeight.bold, fontSize: 11)),
          const SizedBox(height: 4),
          Text(desc, style: TextStyle(color: isDark ? Colors.white54 : Colors.black54, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildHistoryBox(String title, String text, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isDark ? Colors.white.withOpacity(0.05) : Colors.amber.withOpacity(0.3)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: isDark ? Colors.amber : Colors.amber.shade800, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 6),
          Text(text, style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, fontSize: 11.5, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildSeasonRow(String time, String text, Color color, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(time, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(color: isDark ? Colors.white38 : Colors.black54, fontSize: 11))),
        ],
      ),
    );
  }
}