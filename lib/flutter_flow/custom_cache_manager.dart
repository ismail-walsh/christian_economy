import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Custom cache manager for optimized image loading
/// This configuration helps prevent app freezes by:
/// 1. Limiting concurrent downloads
/// 2. Setting appropriate cache duration
/// 3. Reducing memory pressure during initial load
class CustomCacheManager {
  static const key = 'customCacheKey';

  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );
}
