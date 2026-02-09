import 'package:flutter/material.dart';

class HeyselPage extends StatelessWidget {
  const HeyselPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détection du mode (Sombre ou Clair)
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Couleurs adaptatives pour le confort visuel
    final Color bgColor = isDark ? const Color(0xFF0F0F0F) : const Color(0xFFF2F2F7);
    final Color cardColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      // AppBar sombre fixe pour un look premium
      appBar: AppBar(
        title: const Text("Heysel : Guide Complet"),
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
      // SelectionArea permet la copie et la recherche internet sur tout le texte
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SOMBRE (Fixe) ---
              _buildDarkHeroHeader(isDark),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= SECTION MINI-EUROPE =================
                    _buildSectionHeader("1. MINI-EUROPE", Colors.blueAccent),
                    _buildHistoryBox(
                      "HISTOIRE : Inauguré en 1989, ce parc unique regroupe 350 maquettes des plus beaux monuments européens. C'est un travail colossal de précision à l'échelle 1/25, symbolisant l'union des cultures.",
                      Colors.blueAccent,
                      isDark,
                      cardColor,
                    ),

                    _buildSeasonRecommandations(
                      accentColor: Colors.blueAccent,
                      printemps: "RECOMMANDÉ. Idéal pour voir les jardins en fleurs.",
                      ete: "À ÉVITER. Chaleur étouffante sur le parcours extérieur.",
                      automne: "RECOMMANDÉ. Très belles couleurs sur les maquettes.",
                      hiver: "FERMÉ (voir dates). Magique uniquement fin décembre.",
                      isDark: isDark,
                    ),

                    _buildHorairesSaisonniers2026(isDark, cardColor),

                    // PRÉCISION FERMETURE ANNUELLE
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.event_busy, color: Colors.redAccent, size: 20),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "FERMETURE ANNUELLE 2026/2027 :\nDu 04 janvier 2027 au 12 mars 2027 inclus.",
                              style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),

                    _buildQuickTip("Visez 10h00 ou après 15h30. Évitez absolument le week-end.", isDark),
                    _buildPriceWarning("Prix : Payant. Les tarifs changent selon la saison."),

                    const SizedBox(height: 40),

                    // ================= SECTION ATOMIUM =================
                    _buildSectionHeader("2. L'ATOMIUM", Colors.amber.shade700),
                    _buildHistoryBox(
                      "HISTOIRE : Construit pour l'Expo 58, il représente un cristal de fer agrandi 165 milliards de fois. Prévu pour durer 6 mois, il est devenu le symbole permanent de Bruxelles.",
                      Colors.amber,
                      isDark,
                      cardColor,
                    ),

                    _buildSeasonRecommandations(
                      accentColor: Colors.amber.shade800,
                      printemps: "IDÉAL. Bonne visibilité depuis les sphères.",
                      ete: "TRÈS CHARGÉ. Files d'attente interminables (2h+).",
                      automne: "RECOMMANDÉ. Moins de brume pour admirer la vue.",
                      hiver: "RECOMMANDÉ. L'Atomium reste OUVERT toute l'année.",
                      isDark: isDark,
                    ),

                    _buildHorairesFixes(
                      "Ouvert 365j/365 (Lundi-Vendredi conseillé) : 10h00 — 18h00",
                      "Dernière entrée : 17h30",
                      "Note : Pas de fermeture annuelle pour l'Atomium.",
                      isDark,
                      cardColor,
                    ),
                    _buildQuickTip("Meilleur créneau : 10h pile ou 16h30. Évitez les week-ends.", isDark),
                    _buildPriceWarning("Prix : Payant. Ticket combiné disponible sur place."),

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

  // Header sombre qui ancre le design
  Widget _buildDarkHeroHeader(bool isDark) {
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
          colors: [Color(0xFF0F0F0F), Color(0xFF263238)], // Noir vers Gris-Bleu Heysel
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.map_outlined, color: Colors.amber, size: 40),
          SizedBox(height: 15),
          Text(
            "PLATEAU DU HEYSEL",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.2),
          ),
          SizedBox(height: 8),
          Text(
            "PLANIFICATION SAISON 2026",
            style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(height: 25, width: 5, color: color),
          const SizedBox(width: 15),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildHistoryBox(String text, Color borderColor, bool isDark, Color cardColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor.withOpacity(0.3)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
      ),
      child: Text(
          text,
          style: TextStyle(
              color: isDark ? Colors.white70 : const Color(0xFF444444),
              fontSize: 13,
              height: 1.6
          )
      ),
    );
  }

  Widget _buildSeasonRecommandations({
    required Color accentColor,
    required String printemps,
    required String ete,
    required String automne,
    required String hiver,
    required bool isDark,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: accentColor.withOpacity(isDark ? 0.05 : 0.08),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("CONSEILS PAR SAISON", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: accentColor)),
          const SizedBox(height: 10),
          _seasonRow(Icons.local_florist, "Printemps", printemps, Colors.pinkAccent, isDark),
          _seasonRow(Icons.wb_sunny, "Été", ete, Colors.orangeAccent, isDark),
          _seasonRow(Icons.wb_twilight, "Automne", automne, Colors.orange, isDark),
          _seasonRow(Icons.ac_unit, "Hiver", hiver, Colors.lightBlueAccent, isDark),
        ],
      ),
    );
  }

  Widget _seasonRow(IconData icon, String season, String text, Color iconColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
                  "$season : $text",
                  style: TextStyle(
                      color: isDark ? Colors.white70 : const Color(0xFF555555),
                      fontSize: 11
                  )
              )
          ),
        ],
      ),
    );
  }

  Widget _buildHorairesSaisonniers2026(bool isDark, Color cardColor) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.2)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("📅 HORAIRES MINI-EUROPE 2026", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.blueAccent)),
          const SizedBox(height: 10),
          _timeRow("14/03 - 30/06", "09h30 - 18h00", isDark),
          _timeRow("01/07 - 31/08", "09h30 - 19h00", isDark),
          _timeRow("01/09 - 30/09", "09h30 - 18h00", isDark),
          _timeRow("01/10 - 03/01/27", "10h00 - 18h00", isDark),
        ],
      ),
    );
  }

  Widget _buildHorairesFixes(String l1, String l2, String l3, bool isDark, Color cardColor) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.2)),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("🕒 HORAIRES ATOMIUM", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.amber)),
          const SizedBox(height: 10),
          Text(l1, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87, fontSize: 12)),
          Text(l2, style: TextStyle(fontSize: 12, color: isDark ? Colors.white70 : Colors.black54)),
          Text(l3, style: TextStyle(fontSize: 12, color: isDark ? Colors.white70 : Colors.black54)),
        ],
      ),
    );
  }

  Widget _timeRow(String date, String time, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: TextStyle(fontSize: 12, color: isDark ? Colors.white60 : Colors.black54)),
          Text(time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isDark ? Colors.white : Colors.black87))
        ],
      ),
    );
  }

  Widget _buildQuickTip(String tip, bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
          "💡 $tip",
          style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              color: isDark ? Colors.white70 : Colors.black54
          )
      ),
    );
  }

  Widget _buildPriceWarning(String text) {
    return Text("⚠️ $text", style: TextStyle(color: Colors.amber.shade800, fontSize: 11, fontWeight: FontWeight.bold));
  }
}