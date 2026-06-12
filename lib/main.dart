import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C9A7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;
  bool _isDarkMode = true;

  Color get _navy => _isDarkMode
      ? const Color(0xFF0D1B2A)
      : const Color(0xFFF3F6FA);
  Color get _card => _isDarkMode
      ? const Color(0xFF1A2E42)
      : const Color(0xFFFFFFFF);
  Color get _border => _isDarkMode
      ? const Color(0xFF243C54)
      : const Color(0xFFE2E8F0);
  Color get _teal => const Color(0xFF00C9A7);
  Color get _textPri => _isDarkMode
      ? const Color(0xFFEAF0FB)
      : const Color(0xFF15233A);
  // FIX 1: darker secondary text in light mode for bio & labels
  Color get _textSec => _isDarkMode
      ? const Color(0xFF8BA3BC)
      : const Color(0xFF374151);
  Color get _online => const Color(0xFF22C55E);

  // FIX 2: button background for light mode
  Color get _buttonCard => _isDarkMode
      ? _card
      : const Color(0xFFE8F0FE);
  // FIX 3: button border for light mode
  Color get _buttonBorder => _isDarkMode
      ? _border
      : const Color(0xFF94A3B8);

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  void _toggleThemeMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _navy,

      appBar: AppBar(
        backgroundColor: _navy,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(Icons.arrow_back_ios_new_rounded,
              color: _textSec, size: 20),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: _textPri,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              onPressed: _toggleThemeMode,
              icon: Icon(
                _isDarkMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
                color: _textSec,
              ),
              tooltip: _isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert_rounded, color: _textSec),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HERO: banner + avatar
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0A3D62), Color(0xFF00C9A7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(children: [
                    Positioned(
                      top: -30, right: -20,
                      child: Container(
                        width: 130, height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.07),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20, left: 50,
                      child: Container(
                        width: 70, height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                    ),
                  ]),
                ),

                Positioned(
                  bottom: -52,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _navy,
                            border: Border.all(color: _teal, width: 3),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xFF0A3D62), Color(0xFF00C9A7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 56,
                            ),
                          ),
                        ),
                        Container(
                          width: 20, height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _online,
                            border: Border.all(color: _navy, width: 2.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 64),

            // NAME + DESIGNATION
            Center(
              child: Column(
                children: [
                  Text(
                    'Suchana Das',
                    style: TextStyle(
                      color: _textPri,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: _teal.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: _teal.withValues(alpha: 0.35), width: 1),
                    ),
                    child: Text(
                      'Full Stack Web Developer • Flutter Enthusiast',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _teal,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // STATS ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: _buildStatCard('42', 'Projects')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildStatCard('1.8k', 'Followers')),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // BUTTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Follow button
                  Expanded(
                    child: GestureDetector(
                      onTap: _toggleFollow,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: _isFollowing
                              ? Colors.transparent
                              : _teal,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: _teal,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isFollowing
                                  ? Icons.check_circle_outline_rounded
                                  : Icons.person_add_alt_1_rounded,
                              color: _isFollowing ? _teal : _navy,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isFollowing ? 'Following' : 'Follow',
                              style: TextStyle(
                                color: _isFollowing ? _teal : _navy,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Message button — FIX: visible bg + border in light mode
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: _buttonCard,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _buttonBorder, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_outline_rounded,
                              color: _textPri, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            'Message',
                            style: TextStyle(
                              color: _textPri,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Call button — FIX: visible bg + border in light mode
                  Container(
                    width: 52, height: 52,
                    decoration: BoxDecoration(
                      color: _buttonCard,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: _buttonBorder, width: 1),
                    ),
                    child: Center(
                      child: Icon(Icons.call_outlined,
                          color: _teal, size: 22),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ABOUT ME SECTION
            _buildSection(
              label: 'About Me',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Software Engineering student with a passion for building '
                      'clean, user-friendly apps. Currently exploring Flutter & mobile development '
                      'alongside my full-stack web skills in Laravel & Vue.js. I love turning '
                      'ideas into real, working applications.',
                  style: TextStyle(
                    color: _textSec,
                    fontSize: 14.5,
                    height: 1.7,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // PROFILE DETAILS
            _buildSection(
              label: 'Details',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: _card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _border, width: 1),
                  ),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        Icons.mail_outline_rounded,
                        'Email',
                        'suchanadas541@gmail.com',
                        isFirst: true,
                      ),
                      _buildDivider(),
                      _buildDetailRow(
                        Icons.badge_outlined,
                        'Student ID',
                        '232-134-014',
                      ),
                      _buildDivider(),
                      _buildDetailRow(
                        Icons.account_balance_outlined,
                        'Department',
                        'Software Engineering',
                      ),
                      _buildDivider(),
                      _buildDetailRow(
                        Icons.groups_outlined,
                        'Batch',
                        '2023-Summer',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  // HELPERS

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _border, width: 1),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: _teal,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: _textSec,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 4, height: 18,
                  decoration: BoxDecoration(
                    color: _teal,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    color: _textPri,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildDetailRow(
      IconData icon,
      String label,
      String value, {
        bool isFirst = false,
        bool isLast = false,
      }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isFirst || isLast ? 14 : 12,
      ),
      child: Row(
        children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(
              color: _teal.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(icon, color: _teal, size: 18)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: _textSec,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: _textPri,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1, thickness: 1, color: _border),
    );
  }
}