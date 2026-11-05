import 'package:flutter/material.dart';
import 'screen_registry.dart';

/// Giao diện tìm kiếm ẩn (Quick Jumper) mở khi người dùng double-tap
/// vào bất kỳ khoảng trống nào trên màn hình. Cho phép tìm kiếm theo
/// số trang (vd: 10, 65, 88), mã màn hình (S65, A01) hoặc tên màn hình.
class QuickScreenJumper extends StatefulWidget {
  const QuickScreenJumper({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const QuickScreenJumper(),
    );
  }

  @override
  State<QuickScreenJumper> createState() => _QuickScreenJumperState();
}

class _QuickScreenJumperState extends State<QuickScreenJumper> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String _searchQuery = '';
  String _selectedFilter = 'all';

  final List<String> _filters = [
    'all',
    'Phần A (S01–S24)',
    'Phần B (S25–S48)',
    'Phần C (S49–S72)',
    'Phần D (S73–S96)',
    'Xác thực (Auth)',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _searchQuery = _controller.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<ScreenMeta> get _filteredScreens {
    return allAppScreens.where((sc) {
      // 1. Lọc theo tab phân hệ
      if (_selectedFilter != 'all' && sc.part != _selectedFilter) {
        return false;
      }

      // 2. Lọc theo từ khóa tìm kiếm
      if (_searchQuery.isEmpty) return true;

      final query = _searchQuery.toLowerCase();
      final code = sc.code.toLowerCase();
      final numStr = sc.number != null ? sc.number.toString() : '';
      final titleEn = sc.titleEn.toLowerCase();
      final titleVi = sc.titleVi.toLowerCase();

      // Khớp chính xác số trang (ví dụ gõ "65" khớp S65)
      if (numStr == query || 's$numStr' == query) return true;

      // Khớp một phần mã hoặc tên
      return code.contains(query) ||
          numStr.contains(query) ||
          titleEn.contains(query) ||
          titleVi.contains(query);
    }).toList()
      ..sort((a, b) {
        // Ưu tiên hiển thị màn hình khớp chính xác số nếu người dùng gõ số
        if (_searchQuery.isNotEmpty) {
          final q = _searchQuery.toLowerCase();
          final aNum = a.number != null ? a.number.toString() : '';
          final bNum = b.number != null ? b.number.toString() : '';
          if (aNum == q || a.code.toLowerCase() == q || 's$aNum' == q) return -1;
          if (bNum == q || b.code.toLowerCase() == q || 's$bNum' == q) return 1;
        }
        return (a.number ?? 0).compareTo(b.number ?? 0);
      });
  }

  void _navigateTo(ScreenMeta screen) {
    Navigator.of(context).pop(); // Đóng bottom sheet
    Navigator.of(context).pushNamed(screen.route);
  }

  @override
  Widget build(BuildContext context) {
    final screens = _filteredScreens;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 6),
            width: 44,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFD5D5DD),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A14B4).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.bolt_rounded,
                    color: Color(0xFF2A14B4),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chuyển nhanh màn hình',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF151C27),
                        ),
                      ),
                      Text(
                        'Tìm kiếm theo số (1–96) hoặc từ khóa',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Color(0xFF777586)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          // Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {
                if (screens.isNotEmpty) {
                  _navigateTo(screens.first);
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF2F3F8),
                hintText: 'Nhập số (vd: 10, 65, 88) hoặc tên màn hình...',
                hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9090A0)),
                prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF2A14B4), size: 22),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.cancel_rounded, color: Color(0xFF9090A0), size: 18),
                        onPressed: () => _controller.clear(),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFF2A14B4), width: 1.5),
                ),
              ),
            ),
          ),

          // Quick Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: _filters.map((filter) {
                final isSelected = _selectedFilter == filter;
                final label = filter == 'all' ? 'Tất cả (98)' : filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(label),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      }
                    },
                    selectedColor: const Color(0xFF2A14B4),
                    backgroundColor: const Color(0xFFF2F3F8),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? Colors.white : const Color(0xFF464554),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                );
              }).toList(),
            ),
          ),

          const Divider(height: 1, color: Color(0xFFE8E8EE)),

          // Results header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              children: [
                Text(
                  'KẾT QUẢ (${screens.length})',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF777586),
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
                if (screens.isNotEmpty && _searchQuery.isNotEmpty)
                  const Text(
                    'Nhấn Enter để mở mục đầu tiên',
                    style: TextStyle(fontSize: 11, color: Color(0xFFFD761A)),
                  ),
              ],
            ),
          ),

          // Screens List
          Expanded(
            child: screens.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.search_off_rounded, size: 48, color: Color(0xFFB0B0C0)),
                          const SizedBox(height: 12),
                          Text(
                            'Không tìm thấy màn hình "$_searchQuery"',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF464554)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Thử nhập số trang từ 1 đến 96',
                            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    itemCount: screens.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final item = screens[index];
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => _navigateTo(item),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAFAFC),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFECEEF4)),
                            ),
                            child: Row(
                              children: [
                                // Code Badge
                                Container(
                                  width: 44,
                                  height: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: item.code.startsWith('A')
                                        ? const Color(0xFF2A14B4)
                                        : const Color(0xFFFD761A),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    item.code,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Title & Part
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${item.titleVi} (${item.titleEn})',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF151C27),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '${item.part} • ${item.route}',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF777586),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color(0xFFB0B0C0),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

