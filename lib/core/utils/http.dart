import 'package:http/http.dart' as http;
import 'package:http_cache_client/http_cache_client.dart';
import 'package:http_cache_core/http_cache_core.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: http.Client)
final class CachedHttpClient extends CacheClient {
  CachedHttpClient()
    : super(http.Client(), options: CacheOptions(store: HiveCacheStore(null)));
}
