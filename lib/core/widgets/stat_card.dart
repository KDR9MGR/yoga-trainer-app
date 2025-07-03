import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final String? subtitle;
  final bool showTrend;
  final double? trendValue;
  final bool isLoading;
  final StatCardSize size;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
    this.subtitle,
    this.showTrend = false,
    this.trendValue,
    this.isLoading = false,
    this.size = StatCardSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: _getPadding(),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isLoading ? _buildLoadingContent() : _buildContent(context),
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case StatCardSize.small:
        return const EdgeInsets.all(12);
      case StatCardSize.medium:
        return const EdgeInsets.all(16);
      case StatCardSize.large:
        return const EdgeInsets.all(20);
    }
  }

  Widget _buildLoadingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            if (showTrend)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 80,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: _getIconSize(),
              ),
            ),
            if (showTrend && trendValue != null) _buildTrendIndicator(),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: _getValueTextStyle(theme),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: _getTitleTextStyle(theme),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle!,
                style: _getSubtitleTextStyle(theme),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildTrendIndicator() {
    if (trendValue == null) return const SizedBox();
    
    final isPositive = trendValue! >= 0;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isPositive 
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.trending_up : Icons.trending_down,
            size: 12,
            color: isPositive ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 2),
          Text(
            '${trendValue!.abs().toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  double _getIconSize() {
    switch (size) {
      case StatCardSize.small:
        return 20;
      case StatCardSize.medium:
        return 24;
      case StatCardSize.large:
        return 28;
    }
  }

  TextStyle _getValueTextStyle(ThemeData theme) {
    switch (size) {
      case StatCardSize.small:
        return theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        ) ?? const TextStyle();
      case StatCardSize.medium:
        return theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        ) ?? const TextStyle();
      case StatCardSize.large:
        return theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        ) ?? const TextStyle();
    }
  }

  TextStyle _getTitleTextStyle(ThemeData theme) {
    switch (size) {
      case StatCardSize.small:
        return theme.textTheme.bodySmall?.copyWith(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ) ?? const TextStyle();
      case StatCardSize.medium:
        return theme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ) ?? const TextStyle();
      case StatCardSize.large:
        return theme.textTheme.bodyLarge?.copyWith(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ) ?? const TextStyle();
    }
  }

  TextStyle _getSubtitleTextStyle(ThemeData theme) {
    return theme.textTheme.bodySmall?.copyWith(
      color: Colors.grey[500],
    ) ?? const TextStyle();
  }
}

enum StatCardSize { small, medium, large } 