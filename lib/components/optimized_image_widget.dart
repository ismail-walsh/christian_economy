import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

/// Optimized image widget that prevents jitter during loading
/// by maintaining fixed dimensions and using shimmer placeholders
class OptimizedImageWidget extends StatelessWidget {
  const OptimizedImageWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.fallbackIcon = Icons.image,
    this.showShimmer = true,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData fallbackIcon;
  final bool showShimmer;
  final int? memCacheWidth;
  final int? memCacheHeight;

  @override
  Widget build(BuildContext context) {
    // If no URL provided, show fallback immediately
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildFallback(context);
    }

    return Container(
      width: width,
      height: height,
      clipBehavior: borderRadius != null ? Clip.antiAlias : Clip.none,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: FlutterFlowTheme.of(context).alternate.withOpacity(0.3),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: memCacheWidth ?? (width * 2).toInt(),
        memCacheHeight: memCacheHeight ?? (height * 2).toInt(),
        maxHeightDiskCache: (height * 3).toInt(),
        maxWidthDiskCache: (width * 3).toInt(),
        fadeInDuration: Duration(milliseconds: 300),
        fadeOutDuration: Duration(milliseconds: 200),
        placeholder: (context, url) => showShimmer
            ? _buildShimmerPlaceholder(context)
            : _buildStaticPlaceholder(context),
        errorWidget: (context, url, error) => _buildFallback(context),
      ),
    );
  }

  Widget _buildShimmerPlaceholder(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: _ShimmerEffect(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }

  Widget _buildStaticPlaceholder(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate.withOpacity(0.3),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: SizedBox(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFallback(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate.withOpacity(0.5),
        borderRadius: borderRadius,
      ),
      child: Icon(
        fallbackIcon,
        size: (width < height ? width : height) * 0.4,
        color: FlutterFlowTheme.of(context).secondaryText,
      ),
    );
  }
}

/// Shimmer effect for smooth loading animation
class _ShimmerEffect extends StatefulWidget {
  const _ShimmerEffect({required this.child});

  final Widget child;

  @override
  State<_ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<_ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}
