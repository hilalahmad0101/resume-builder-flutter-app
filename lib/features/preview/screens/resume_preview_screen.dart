import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF111827)
          : const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: isDark ? UColors.backgroundDarkColor : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          'Preview & Export',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            color: UColors.primaryColor,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: isDark ? Colors.white10 : const Color(0xFFDBDFE6),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 200),
            child: Column(
              children: [
                _buildResumePaper(context),
                const SizedBox(height: 24),
                _buildEndDocumentMarker(isDark),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildGlassFooter(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildResumePaper(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF1F2937), width: 2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'JOHN DOE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const Text(
                  'Senior Software Engineer',
                  style: TextStyle(
                    color: UColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 4,
                  children: [
                    _buildContactItem(Icons.mail, 'name@example.com'),
                    _buildContactItem(Icons.call, '+1 (555) 000-0000'),
                    _buildContactItem(Icons.location_on, 'San Francisco, CA'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Summary
          _buildResumeSection(
            'Summary',
            'Innovative Software Engineer with 8+ years of experience in building scalable web applications. Expert in React, Node.js, and cloud architecture. Proven track record of leading cross-functional teams and delivering high-impact solutions.',
          ),
          const SizedBox(height: 16),
          // Experience
          _buildSectionTitle('Experience'),
          _buildExperienceItem(
            'Tech Innovators Inc.',
            '2020 — Present',
            'Lead Developer',
            [
              'Headed the architecture of a microservices-based platform serving 1M+ users.',
              'Reduced deployment time by 40% through CI/CD optimization.',
            ],
          ),
          const SizedBox(height: 12),
          _buildExperienceItem(
            'Web Solutions Corp',
            '2016 — 2020',
            'Full Stack Developer',
            [
              'Developed responsive interfaces using React and Redux.',
              'Mentored junior developers and conducted code reviews.',
            ],
          ),
          const SizedBox(height: 16),
          // Education
          _buildSectionTitle('Education'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'University of Technology',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                '2012 — 2016',
                style: TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ],
          ),
          const Text(
            'B.S. in Computer Science',
            style: TextStyle(fontSize: 10, color: Color(0xFF374151)),
          ),
          const SizedBox(height: 16),
          // Skills
          _buildSectionTitle('Skills'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillBadge('JavaScript (ES6+)'),
              _buildSkillBadge('TypeScript'),
              _buildSkillBadge('React/Next.js'),
              _buildSkillBadge('Node.js'),
              _buildSkillBadge('AWS'),
              _buildSkillBadge('Docker'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: const Color(0xFF4B5563)),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 10, color: Color(0xFF4B5563)),
        ),
      ],
    );
  }

  Widget _buildResumeSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        Text(
          content,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF374151),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
    String company,
    String period,
    String role,
    List<String> bullets,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              company,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              period,
              style: const TextStyle(fontSize: 9, color: Colors.grey),
            ),
          ],
        ),
        Text(
          role,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 4),
        ...bullets.map(
          (b) => Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(fontSize: 9, color: Color(0xFF4B5563)),
                ),
                Expanded(
                  child: Text(
                    b,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillBadge(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        skill,
        style: const TextStyle(fontSize: 9, color: Colors.black),
      ),
    );
  }

  Widget _buildEndDocumentMarker(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: isDark ? Colors.white12 : Colors.black12,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'END OF DOCUMENT',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            color: isDark ? Colors.white38 : Colors.black38,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 1,
            color: isDark ? Colors.white12 : Colors.black12,
          ),
        ),
      ],
    );
  }

  Widget _buildGlassFooter(bool isDark) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xCC101622)
                : Colors.white.withOpacity(0.9),
            border: Border(
              top: BorderSide(
                color: isDark ? Colors.white10 : const Color(0xFFDBDFE6),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text(
                    'Download PDF',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: UColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 10,
                    shadowColor: UColors.primaryColor.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildSecondaryButton(isDark, Icons.share, 'Share'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSecondaryButton(isDark, Icons.edit, 'Edit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(bool isDark, IconData icon, String label) {
    return SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: isDark ? Colors.white : Colors.black,
          side: BorderSide(
            color: isDark ? Colors.white12 : const Color(0xFFDBDFE6),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        ),
      ),
    );
  }
}
