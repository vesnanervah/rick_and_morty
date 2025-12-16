// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty/characters/repository/character_repo.dart'
    as _i601;
import 'package:rick_and_morty/characters/repository/remote_character_repo.dart'
    as _i662;
import 'package:rick_and_morty/core/service/rick_and_morty_service/rick_and_morty_service.dart'
    as _i180;
import 'package:rick_and_morty/core/utils/http.dart' as _i915;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i519.Client>(() => _i915.CachedHttpClient());
    gh.factory<_i180.RickAndMortyService>(
      () => _i180.RickAndMortyService(gh<_i519.Client>()),
    );
    gh.factory<_i601.CharacterRepo>(
      () => _i662.RemoteCharacterRepo(gh<_i180.RickAndMortyService>()),
    );
    return this;
  }
}
