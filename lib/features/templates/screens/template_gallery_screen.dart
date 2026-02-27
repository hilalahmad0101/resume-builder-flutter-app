import 'package:flutter/material.dart';
import 'package:resumebuilder/common/widgets/dashboard_bottom_nav.dart';
import 'package:resumebuilder/utils/constants/colors.dart';

class TemplateGalleryScreen extends StatefulWidget {
  const TemplateGalleryScreen({super.key});

  @override
  State<TemplateGalleryScreen> createState() => _TemplateGalleryScreenState();
}

class _TemplateGalleryScreenState extends State<TemplateGalleryScreen> {
  final List<String> categories = [
    'All',
    'Modern',
    'Professional',
    'Creative',
    'Executive',
  ];
  String selectedCategory = 'All';

  final List<Map<String, String>> templates = [
    {
      'title': 'The Minimalist',
      'subtitle': 'Modern & Simple',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuALuqJ1hZov43F2oo6yM0Tm3Upv_23kqH-3Kqa6N7QYFXpqpq8PmQDXqC3WT69rFWfmagMar8Slue5g5G3VRbi8sOh-IMddATkmxrbbzPFXOhvYcUf7VAHOImd29hrYp8KGXm4u7NRFP-lhluKP21wO6OEBIsEHCWqL_-9m0m7ZTZnczMf9hY08O5p-J5L-4EDacbeviUU7CytPzMMJUPlXXBHpII6gspI3HkT1Agc11-PN22yWw6RvupASfrt_St_-WCt1W6ZIvv2b',
    },
    {
      'title': 'Corporate Pro',
      'subtitle': 'Business Standard',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDiLRknpqdzb4KYgpjv3YBju6ER6Y41IMtrqzkhEfpmr_mPVs7CijBWwWcOQ2mDxs9KMGCEFF9aTAjqCop4rakvA9Ho37J6T3Rdj1j0pkT2GV9_H0iUG_Eonz82YBr7Tf8Qt7Ol9CDuxQ-p149F4IKseBI65StbOprfL8akXfcJkhoMEizRkIr6H3gQ-U3jissoBr9jP6qPm7g-Hy00A5ol8ayHnvxaHgbewFXOlHsPoRhUift_wl4L1V77wRV7d1a0jN9e-HKgcps8',
    },
    {
      'title': 'Artistic Edge',
      'subtitle': 'Bold & Visual',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCt5-Rf2bgDFC3pJh4g1JrkQdEI7OQjmkqG4NIxssjZlW58TcjgLcQcXBe5Ujgyip86heY3PsWTc7bEsiIGxKsIrkeA407-jXdruktOGQDdCC-jzjvFKxcAH45Wj0yKy3D5C-BYo0PlKMnsPaTZC598-s7X2j2GLru2PpuCruDQTjhtG6ucijdNStdyIT3P2EeUa0Sw1vhmSnCBTrsK-C8FZxOSsr8u97Jvi0ZWj_9OaPH3mQueWW9vObrhX7-FEW0VMAgoZzwhVbV1',
    },
    {
      'title': 'Executive Suite',
      'subtitle': 'Senior Leadership',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCJ7sriIvbaBc0_3QBC9o87FtC96VW0IB0khCuJljHdHWxpllF-oTZGv3KKGlzTs02YxpSD4F_zZrWDJtELFNUsDERSU1vCoZ_ZkXxWy2Jf7rmoTrZ71x1riTpZBZbMce88PzcBCP0giztoqB98LT3gyk-3KV0zFZG9RtUFEBDpl4sU5kItwmx3OIooqfqf6X5wUEBfTHUP7bhi65hV_aLiCJSkIrqieKvPP27WE9S4V-4km92iAS5FB9yBShnEjxJTtOrkAkZq66fS',
    },
    {
      'title': 'Tech Specialist',
      'subtitle': 'Software Engineer',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBAhIkCZM979OTMMhltGXDMxxdWZdz5-bgqxufygMCDDduvcbuGdeLzxL_gMlL6NDt3bY_pkgM7pOgjcyw7Z_d2n6_3DdfA9QDKmvxzXrdWvqRy3SPn1esLeOshUc9qsNMyEcGtHuG2UdSy6cgqYoXzHHMSSL1hoz5w1e6VJmLNETPw6DZ_6u2u_DVHgAdMZ0T99ZYT14VizS1mhMqzNPvFH25-mavmnXHX9tzGlxuo19bYjVy51fam-WG0bOlFKVud7yGIyx3Kk_CD',
    },
    {
      'title': 'Academic CV',
      'subtitle': 'Research Focused',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBLHcnoIRFjZ_hEtGlQykRpRX9uzo-KbwffnUYYgNLO-m6QGxW2Oreb1_WhAU8SrcclcNciPfgA6typAuQNU7BV3mszC_qSpwkv1q0Ps4Rvuhw0jBVlcPL8fYgjNSqyWfEFK0LiBTAqAE5GJPkxAT4Dt0m0C2hEafdNYDhr0DBvUW2vMeoGZVbJ_iV7mFbrKZFxkJaYn3LiqTVfwH3hPOlcTLCObOB-Br1xMF8BZiRNj8IkZ9Bq0KFQuVomvHgn3PMlZHgwmozBYmYd',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? UColors.backgroundDarkColor
          : UColors.backgroundLightColor,
      appBar: AppBar(
        backgroundColor: isDark ? UColors.backgroundDarkColor : Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          'Template Gallery',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _buildFilterChips(isDark),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.62,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          return _buildTemplateCard(isDark, templates[index]);
        },
      ),
      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 1),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => setState(() => selectedCategory = category),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? UColors.primaryColor
                      : (isDark
                            ? const Color(0xFF1E293B)
                            : const Color(0xFFF1F5F9)),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: UColors.primaryColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : (isDark ? Colors.grey[300] : Colors.grey[700]),
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTemplateCard(bool isDark, Map<String, String> template) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                template['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: isDark ? Colors.grey[800] : Colors.grey[100],
                  child: const Icon(Icons.description_outlined),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          template['title']!,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          template['subtitle']!,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 36,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: UColors.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Use This'),
          ),
        ),
      ],
    );
  }
}
