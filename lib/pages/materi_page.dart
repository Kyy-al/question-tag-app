import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.indigo.shade50,
              Colors.purple.shade50,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // CUSTOM HEADER
              _buildHeader(context),
              
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LOTTIE ANIMATION CARD
                      _buildLottieCard(),
                      const SizedBox(height: 24),

                      // INTRO CARD
                      _buildIntroCard(),
                      const SizedBox(height: 24),

                      // SECTION: Apa itu Tag Question
                      _buildSectionTitle("Apa itu Tag Question?", Icons.quiz_rounded),
                      const SizedBox(height: 12),
                      _buildDefinitionCard(),
                      const SizedBox(height: 16),
                      _buildExampleBox(
                        "You are a student, aren't you?",
                        "Kamu seorang pelajar, bukan?",
                        Colors.blue,
                      ),
                      const SizedBox(height: 8),
                      _buildInfoBox(
                        "Tag question digunakan untuk meminta konfirmasi atau persetujuan dari lawan bicara. Biasanya diucapkan dengan intonasi naik di akhir kalimat.",
                        Icons.info_outline,
                        Colors.blue,
                      ),

                      const SizedBox(height: 24),

                      // SECTION: Fungsi Tag Question
                      _buildSectionTitle("Fungsi Tag Question 🎯", Icons.functions_rounded),
                      const SizedBox(height: 12),
                      _buildFunctionCard(),

                      const SizedBox(height: 24),

                      // SECTION: Aturan Umum
                      _buildSectionTitle("Aturan Umum 📋", Icons.rule_rounded),
                      const SizedBox(height: 12),
                      _buildRulesCard(),

                      const SizedBox(height: 24),

                      // SECTION: Pola Dasar
                      _buildSectionTitle("Pola Dasar Tag Question", Icons.pattern_rounded),
                      const SizedBox(height: 12),
                      _buildPatternCard(),

                      const SizedBox(height: 24),

                      // SECTION: Positive → Negative
                      _buildSectionTitle("Kalimat Positif → Tag Negatif", Icons.add_circle_outline_rounded),
                      const SizedBox(height: 12),
                      _buildInfoBox(
                        "Jika kalimat utama positif, maka tag question-nya harus negatif (dengan menambahkan 'not').",
                        Icons.lightbulb_outline,
                        Colors.green,
                      ),
                      const SizedBox(height: 12),
                      _buildCategoryTitle("With BE (am, is, are, was, were)"),
                      _buildExampleBox(
                        "She is smart, isn't she?",
                        "Dia pintar, bukan?",
                        Colors.green,
                      ),
                      _buildExampleBox(
                        "They are happy, aren't they?",
                        "Mereka senang, kan?",
                        Colors.green,
                      ),
                      _buildExampleBox(
                        "He was late, wasn't he?",
                        "Dia terlambat, kan?",
                        Colors.green,
                      ),
                      const SizedBox(height: 12),
                      _buildCategoryTitle("With MODAL (can, could, will, would, should, must)"),
                      _buildExampleBox(
                        "They can swim, can't they?",
                        "Mereka bisa berenang, kan?",
                        Colors.green,
                      ),
                      _buildExampleBox(
                        "She will come, won't she?",
                        "Dia akan datang, kan?",
                        Colors.green,
                      ),
                      _buildExampleBox(
                        "You should go, shouldn't you?",
                        "Kamu harus pergi, kan?",
                        Colors.green,
                      ),
                      const SizedBox(height: 12),
                      _buildCategoryTitle("With HAVE/HAS"),
                      _buildExampleBox(
                        "She has finished, hasn't she?",
                        "Dia sudah selesai, kan?",
                        Colors.green,
                      ),
                      _buildExampleBox(
                        "They have arrived, haven't they?",
                        "Mereka sudah tiba, kan?",
                        Colors.green,
                      ),

                      const SizedBox(height: 24),

                      // SECTION: Negative → Positive
                      _buildSectionTitle("Kalimat Negatif → Tag Positif", Icons.remove_circle_outline_rounded),
                      const SizedBox(height: 12),
                      _buildInfoBox(
                        "Jika kalimat utama negatif, maka tag question-nya harus positif (tanpa 'not').",
                        Icons.lightbulb_outline,
                        Colors.orange,
                      ),
                      const SizedBox(height: 12),
                      _buildCategoryTitle("With BE (am not, isn't, aren't, wasn't, weren't)"),
                      _buildExampleBox(
                        "He isn't tired, is he?",
                        "Dia tidak capek, kan?",
                        Colors.orange,
                      ),
                      _buildExampleBox(
                        "They aren't students, are they?",
                        "Mereka bukan pelajar, kan?",
                        Colors.orange,
                      ),
                      _buildExampleBox(
                        "She wasn't angry, was she?",
                        "Dia tidak marah, kan?",
                        Colors.orange,
                      ),
                      const SizedBox(height: 12),
                      _buildCategoryTitle("With DO/DOES/DID"),
                      _buildExampleBox(
                        "You don't like coffee, do you?",
                        "Kamu tidak suka kopi, ya?",
                        Colors.orange,
                      ),
                      _buildExampleBox(
                        "She doesn't work here, does she?",
                        "Dia tidak bekerja di sini, kan?",
                        Colors.orange,
                      ),
                      _buildExampleBox(
                        "They didn't go, did they?",
                        "Mereka tidak pergi, kan?",
                        Colors.orange,
                      ),
                      const SizedBox(height: 12),
                      _buildCategoryTitle("With MODAL (can't, couldn't, won't, wouldn't, shouldn't)"),
                      _buildExampleBox(
                        "He can't drive, can he?",
                        "Dia tidak bisa mengemudi, kan?",
                        Colors.orange,
                      ),
                      _buildExampleBox(
                        "They won't help, will they?",
                        "Mereka tidak akan membantu, kan?",
                        Colors.orange,
                      ),

                      const SizedBox(height: 24),

                      // SECTION: Tenses dalam Tag Question
                      _buildSectionTitle("Tag Question pada Berbagai Tenses ⏰", Icons.access_time_rounded),
                      const SizedBox(height: 12),
                      _buildTensesCard(),

                      const SizedBox(height: 24),

                      // SECTION: Special Cases
                      _buildSectionTitle("Kasus Khusus ⚠️", Icons.warning_amber_rounded),
                      const SizedBox(height: 12),
                      _buildSpecialCaseCard(),
                      const SizedBox(height: 12),
                      _buildSpecialCase2Card(),
                      const SizedBox(height: 12),
                      _buildSpecialCase3Card(),

                      const SizedBox(height: 24),

                      // SECTION: Imperative Sentences
                      _buildSectionTitle("Tag Question pada Kalimat Perintah", Icons.campaign_rounded),
                      const SizedBox(height: 12),
                      _buildImperativeCard(),

                      const SizedBox(height: 24),

                      // SECTION: Let's
                      _buildSectionTitle("Tag Question dengan Let's", Icons.group_rounded),
                      const SizedBox(height: 12),
                      _buildLetsCard(),

                      const SizedBox(height: 24),

                      // SECTION: Common Mistakes
                      _buildSectionTitle("Kesalahan yang Sering Terjadi ❌", Icons.error_outline_rounded),
                      const SizedBox(height: 12),
                      _buildCommonMistakesCard(),

                      const SizedBox(height: 24),

                      // TIPS CARD
                      _buildTipsCard(),

                      const SizedBox(height: 24),

                      // SUMMARY CARD
                      _buildSummaryCard(),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // CUSTOM HEADER
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade600],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.book_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Penjelasan Materi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "Pelajari Tag Question Lengkap 📚",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // LOTTIE ANIMATION CARD
  Widget _buildLottieCard() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade300, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: _buildLottieAnimation(),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.auto_stories_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Mari Belajar Tag Question!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // LOTTIE ANIMATION WIDGET
  Widget _buildLottieAnimation() {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 100)),
      builder: (context, snapshot) {
        return Lottie.asset(
          "assets/lottie/materi.json",
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Lottie.network(
              'https://lottie.host/embed/4b5e8c9d-3a2f-4e1b-9c8e-1d2f3a4b5c6d/abc123xyz.json',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return _buildCustomIllustration();
              },
            );
          },
        );
      },
    );
  }

  // CUSTOM ILLUSTRATION (Fallback)
  Widget _buildCustomIllustration() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
            const Icon(
              Icons.menu_book_rounded,
              size: 60,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "📖 Materi Pembelajaran",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // INTRO CARD
  Widget _buildIntroCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Belajar! 🎓",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Pahami konsep Tag Question dengan mudah dan lengkap",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SECTION TITLE
  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.blue.shade600,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }

  // CATEGORY TITLE
  Widget _buildCategoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade700,
        ),
      ),
    );
  }

  // DEFINITION CARD
  Widget _buildDefinitionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.info_rounded,
                  color: Colors.blue.shade600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Definisi",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Tag Question adalah bentuk kalimat tanya singkat yang ditambahkan di akhir kalimat untuk meminta persetujuan, konfirmasi, atau memastikan informasi dari lawan bicara.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // FUNCTION CARD
  Widget _buildFunctionCard() {
    final functions = [
      {
        "icon": Icons.check_circle_outline,
        "title": "Meminta Persetujuan",
        "desc": "Meminta lawan bicara untuk setuju dengan pernyataan kita",
        "example": "It's a nice day, isn't it?",
        "color": Colors.blue
      },
      {
        "icon": Icons.help_outline,
        "title": "Meminta Konfirmasi",
        "desc": "Memastikan kebenaran informasi yang kita sampaikan",
        "example": "You're coming tomorrow, aren't you?",
        "color": Colors.green
      },
      {
        "icon": Icons.forum_outlined,
        "title": "Memulai Percakapan",
        "desc": "Membuka topik pembicaraan dengan lawan bicara",
        "example": "Nice weather today, isn't it?",
        "color": Colors.orange
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: functions.asMap().entries.map((entry) {
          int index = entry.key;
          var func = entry.value;
          bool isLast = index == functions.length - 1;
          
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: isLast ? null : Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (func["color"] as MaterialColor).shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        func["icon"] as IconData,
                        color: (func["color"] as MaterialColor).shade600,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        func["title"] as String,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        func["desc"] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: (func["color"] as MaterialColor).shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          func["example"] as String,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: (func["color"] as MaterialColor).shade700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // PATTERN CARD
  Widget _buildPatternCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  "Statement + , + Tag Question + ?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPatternItem("Positif (+)", "Negatif (-)", Colors.green),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.grey.shade300,
                    ),
                    _buildPatternItem("Negatif (-)", "Positif (+)", Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatternItem(String statement, String tag, MaterialColor color) {
    return Column(
      children: [
        Text(
          statement,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color.shade700,
          ),
        ),
        const SizedBox(height: 4),
        Icon(Icons.arrow_downward, color: color.shade400, size: 20),
        const SizedBox(height: 4),
        Text(
          tag,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color.shade700,
          ),
        ),
      ],
    );
  }

  // RULES CARD
  Widget _buildRulesCard() {
    final rules = [
      {
        "icon": Icons.arrow_forward_rounded,
        "text": "Kalimat positif → tag negatif",
        "color": Colors.green
      },
      {
        "icon": Icons.arrow_forward_rounded,
        "text": "Kalimat negatif → tag positif",
        "color": Colors.orange
      },
      {
        "icon": Icons.sync_rounded,
        "text": "Gunakan auxiliary verb yang sama dengan kalimat utama",
        "color": Colors.blue
      },
      {
        "icon": Icons.person_rounded,
        "text": "Gunakan subjek pronomina (you, he, she, they, it, we)",
        "color": Colors.purple
      },
      {
        "icon": Icons.schedule_rounded,
        "text": "Perhatikan tense yang digunakan dalam kalimat utama",
        "color": Colors.teal
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: rules.asMap().entries.map((entry) {
          int index = entry.key;
          var rule = entry.value;
          bool isLast = index == rules.length - 1;
          
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: isLast ? null : Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (rule["color"] as MaterialColor).shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    rule["icon"] as IconData,
                    color: (rule["color"] as MaterialColor).shade600,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    rule["text"] as String,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // TENSES CARD
  Widget _buildTensesCard() {
    final tenses = [
      {
        "tense": "Simple Present",
        "positive": "She likes tea, doesn't she?",
        "negative": "He doesn't smoke, does he?",
      },
      {
        "tense": "Present Continuous",
        "positive": "They are studying, aren't they?",
        "negative": "She isn't working, is she?",
      },
      {
        "tense": "Simple Past",
        "positive": "You went there, didn't you?",
        "negative": "He didn't come, did he?",
      },
      {
        "tense": "Present Perfect",
        "positive": "She has finished, hasn't she?",
        "negative": "They haven't arrived, have they?",
      },
      {
        "tense": "Future (will)",
        "positive": "You will help, won't you?",
        "negative": "She won't leave, will she?",
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: tenses.asMap().entries.map((entry) {
          int index = entry.key;
          var tense = entry.value;
          bool isLast = index == tenses.length - 1;
          
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: isLast ? null : Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tense["tense"] as String,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.add_circle, color: Colors.green.shade400, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tense["positive"] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.remove_circle, color: Colors.orange.shade400, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tense["negative"] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // EXAMPLE BOX
  Widget _buildExampleBox(String eng, String indo, MaterialColor color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.shade200, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.translate_rounded,
                  color: color.shade600,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  eng,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              "🇮🇩 $indo",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // INFO BOX
  Widget _buildInfoBox(String text, IconData icon, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: color.shade600, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: color.shade900,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SPECIAL CASE CARD 1
  Widget _buildSpecialCaseCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber.shade300, Colors.orange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.priority_high_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "Kasus 1: I am",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Khusus untuk 'I am', tag question-nya adalah 'aren't I?' (bukan 'am I not?')",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.95),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "I am your friend, aren't I?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "🇮🇩 Aku temanmu, kan?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SPECIAL CASE CARD 2
  Widget _buildSpecialCase2Card() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink.shade300, Colors.pink.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "Kasus 2: This/That",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Untuk subjek 'this' atau 'that', gunakan 'it' dalam tag question",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.95),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "This is your book, isn't it?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "🇮🇩 Ini bukumu, kan?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "That was amazing, wasn't it?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "🇮🇩 Itu luar biasa, kan?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SPECIAL CASE CARD 3
  Widget _buildSpecialCase3Card() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan.shade300, Colors.cyan.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.people_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "Kasus 3: These/Those",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Untuk subjek 'these' atau 'those', gunakan 'they' dalam tag question",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.95),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "These are yours, aren't they?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "🇮🇩 Ini milikmu, kan?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // IMPERATIVE CARD
  Widget _buildImperativeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepPurple.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.info_rounded,
                  color: Colors.deepPurple.shade600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Kalimat Perintah",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Untuk kalimat perintah (imperative), gunakan 'will you?' atau 'won't you?' sebagai tag question.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Close the door, will you?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "🇮🇩 Tutup pintunya, ya?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Open the window, won't you?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "🇮🇩 Buka jendelanya, ya?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // LET'S CARD
  Widget _buildLetsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.lightGreen.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.lightGreen.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.info_rounded,
                  color: Colors.lightGreen.shade600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Let's (Ajakan)",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Untuk kalimat yang dimulai dengan 'Let's', gunakan 'shall we?' sebagai tag question.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's go to the park, shall we?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "🇮🇩 Ayo pergi ke taman, ya?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Let's have dinner together, shall we?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "🇮🇩 Ayo makan malam bersama, ya?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // COMMON MISTAKES CARD
  Widget _buildCommonMistakesCard() {
    final mistakes = [
      {
        "wrong": "She is beautiful, is she? ❌",
        "right": "She is beautiful, isn't she? ✅",
        "reason": "Kalimat positif harus menggunakan tag negatif"
      },
      {
        "wrong": "They don't eat meat, don't they? ❌",
        "right": "They don't eat meat, do they? ✅",
        "reason": "Kalimat negatif harus menggunakan tag positif"
      },
      {
        "wrong": "You likes coffee, don't you? ❌",
        "right": "You like coffee, don't you? ✅",
        "reason": "Subject 'you' menggunakan verb bentuk dasar"
      },
      {
        "wrong": "I am late, am I not? ❌",
        "right": "I am late, aren't I? ✅",
        "reason": "Tag question untuk 'I am' adalah 'aren't I?'"
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: mistakes.asMap().entries.map((entry) {
          int index = entry.key;
          var mistake = entry.value;
          bool isLast = index == mistakes.length - 1;
          
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: isLast ? null : Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mistake["wrong"] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  mistake["right"] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.amber.shade700, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          mistake["reason"] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // TIPS CARD
  Widget _buildTipsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade300, Colors.purple.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.lightbulb_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  "Tips Belajar 💡",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTipItem("1. Perhatikan kata kerja bantu (auxiliary verb) di kalimat utama"),
          _buildTipItem("2. Ingat pola: positif → negatif, negatif → positif"),
          _buildTipItem("3. Pastikan tense tag question sama dengan kalimat utama"),
          _buildTipItem("4. Gunakan subjek pronomina yang sesuai"),
          _buildTipItem("5. Latihan dengan berbagai contoh untuk pemahaman lebih baik"),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SUMMARY CARD
  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade400, Colors.green.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Ringkasan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Tag Question adalah kalimat tanya singkat di akhir kalimat untuk meminta konfirmasi. Ingat pola dasarnya: kalimat positif menggunakan tag negatif, dan sebaliknya. Perhatikan auxiliary verb dan tense yang digunakan!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.95),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.emoji_events_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Selamat Belajar!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}