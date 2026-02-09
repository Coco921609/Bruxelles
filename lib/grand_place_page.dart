import 'package:flutter/material.dart';

class GrandPlacePage extends StatelessWidget {
  const GrandPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Couleurs adaptatives pour un confort visuel optimal
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            // --- HEADER STYLE PREMIUM DARK (Fixe pour éviter l'éblouissement) ---
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              stretch: true,
              // On force une couleur sombre même en mode clair pour l'élégance
              backgroundColor: const Color(0xFF001A4D),
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Fond dégradé bleu nuit profond
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF000B21), Color(0xFF003399)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    CustomPaint(painter: RadioGridPainter(isDark: true)), // Grid toujours claire sur fond sombre
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withOpacity(0.15),
                              blurRadius: 80,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.castle, size: 75, color: Colors.amber),
                          const SizedBox(height: 15),
                          Text(
                            "GRAND-PLACE",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- SECTION 1 : BALADES & DÉCOUVERTES ---
                    _buildSectionTitle("Balades & Découvertes 🌆", Icons.explore),

                    _buildExperienceCard("📍 La Grand-Place", "Le cœur historique. Admirez l'Hôtel de Ville et les dorures des maisons de corporations.", Icons.location_on, isDark, cardColor),
                    _buildExperienceCard("🏛️ La Bourse", "L'ancien temple du commerce devenu 'Belgian Beer World'. Zone piétonne animée.", Icons.account_balance, isDark, cardColor),
                    _buildExperienceCard("🛍️ Galeries Royales St-Hubert", "Splendides arcades couvertes avec chocolatiers de renom et cafés historiques.", Icons.storefront, isDark, cardColor),
                    _buildExperienceCard("⛪ Cathédrale St-Michel", "Chef-d'œuvre gothique majestueux, témoin des grands événements royaux.", Icons.church, isDark, cardColor),
                    _buildExperienceCard("🚶 Rues Commerçantes", "Shopping Rue Neuve ou ambiance typique Rue du Marché aux Herbes.", Icons.shopping_bag, isDark, cardColor),

                    _buildShoppingTip("Chocolats & Souvenirs", "C'est le moment idéal pour acheter vos boîtes de chocolats et vos souvenirs (dentelle, Manneken-Pis miniature).", isDark, cardColor),

                    const SizedBox(height: 30),

                    // --- SECTION 2 : HISTOIRE DE L'ARCHITECTURE ---
                    _buildSectionTitle("L'Architecture 🏛️", Icons.architecture),
                    _buildHistoryCard(
                        "L'Hôtel de Ville (Asymétrie)",
                        "Regardez la tour : elle n'est pas au centre ! L'aile gauche (1402) est plus courte que l'aile droite (1444). Ce n'est pas une erreur de l'architecte, mais une construction en deux étapes sur un espace restreint.",
                        isDark,
                        cardColor
                    ),

                    const SizedBox(height: 30),

                    // --- SECTION 3 : LES HISTOIRES "PIS" ---
                    _buildSectionTitle("Les Histoires 'Pis' 💦", Icons.water_drop),

                    _buildHistoryCard(
                        "Manneken-Pis (Le Grand)",
                        "Installé en 1619, ce petit bonhomme de bronze représente l'esprit frondeur des Bruxellois. La légende raconte qu'il aurait sauvé la ville en éteignant la mèche d'une bombe avec son jet d'eau.",
                        isDark,
                        cardColor
                    ),
                    const SizedBox(height: 12),
                    _buildHistoryCard(
                        "Jeanneke-Pis (La Petite)",
                        "Située dans l'impasse de la Fidélité, elle est la sœur cadette de Manneken-Pis. Créée en 1987 par un restaurateur local pour attirer les curieux, elle symbolise l'égalité homme-femme.",
                        isDark,
                        cardColor
                    ),
                    const SizedBox(height: 12),
                    _buildHistoryCard(
                        "Zinneke-Pis (Le Chien)",
                        "N'oubliez pas le chien bâtard ! Situé au coin de la rue des Chartreux, il ne fontaine pas, mais lève la patte. Il représente le mélange des cultures et des origines de Bruxelles.",
                        isDark,
                        cardColor
                    ),

                    const SizedBox(height: 30),

                    // --- SECTION 4 : SAISONS & HORAIRES ---
                    _buildSectionTitle("L'Agenda des Saisons & Horaires 📅", Icons.calendar_month),
                    _buildSeasonEvent(
                      season: "Printemps",
                      event: "Floraison Royale",
                      desc: "Les parterres du Mont des Arts sont éclatants.",
                      time: "MATIN (09:00 - 11:00)",
                      color: Colors.lightGreenAccent,
                      icon: Icons.local_florist,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    _buildSeasonEvent(
                      season: "Été",
                      event: "Le Tapis de Fleurs",
                      desc: "En août (tous les 2 ans) : 500 000 bégonias.",
                      time: "SOIR (21:00 - 23:00)",
                      color: Colors.deepOrangeAccent,
                      icon: Icons.sunny,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    _buildSeasonEvent(
                      season: "Automne",
                      event: "Ambiance Gothique",
                      desc: "Brume et lumières chaudes sur les flèches.",
                      time: "APRÈS-MIDI (16:00 - 18:00)",
                      color: Colors.orange,
                      icon: Icons.wb_twilight,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),
                    _buildSeasonEvent(
                      season: "Hiver",
                      event: "Plaisirs d'Hiver",
                      desc: "Spectacle Son & Lumière et sapin géant.",
                      time: "SOIR (18:00 - 22:00)",
                      color: isDark ? Colors.lightBlue.shade300 : Colors.blueAccent,
                      icon: Icons.ac_unit,
                      isDark: isDark,
                      cardColor: cardColor,
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS ---

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber.shade700, size: 18),
          const SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.amber.shade800, letterSpacing: 0.5)),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String title, String desc, IconData icon, bool isDark, Color cardColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Icon(icon, color: isDark ? Colors.amber.withOpacity(0.7) : Colors.amber.shade700, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: isDark ? Colors.white54 : Colors.black54, fontSize: 11, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingTip(String title, String desc, bool isDark, Color cardColor) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF1A1A1A), Colors.amber.withOpacity(0.05)]
                : [Colors.white, Colors.amber.shade50]
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.amber.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, color: Colors.amber, size: 22),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontWeight: FontWeight.bold, fontSize: 13)),
                Text(desc, style: TextStyle(color: isDark ? Colors.white54 : Colors.black54, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(String title, String text, bool isDark, Color cardColor) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: isDark ? Colors.amber : Colors.amber.shade800, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          Text(text, style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, fontSize: 12, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildSeasonEvent({required String season, required String event, required String desc, required String time, required Color color, required IconData icon, required bool isDark, required Color cardColor}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(season.toUpperCase(), style: TextStyle(color: isDark ? color : color.withRed(100), fontWeight: FontWeight.bold, fontSize: 10)),
                    Text(time, style: TextStyle(color: isDark ? color.withOpacity(0.7) : Colors.black45, fontSize: 9, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(event, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark ? Colors.white : Colors.black87)),
                Text(desc, style: TextStyle(color: isDark ? Colors.white60 : Colors.black54, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(icon, color: isDark ? Colors.white10 : Colors.black12, size: 20),
        ],
      ),
    );
  }
}

class RadioGridPainter extends CustomPainter {
  final bool isDark;
  RadioGridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white.withOpacity(0.03)..strokeWidth = 1.0;
    for (var i = 0; i < size.width; i += 25) {
      canvas.drawLine(Offset(i.toDouble(), 0), Offset(i.toDouble(), size.height), paint);
    }
    for (var i = 0; i < size.height; i += 25) {
      canvas.drawLine(Offset(0, i.toDouble()), Offset(size.width, i.toDouble()), paint);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}