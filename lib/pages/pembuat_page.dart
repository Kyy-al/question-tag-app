import 'package:flutter/material.dart';
import 'dart:math' as math;

class WordWondersGamePage extends StatefulWidget {
  const WordWondersGamePage({super.key});

  @override
  State<WordWondersGamePage> createState() => _WordWondersGamePageState();
}

class _WordWondersGamePageState extends State<WordWondersGamePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  
  // Data soal
  final List<Map<String, dynamic>> _questions = [
    {
      'sentence': 'She is beautiful',
      'tagQuestion': "isn't she",
      'letters': ['i', 's', 'n', "'", 't', 's', 'h', 'e'],
    },
    {
      'sentence': 'They can swim',
      'tagQuestion': "can't they",
      'letters': ['c', 'a', 'n', "'", 't', 't', 'h', 'e', 'y'],
    },
    {
      'sentence': 'He will come',
      'tagQuestion': "won't he",
      'letters': ['w', 'o', 'n', "'", 't', 'h', 'e'],
    },
    {
      'sentence': 'You are ready',
      'tagQuestion': "aren't you",
      'letters': ['a', 'r', 'e', 'n', "'", 't', 'y', 'o', 'u'],
    },
    {
      'sentence': 'We should go',
      'tagQuestion': "shouldn't we",
      'letters': ['s', 'h', 'o', 'u', 'l', 'd', 'n', "'", 't', 'w', 'e'],
    },
  ];

  int _currentQuestionIndex = 0;
  String _currentAnswer = '';
  List<int> _selectedIndices = [];
  bool _isCorrect = false;
  bool _showResult = false;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _onLetterTap(int index) {
    if (_selectedIndices.contains(index) || _showResult) return;

    setState(() {
      _selectedIndices.add(index);
      _currentAnswer += _questions[_currentQuestionIndex]['letters'][index];
    });

    _checkAnswer();
  }

  void _checkAnswer() {
    String correctAnswer = _questions[_currentQuestionIndex]['tagQuestion'];
    
    if (_currentAnswer.length >= correctAnswer.length) {
      setState(() {
        _isCorrect = _currentAnswer == correctAnswer;
        _showResult = true;
        if (_isCorrect) {
          _score += 10;
        }
      });

      Future.delayed(const Duration(milliseconds: 1500), () {
        _nextQuestion();
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _resetAnswer();
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _resetAnswer() {
    setState(() {
      _currentAnswer = '';
      _selectedIndices.clear();
      _showResult = false;
      _isCorrect = false;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('🎉 Selamat!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Skor Akhir: $_score',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Kamu telah menyelesaikan semua soal!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentQuestionIndex = 0;
                _score = 0;
                _resetAnswer();
              });
            },
            child: const Text('Main Lagi'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo.shade400,
              Colors.purple.shade300,
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
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildQuestionCard(),
                      const SizedBox(height: 30),
                      _buildAnswerDisplay(),
                      const SizedBox(height: 40),
                      _buildLetterCircle(),
                      const SizedBox(height: 30),
                      _buildResetButton(),
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

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Skor: $_score',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Lengkapi Tag Question:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _questions[_currentQuestionIndex]['sentence'] + ', _____?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerDisplay() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: _showResult
            ? (_isCorrect ? Colors.green.shade50 : Colors.red.shade50)
            : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: _showResult
              ? (_isCorrect ? Colors.green : Colors.red)
              : Colors.white.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_showResult)
            Icon(
              _isCorrect ? Icons.check_circle : Icons.cancel,
              color: _isCorrect ? Colors.green : Colors.red,
              size: 24,
            ),
          if (_showResult) const SizedBox(width: 8),
          Flexible(
            child: Text(
              _currentAnswer.isEmpty ? 'Jawaban kamu...' : _currentAnswer,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _showResult
                    ? (_isCorrect ? Colors.green : Colors.red)
                    : Colors.white,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLetterCircle() {
    List<String> letters = _questions[_currentQuestionIndex]['letters'];
    int letterCount = letters.length;

    return SizedBox(
      width: 280,
      height: 280,
      child: AnimatedBuilder(
        animation: _rotationController,
        builder: (context, child) {
          return Stack(
            children: [
              // Center circle
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.shuffle,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              // Letter circles
              ...List.generate(letterCount, (index) {
                double angle = (2 * math.pi * index / letterCount);
                double radius = 110;
                double x = radius * math.cos(angle);
                double y = radius * math.sin(angle);

                bool isSelected = _selectedIndices.contains(index);

                return Positioned(
                  left: 140 + x - 30,
                  top: 140 + y - 30,
                  child: GestureDetector(
                    onTap: () => _onLetterTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? Colors.grey.shade400
                            : Colors.white,
                        boxShadow: isSelected
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                      ),
                      child: Center(
                        child: Text(
                          letters[index],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.grey.shade600
                                : Colors.indigo.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildResetButton() {
    return ElevatedButton.icon(
      onPressed: _showResult ? null : _resetAnswer,
      icon: const Icon(Icons.refresh),
      label: const Text('Reset Jawaban'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
    );
  }
}