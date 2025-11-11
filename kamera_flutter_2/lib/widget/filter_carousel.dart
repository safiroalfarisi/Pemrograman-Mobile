import 'package:flutter/material.dart';
import 'filter_selector.dart';

class PhotoFilterCarousel extends StatelessWidget {
  final List<Color> filters;
  final Color activeFilter;
  final ValueChanged<Color> onFilterChanged;
  final VoidCallback onFilterTapCapture;

  const PhotoFilterCarousel({
    super.key,
    required this.filters,
    required this.activeFilter,
    required this.onFilterChanged,
    required this.onFilterTapCapture,
  });

  @override
  Widget build(BuildContext context) {
    return FilterSelector(
      filters: filters,
      onFilterChanged: onFilterChanged,
      onFilterTapCapture: onFilterTapCapture,
      padding: const EdgeInsets.symmetric(vertical: 24),
    );
  }
}
