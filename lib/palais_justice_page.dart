import 'package:flutter/material.dart';

class PalaisJusticePage extends StatelessWidget {
  const PalaisJusticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E2D2), // Couleur papier ancien
      appBar: AppBar(
        title: const Text(
          "LA GAZETTE DU PALAIS",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFDCD4C1),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.black, height: 2.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER : ÉDITORIAL ---
            _buildJournalHeader(),

            const SizedBox(height: 25),

            // --- SECTION GRATUITÉ (STYLE TIMBRE OFFICIEL) ---
            _buildGratuiteStamp(),

            const SizedBox(height: 25),

            // --- CODE DE PROCÉDURE : SAISONS & HORAIRES ---
            _buildJournalTitle("CODE DE PROCÉDURE 🗓️"),
            _buildLegalArticle(
              "art. 1er. (la semaine)",
              "recommandé. ouvert de 08h à 17h. le meilleur moment pour observer l'agitation des avocats en robe dans la salle des pas perdus.",
              Colors.black87,
            ),
            _buildLegalArticle(
              "art. 2. (week-end)",
              "fermé. le bâtiment est clos au public. seule la vue panoramique depuis la place poelaert reste accessible aux citoyens.",
              const Color(0xFFB71C1C),
              isItalic: true,
            ),

            const SizedBox(height: 25),

            // --- L'EXPÉRIENCE : CHRONIQUE ARCHITECTURALE ---
            _buildJournalTitle("CHRONIQUE ARCHITECTURALE 🏛️"),
            _buildExperienceJournalBox(
              title: "LA SALLE DES PAS PERDUS",
              description: "Un hall monumental de 100 mètres de haut. C'est ici que l'on ressent toute la puissance de l'architecture de Joseph Poelaert.",
              adress: "Place Poelaert 1 (Entrée principale)",
            ),

            const SizedBox(height: 25),

            // --- SÉCURITÉ (STYLE MANDAT) ---
            _buildSecurityMandate(),

            const SizedBox(height: 25),

            // --- LES INCONVÉNIENTS (DÉCRETS NÉGATIFS) ---
            _buildJournalTitle("AVIS AUX VISITEURS ⚠️"),
            _buildInconvenientJournalBox(),

            const SizedBox(height: 30),

            // --- ALERTE FINALE ---
            const Center(
              child: Text(
                "⚠️ fermé les jours fériés belges, vérifier avant d'y aller",
                style: TextStyle(
                  color: Color(0xFFB71C1C),
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS DE DESIGN JUSTICE ---

  Widget _buildJournalHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        color: const Color(0xFFDCD4C1).withOpacity(0.5),
      ),
      child: Column(
        children: const [
          Icon(Icons.gavel, color: Colors.black, size: 30),
          SizedBox(height: 10),
          Text(
            "LE GÉANT DE PIERRE",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Serif'),
          ),
          SizedBox(height: 8),
          Text(
            "Plus grand que la Basilique Saint-Pierre de Rome. Un monument colossal qui domine Bruxelles depuis 1883.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildGratuiteStamp() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade800, width: 2),
      ),
      child: Row(
        children: [
          Icon(Icons.verified_outlined, color: Colors.green.shade800),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "AVANTAGE : L'accès à la Salle des Pas Perdus est totalement libre et gratuit pour tout le monde.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green.shade800),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalArticle(String title, String content, Color textColor, {bool isItalic = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: textColor, fontSize: 13, height: 1.4, fontStyle: isItalic ? FontStyle.italic : FontStyle.normal),
          children: [
            TextSpan(text: "$title — ", style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceJournalBox({required String title, required String description, required String adress}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xFFD4CBB3),
        border: Border(left: BorderSide(color: Colors.black, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: Colors.black87, fontSize: 13)),
          const Divider(color: Colors.black26),
          Text(adress, style: const TextStyle(fontSize: 11, color: Colors.black54, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildSecurityMandate() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: const [
          Icon(Icons.gpp_maybe, color: Colors.black),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              "MANDAT DE SÉCURITÉ : Passage obligatoire sous portique. Objets tranchants strictement prohibés.",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInconvenientJournalBox() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildInconvenientRow("Échafaudages", "Le bâtiment est en rénovation. La façade peut être masquée."),
          _buildInconvenientRow("Respect", "Lieu de silence. Les audiences sont de vrais procès."),
        ],
      ),
    );
  }

  Widget _buildInconvenientRow(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 12),
                children: [
                  TextSpan(text: "$title : ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: desc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJournalTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: Colors.black, thickness: 1.5),
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 10),
      ],
    );
  }
}