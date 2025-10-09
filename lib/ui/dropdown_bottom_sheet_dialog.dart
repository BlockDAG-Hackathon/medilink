import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownBottomSheetDialog extends StatelessWidget {
  final String title;
  final String placeholder;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String> onChanged;

  const DropdownBottomSheetDialog({
    super.key,
    required this.title,
    required this.placeholder,
    required this.options,
    required this.onChanged,
    this.selectedValue,
  });

  void _showOptionsModal(BuildContext context) async {
    final selectedOption = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      // Shape applied for rounded corners at the top
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return _OptionsBottomSheet(title: title, options: options);
      },
    );

    if (selectedOption != null) {
      onChanged(selectedOption);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the Grey Border
    const greyBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );

    return InkWell(
      onTap: () => _showOptionsModal(context),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily),
          border: greyBorder,
          enabledBorder: greyBorder,
          focusedBorder: greyBorder.copyWith(
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          ),

          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          selectedValue ?? 'Tap to select',
          style: TextStyle(
            color: selectedValue == null ? Colors.grey : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

/// 2. The Bottom Modal Sheet with Search Functionality
class _OptionsBottomSheet extends StatefulWidget {
  final String title;
  final List<String> options;

  const _OptionsBottomSheet({required this.title, required this.options});

  @override
  State<_OptionsBottomSheet> createState() => _OptionsBottomSheetState();
}

class _OptionsBottomSheetState extends State<_OptionsBottomSheet> {
  late List<String> _filteredOptions;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
    _searchController.addListener(_filterOptions);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterOptions);
    _searchController.dispose();
    super.dispose();
  }

  void _filterOptions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredOptions = widget.options
          .where((option) => option.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modalHeight = MediaQuery.of(context).size.height * 0.8;

    return Container(
      height: modalHeight,
      // 💥 White background for the bottom sheet content
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Drag handle
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 12),
          ),

          // Header and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Search Bar (using light grey fill for contrast)
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors
                  .grey[100], // Light grey background for the search field
              contentPadding: EdgeInsets.zero,
            ),
          ),

          const SizedBox(height: 16),

          // Options List
          Expanded(
            child: ListView.builder(
              itemCount: _filteredOptions.length,
              itemBuilder: (context, index) {
                final option = _filteredOptions[index];
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    Navigator.pop(context, option);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
