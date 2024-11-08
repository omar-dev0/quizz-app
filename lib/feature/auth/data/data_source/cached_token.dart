import 'package:hive/hive.dart';
part "cached_token.g.dart";
@HiveType(typeId: 8)
class CachedToken{
  @HiveField(0)
  String? token;
  CachedToken(this.token);
}