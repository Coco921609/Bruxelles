import 'package:flutter/material.dart';
import 'dart:math' as math;

class ParlementEuropeenPage extends StatelessWidget {
  const ParlementEuropeenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Utilisation de la couleur du thème (Gris doux en clair / Noir bleu en sombre)
      backgroundColor: isDark ? const Color(0xFF040712) : Theme.of(context).scaffoldBackgroundColor,
      body: SelectionArea( // Active la copie et la recherche web partout
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // --- header prestige ---
            SliverAppBar(
              expandedHeight: 220,
              pinned: true,
              stretch: true,
              backgroundColor: const Color(0xFF003399),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF003399), Color(0xFF06112E)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Center(
                          child: CustomPaint(
                            painter: EuropeanStarsPainter(),
                            size: const Size(150, 150),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.amber, width: 1),
                              ),
                              child: const Icon(Icons.account_balance, color: Colors.amber, size: 40),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "parlement européen",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 5,
                              ),
                            ),
                            const Text(
                              "bruxelles • belgique",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 10,
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
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // --- ton argument ---
                  _buildPrestigeHero(isDark),

                  const SizedBox(height: 40),

                  _buildInstitutionalTitle("protocole de visite", "saisons & affluence", isDark),
                  _buildModernSeasonCard(
                      "printemps / automne",
                      "RECOMMANDÉ",
                      "Le meilleur moment. Moins de groupes scolaires qu'en juin, climat idéal pour marcher entre les bâtiments.",
                      Colors.greenAccent,
                      isDark
                  ),
                  _buildModernSeasonCard(
                      "hiver (nov. - fév.)",
                      "TOP INTÉRIEUR",
                      "La meilleure activité quand il pleut à Bruxelles. Chauffé, moderne et gratuit.",
                      Colors.blueAccent,
                      isDark
                  ),
                  _buildModernSeasonCard(
                      "juillet / août",
                      "À ÉVITER (AFFLUENCE)",
                      "Très forte affluence touristique. File d'attente plus longue à la sécurité. Réservation obligatoire.",
                      Colors.redAccent,
                      isDark
                  ),

                  const SizedBox(height: 30),

                  _buildGoldGratuiteCard(isDark),

                  const SizedBox(height: 15),
                  _buildClosingNotice(), // alerte rouge, italique, sans majuscules

                  const SizedBox(height: 40),

                  // --- section sécurité & accès global ---
                  _buildInstitutionalTitle("sécurité & accès", "contrôles obligatoires", isDark),
                  _buildGlobalAccessControl(isDark),

                  const SizedBox(height: 40),

                  _buildInstitutionalTitle("expérience 01", "le parlamentarium", isDark),
                  _buildExperienceDetail(
                      "L'Histoire de l'Europe",
                      "Indispensable pour comprendre la politique européenne. Audioguides interactifs gratuits.",
                      "Entrée : Esplanade Solidarność 1980 (Place du Luxembourg)",
                      const Color(0xFF0055FF),
                      isDark
                  ),
                  _buildOfficialTable("horaires d'ouverture", [
                    ["Lundi", "13h00 − 18h00"],
                    ["Mardi à Vendredi", "09h00 − 18h00"],
                    ["Samedi & Dimanche", "10h00 − 18h00"],
                  ], "Dernière entrée 30 minutes avant la fermeture.", isDark),

                  const SizedBox(height: 40),

                  _buildInstitutionalTitle("expérience 02", "l'hémicycle", isDark),
                  _buildExperienceDetail(
                      "Le Cœur des Débats",
                      "La salle monumentale des votes. À voir au moins une fois dans sa vie.",
                      "Entrée : Bâtiment Paul-Henri Spaak (Rue Wiertz)",
                      const Color(0xFFFFC107),
                      isDark
                  ),
                  _buildOfficialTable("sessions au public", [
                    ["Guide multimédia (Lun-Jeu)", "09h00 − 16h30"],
                    ["Guide multimédia (Ven)", "09h00 − 12h30"],
                    ["Visite guidée (Lun-Jeu)", "11h00 & 15h00"],
                  ], "Aucune visite le week-end ni les jours fériés.", isDark),

                  const SizedBox(height: 40),

                  // --- NOUVELLE SECTION HISTORIQUE ---
                  _buildInstitutionalTitle("histoire & géopolitique", "pourquoi bruxelles ?", isDark),
                  _buildHistoryPoint(
                      "Pourquoi pas Paris ?",
                      "Après 1945, choisir Paris aurait donné une image de domination française sur l'Europe. Bruxelles a été choisie comme terrain neutre entre la France et l'Allemagne.",
                      isDark
                  ),
                  _buildHistoryPoint(
                      "L'échec de Chantilly",
                      "Bien que prestigieuse, Chantilly n'avait pas les infrastructures ferroviaires et hôtelières pour accueillir des milliers de diplomates. Bruxelles était déjà un carrefour européen majeur.",
                      isDark
                  ),
                  _buildHistoryPoint(
                      "Le provisoire qui dure",
                      "La Belgique a été la plus rapide à construire des bureaux. À force d'y installer les institutions 'provisoirement', Bruxelles est devenue la capitale de fait.",
                      isDark
                  ),

                  const SizedBox(height: 40),

                  _buildInstitutionalTitle("réservation", "conditions d'accès", isDark),
                  _buildBookingSummary(isDark),

                  const SizedBox(height: 80),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- widgets ---

  Widget _buildHistoryPoint(String title, String desc, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: TextStyle(color: isDark ? Colors.amber : const Color(0xFF664400), fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: isDark ? Colors.white70 : const Color(0xFF444444), fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildPrestigeHero(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0A1128) : Colors.white,
          border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
          boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]
      ),
      child: Column(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 30),
          const SizedBox(height: 20),
          Text("qu'on aime ou pas la politique, faut visiter !", textAlign: TextAlign.center, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          const Text("À VOIR UNE FOIS DANS SA VIE", textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Text("Comprendre la politique pour comprendre notre monde.", textAlign: TextAlign.center, style: TextStyle(color: isDark ? Colors.white60 : Colors.black54, fontSize: 13, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildInstitutionalTitle(String overline, String mainTitle, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(overline, style: TextStyle(color: isDark ? Colors.amber : const Color(0xFF664400), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
        const SizedBox(height: 5),
        Text(mainTitle, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 20, fontWeight: FontWeight.w300)),
        Container(margin: const EdgeInsets.only(top: 10, bottom: 20), height: 1, width: 40, color: Colors.amber),
      ],
    );
  }

  Widget _buildModernSeasonCard(String title, String status, String desc, Color color, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0D152D) : Colors.white,
          border: Border(left: BorderSide(color: color, width: 3)),
          boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
              Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: isDark ? Colors.white54 : Colors.black87, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildGoldGratuiteCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF0F2D1F), const Color(0xFF040712)]
                : [const Color(0xFFE8F5E9), Colors.white]
        ),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [const Icon(Icons.euro, color: Colors.green, size: 20), const SizedBox(width: 10), Text("AVANTAGE GRATUITÉ", style: TextStyle(color: isDark ? Colors.greenAccent : Colors.green[800], fontWeight: FontWeight.bold, fontSize: 12))]),
          const SizedBox(height: 10),
          Text("Ici, aucun argent liquide n'est requis. Contrairement au Parlement de Budapest qui est payant, tout est gratuit à Bruxelles (audioguides inclus). Zéro espèce nécessaire.", style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, fontSize: 12, height: 1.6)),
        ],
      ),
    );
  }

  Widget _buildOfficialTable(String header, List<List<String>> data, String footer, bool isDark) {
    return Container(
      decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0D152D) : Colors.white,
          border: Border.all(color: isDark ? Colors.white10 : Colors.black12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              color: isDark ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.03),
              child: Text(header, style: TextStyle(color: isDark ? Colors.amber : const Color(0xFF664400), fontSize: 10, fontWeight: FontWeight.bold))
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Table(
              children: data.map((row) => TableRow(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(row[0], style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, fontSize: 12))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Text(row[1], textAlign: TextAlign.right, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                ],
              )).toList(),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 15, bottom: 15), child: Text(footer, style: const TextStyle(color: Colors.grey, fontSize: 10, fontStyle: FontStyle.italic))),
        ],
      ),
    );
  }

  Widget _buildExperienceDetail(String subtitle, String desc, String map, Color color, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: isDark ? Colors.white60 : Colors.black54, fontSize: 13)),
          const SizedBox(height: 8),
          Text(map, style: TextStyle(color: color.withOpacity(0.9), fontSize: 11, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildGlobalAccessControl(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A0505) : const Color(0xFFFFEBEE),
        border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.gpp_maybe, color: Colors.redAccent, size: 24),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  "contrôle de sécurité obligatoire (scanner et pièce d'identité) à l'entrée de l'hémicycle ET du parlamentarium.",
                  style: TextStyle(color: isDark ? Colors.white : Colors.red[900], fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookingSummary(bool isDark) {
    return Column(
      children: [
        _buildSummaryRow(Icons.timer_off, "retard", "en ligne : place perdue immédiatement.", isDark),
        const SizedBox(height: 12),
        _buildSummaryRow(Icons.qr_code, "sur place", "flexible via qr code mais risque de complet.", isDark),
      ],
    );
  }

  Widget _buildSummaryRow(IconData icon, String title, String value, bool isDark) {
    return Row(
      children: [
        Icon(icon, color: isDark ? Colors.amber : const Color(0xFF664400), size: 18),
        const SizedBox(width: 12),
        Expanded(child: Text("$title : $value", style: TextStyle(color: isDark ? Colors.white70 : Colors.black87, fontSize: 12))),
      ],
    );
  }

  Widget _buildClosingNotice() {
    return const SizedBox(
      width: double.infinity,
      child: Text(
        "⚠️ fermé les jours fériés belges, vérifier avant d'y aller",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class EuropeanStarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    const radius = 60.0;
    const starRadius = 5.0;

    for (int i = 0; i < 12; i++) {
      final angle = (2 * i * math.pi / 12) - (math.pi / 2);
      final starX = centerX + radius * math.cos(angle);
      final starY = centerY + radius * math.sin(angle);

      final path = Path();
      for (int j = 0; j < 5; j++) {
        final starAngle = (j * 4 * math.pi / 5) - (math.pi / 2);
        final x = starX + starRadius * math.cos(starAngle);
        final y = starY + starRadius * math.sin(starAngle);
        if (j == 0) path.moveTo(x, y); else path.lineTo(x, y);
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}