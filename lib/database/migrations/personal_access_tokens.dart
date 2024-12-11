import 'package:vania/vania.dart';

class PersonalAccessTokens extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('personal_access_tokens', () {
      id();
      char("name", length: 255);
      bigInt("tokenable_id", nullable: true);
      char("token", length: 255);
      timeStamps();
      dateTime("deleted_at", nullable: true, defaultValue: null);
      dateTime("last_used_at", nullable: true, defaultValue: null);
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('personal_access_tokens');
  }
}
