import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class LatihanPage extends StatefulWidget {
  const LatihanPage({super.key});

  @override
  State<LatihanPage> createState() => _LatihanPageState();
}

class _LatihanPageState extends State<LatihanPage> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  String? selectedAnswer;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late List<Map<String, dynamic>> randomizedQuestions;

  final List<Map<String, dynamic>> allQuestions = [
    {
      "question": "She is beautiful, ___?",
      "options": ["isn't she", "is she", "does she"],
      "answer": "isn't she",
      "explanation": "Karena kalimat positif dengan 'is', tag question-nya adalah 'isn't she'"
    },
    {
      "question": "They don't eat meat, ___?",
      "options": ["do they", "don't they", "are they"],
      "answer": "do they",
      "explanation": "Karena kalimat negatif dengan 'don't', tag question-nya adalah 'do they'"
    },
    {
      "question": "He can drive a car, ___?",
      "options": ["can't he", "can he", "does he"],
      "answer": "can't he",
      "explanation": "Karena kalimat positif dengan 'can', tag question-nya adalah 'can't he'"
    },
    {
      "question": "You aren't busy, ___?",
      "options": ["are you", "aren't you", "do you"],
      "answer": "are you",
      "explanation": "Karena kalimat negatif dengan 'aren't', tag question-nya adalah 'are you'"
    },
    {
      "question": "We should go now, ___?",
      "options": ["shouldn't we", "should we", "don't we"],
      "answer": "shouldn't we",
      "explanation": "Karena kalimat positif dengan 'should', tag question-nya adalah 'shouldn't we'"
    },
    {
      "question": "Tom hasn't arrived yet, ___?",
      "options": ["has he", "hasn't he", "does he"],
      "answer": "has he",
      "explanation": "Karena kalimat negatif dengan 'hasn't', tag question-nya adalah 'has he'"
    },
    {
      "question": "Your sister plays guitar, ___?",
      "options": ["doesn't she", "does she", "isn't she"],
      "answer": "doesn't she",
      "explanation": "Karena kalimat positif dengan verb 'plays', tag question-nya adalah 'doesn't she'"
    },
    {
      "question": "It won't rain tomorrow, ___?",
      "options": ["will it", "won't it", "does it"],
      "answer": "will it",
      "explanation": "Karena kalimat negatif dengan 'won't', tag question-nya adalah 'will it'"
    },
    {
      "question": "They were at the party, ___?",
      "options": ["weren't they", "were they", "did they"],
      "answer": "weren't they",
      "explanation": "Karena kalimat positif dengan 'were', tag question-nya adalah 'weren't they'"
    },
    {
      "question": "You don't like coffee, ___?",
      "options": ["do you", "don't you", "are you"],
      "answer": "do you",
      "explanation": "Karena kalimat negatif dengan 'don't', tag question-nya adalah 'do you'"
    },
    {
      "question": "Sarah is coming to the meeting, ___?",
      "options": ["isn't she", "is she", "doesn't she"],
      "answer": "isn't she",
      "explanation": "Karena kalimat positif dengan 'is', tag question-nya adalah 'isn't she'"
    },
    {
      "question": "They didn't call you, ___?",
      "options": ["did they", "didn't they", "do they"],
      "answer": "did they",
      "explanation": "Karena kalimat negatif dengan 'didn't', tag question-nya adalah 'did they'"
    },
    {
      "question": "He will help us, ___?",
      "options": ["won't he", "will he", "doesn't he"],
      "answer": "won't he",
      "explanation": "Karena kalimat positif dengan 'will', tag question-nya adalah 'won't he'"
    },
    {
      "question": "You can speak English, ___?",
      "options": ["can't you", "can you", "do you"],
      "answer": "can't you",
      "explanation": "Karena kalimat positif dengan 'can', tag question-nya adalah 'can't you'"
    },
    {
      "question": "The students weren't late, ___?",
      "options": ["were they", "weren't they", "did they"],
      "answer": "were they",
      "explanation": "Karena kalimat negatif dengan 'weren't', tag question-nya adalah 'were they'"
    },
    {
      "question": "Lisa has finished her homework, ___?",
      "options": ["hasn't she", "has she", "doesn't she"],
      "answer": "hasn't she",
      "explanation": "Karena kalimat positif dengan 'has', tag question-nya adalah 'hasn't she'"
    },
    {
      "question": "We aren't going to be late, ___?",
      "options": ["are we", "aren't we", "do we"],
      "answer": "are we",
      "explanation": "Karena kalimat negatif dengan 'aren't', tag question-nya adalah 'are we'"
    },
    {
      "question": "Your brother doesn't work here, ___?",
      "options": ["does he", "doesn't he", "is he"],
      "answer": "does he",
      "explanation": "Karena kalimat negatif dengan 'doesn't', tag question-nya adalah 'does he'"
    },
    {
      "question": "They could solve the problem, ___?",
      "options": ["couldn't they", "could they", "did they"],
      "answer": "couldn't they",
      "explanation": "Karena kalimat positif dengan 'could', tag question-nya adalah 'couldn't they'"
    },
    {
      "question": "She won't forget us, ___?",
      "options": ["will she", "won't she", "does she"],
      "answer": "will she",
      "explanation": "Karena kalimat negatif dengan 'won't', tag question-nya adalah 'will she'"
    },
  ];

  @override
  void initState() {
    super.initState();
    // Randomize questions
    randomizedQuestions = List.from(allQuestions);
    randomizedQuestions.shuffle(Random());
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void checkAnswer(String option) {
    setState(() {
      selectedAnswer = option;
    });
  }

  void nextQuestion() {
    if (currentIndex < randomizedQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  void resetQuiz() {
    setState(() {
      randomizedQuestions.shuffle(Random());
      currentIndex = 0;
      selectedAnswer = null;
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    var q = randomizedQuestions[currentIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade50,
              Colors.teal.shade50,
              Colors.blue.shade50,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLottieCard(),
                        const SizedBox(height: 20),
                        _buildProgressCard(),
                        const SizedBox(height: 24),
                        _buildQuestionCard(q),
                        const SizedBox(height: 24),

                        for (var option in q["options"])
                          _buildOption(option, q["answer"]),

                        if (selectedAnswer != null) ...[
                          const SizedBox(height: 16),
                          _buildExplanationCard(q),
                        ],

                        const SizedBox(height: 24),
                        _buildNavigationButtons(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
                colors: [Colors.green.shade400, Colors.green.shade600],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.edit_note_rounded,
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
                  "Latihan Soal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "Belajar dengan feedback langsung ✏️",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade600],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  "${currentIndex + 1}/${randomizedQuestions.length}",
                  style: const TextStyle(
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

  Widget _buildLottieCard() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade400, Colors.green.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: _buildLottieAnimation(),
            ),
          ),
          Positioned(
            top: 16,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.shuffle_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Random Mode",
                    style: TextStyle(
                      fontSize: 12,
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

  Widget _buildLottieAnimation() {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 100)),
      builder: (context, snapshot) {
        return Lottie.asset(
          "assets/lottie/latihan.json",
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Lottie.network(
              'https://lottie.host/embed/6c7d8e9f-4b2c-5d3e-8f9a-2b3c4d5e6f7g/def456uvw.json',
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

  Widget _buildCustomIllustration() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
            const Icon(
              Icons.edit_note_rounded,
              size: 50,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "✏️ Latihan Soal",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    double progress = (currentIndex + 1) / randomizedQuestions.length;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latihan ${currentIndex + 1}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${currentIndex + 1}/${randomizedQuestions.length}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.green.shade50,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade500),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${(progress * 100).toInt()}% Complete",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Map<String, dynamic> q) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.green.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
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
                  Icons.edit_note_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Pilih jawaban yang tepat",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            q["question"],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String option, String answer) {
    bool selected = option == selectedAnswer;
    bool correct = option == answer;
    bool showAnswer = selectedAnswer != null;

    Color backgroundColor() {
      if (!showAnswer) return Colors.white;
      if (correct) return Colors.green.shade50;
      if (selected && !correct) return Colors.red.shade50;
      return Colors.white;
    }

    Color borderColor() {
      if (!showAnswer) return Colors.grey.shade300;
      if (correct) return Colors.green.shade400;
      if (selected && !correct) return Colors.red.shade400;
      return Colors.grey.shade300;
    }

    IconData? getIcon() {
      if (!showAnswer) return null;
      if (correct) return Icons.check_circle_rounded;
      if (selected && !correct) return Icons.cancel_rounded;
      return null;
    }

    Color? getIconColor() {
      if (!showAnswer) return null;
      if (correct) return Colors.green.shade600;
      if (selected && !correct) return Colors.red.shade600;
      return null;
    }

    return GestureDetector(
      onTap: selectedAnswer == null ? () => checkAnswer(option) : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
          boxShadow: [
            if (selected || correct)
              BoxShadow(
                color: borderColor().withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            if (getIcon() != null)
              Icon(
                getIcon(),
                color: getIconColor(),
                size: 28,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanationCard(Map<String, dynamic> q) {
    bool isCorrect = selectedAnswer == q["answer"];
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCorrect ? Colors.green.shade200 : Colors.orange.shade200,
          width: 2,
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
                  color: isCorrect ? Colors.green.shade100 : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isCorrect ? Icons.lightbulb_rounded : Icons.info_rounded,
                  color: isCorrect ? Colors.green.shade700 : Colors.orange.shade700,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                isCorrect ? "Benar! 🎉" : "Penjelasan 💡",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCorrect ? Colors.green.shade700 : Colors.orange.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            q["explanation"],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    if (currentIndex < randomizedQuestions.length - 1) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: selectedAnswer == null ? null : nextQuestion,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green.shade500,
            disabledBackgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: selectedAnswer == null ? 0 : 5,
            shadowColor: Colors.green.withOpacity(0.5),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lanjut",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _showCompletionDialog(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green.shade500,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            shadowColor: Colors.green.withOpacity(0.5),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selesai",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.check_circle_rounded),
            ],
          ),
        ),
      );
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade50,
                Colors.teal.shade50,
              ],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 120,
                child: Lottie.asset(
                  "assets/lottie/success.json",
                  repeat: false,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green.shade400, Colors.green.shade600],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.white,
                        size: 48,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "Latihan Selesai! 🎉",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                "Kamu sudah menyelesaikan semua latihan soal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lightbulb_rounded,
                      color: Colors.amber.shade600,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Ulangi latihan untuk memperdalam pemahaman",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        resetQuiz();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.green.shade400, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Ulangi",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.green.shade500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Selesai",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}