import 'package:flutter/material.dart';

class ParcLeopoldPage extends StatelessWidget {
  const ParcLeopoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Parc Léopold 🌳"),
      ),
      // Activation de la sélection, du copier et de la recherche web
      body: SelectionArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- IMAGE D'ENTRÉE (PAYSAGE GLOBAL) ---
              // Cette image panoramique illustre parfaitement l'union entre le parc et le quartier européen
              _buildSectionImage('assets/Quartier_Européen,_Bruxelles,_Belgium_-_panoramio_(8).jpg'),
              const SizedBox(height: 20),

              // --- SECTION DÉTENTE & REPAS ---
              _buildSectionHeader("Détente & Lunch 🥪", Icons.restaurant),
              Text(
                "C'est le lieu préféré des députés et des bruxellois pour une pause déjeuner au grand air. "
                    "Installez-vous sur les pelouses face à l'étang pour manger votre sandwich. "
                    "L'ambiance y est calme et sereine, idéale pour déconnecter de l'agitation politique environnante.",
                style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: isDark ? Colors.white70 : const Color(0xFF444444)
                ),
              ),
              const SizedBox(height: 15),
              // Image de l'étang et de la détente
              _buildSectionImage('assets/photo9jpg.jpg'),

              const SizedBox(height: 30),

              // --- LE MUR DE BERLIN (DÉTAILS) ---
              _buildSectionHeader("Histoire : Le Mur de Berlin 🇩🇪", Icons.history),
              Text(
                "À quelques pas seulement du Parlement, vous tomberez sur un vestige authentique. "
                    "Ce segment du Mur de Berlin n'est pas une réplique : il a été transporté ici "
                    "pour témoigner de la réunification européenne. C'est un contraste saisissant "
                    "de voir ce béton gris au milieu de la verdure du parc.",
                style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: isDark ? Colors.white70 : const Color(0xFF444444)
                ),
              ),
              const SizedBox(height: 15),
              // Image du segment du mur
              _buildSectionImage('assets/photo0jpg.jpg'),

              const SizedBox(height: 30),

              // --- SECTION ARCHITECTURE & INSTITUTIONS ---
              _buildSectionHeader("Cadre Institutionnel 🏛️", Icons.business),
              const Text(
                "Le parc est entouré de bâtiments prestigieux, offrant un mélange unique entre nature et modernité vitrée.",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 15),
              _buildSectionImage('assets/photo3jpg.jpg'),

              const SizedBox(height: 30),

              // --- SECTION SAISONS ET HORAIRES ---
              _buildSectionHeader("Saisons & Horaires 🗓️", Icons.calendar_month),
              const SizedBox(height: 10),

              _buildSeasonCard(
                season: "Printemps",
                time: "12:00 - 15:00",
                desc: "Floraison des cerisiers. Lumière douce et parc coloré.",
                status: "RECOMMANDÉ",
                color: Colors.pinkAccent,
                icon: Icons.local_florist,
                isDark: isDark,
              ),
              _buildSeasonCard(
                season: "Été",
                time: "12:00 - 14:00 | 18:00 - 20:00",
                desc: "Fraîcheur sous les arbres. Parfait pour les piques-niques.",
                status: "RECOMMANDÉ",
                color: Colors.greenAccent,
                icon: Icons.wb_sunny,
                isDark: isDark,
              ),
              _buildSeasonCard(
                season: "Automne",
                time: "15:30 - 17:00",
                desc: "Couleurs dorées. Le meilleur moment pour les reflets photo.",
                status: "TOP PHOTO",
                color: Colors.orangeAccent,
                icon: Icons.auto_awesome,
                isDark: isDark,
              ),
              _buildSeasonCard(
                season: "Hiver",
                time: "11:00 - 14:00",
                desc: "Vent froid venant de l'eau. Très sombre après 16h30.",
                status: "À ÉVITER",
                color: Colors.blueAccent,
                icon: Icons.ac_unit,
                isAvoid: true,
                isDark: isDark,
              ),

              const SizedBox(height: 30),

              // --- PARCOURS EXPRESS ---
              _buildSectionHeader("Parcours Express 🗺️", Icons.route),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05)),
                  boxShadow: isDark ? [] : [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  children: [
                    _buildTimelineItem(
                        "PARC LÉOPOLD",
                        "Détente, étang et pause repas",
                        Icons.park,
                        Colors.green,
                        isDark,
                        isFirst: true
                    ),
                    _buildTimelineItem(
                      "MUR DE BERLIN",
                      "Vestige historique authentique",
                      Icons.flag,
                      Colors.redAccent,
                      isDark,
                    ),
                    _buildTimelineItem(
                        "PARLEMENT EUROPÉEN",
                        "Visite des institutions",
                        Icons.account_balance,
                        Colors.blue,
                        isDark,
                        isLast: true
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGETS DE DESIGN ---

  Widget _buildSectionImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 150,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 22),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
        ],
      ),
    );
  }

  Widget _buildSeasonCard({
    required String season,
    required String time,
    required String desc,
    required String status,
    required Color color,
    required IconData icon,
    required bool isDark,
    bool isAvoid = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(season, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                    Text(
                        status,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isAvoid ? Colors.redAccent : color)
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                    "🕒 $time",
                    style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.white : const Color(0xFF1A1A1A)
                    )
                ),
                Text(
                    desc,
                    style: const TextStyle(fontSize: 11, color: Colors.grey)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String title, String desc, IconData icon, Color color, bool isDark, {bool isFirst = false, bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(width: 2, height: isFirst ? 10 : 25, color: isFirst ? Colors.transparent : (isDark ? Colors.white24 : Colors.black12)),
            Icon(icon, color: color, size: 24),
            Container(width: 2, height: isLast ? 10 : 25, color: isLast ? Colors.transparent : (isDark ? Colors.white24 : Colors.black12)),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: isDark ? Colors.white : const Color(0xFF1A1A1A)
                    )
                ),
                Text(
                    desc,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}