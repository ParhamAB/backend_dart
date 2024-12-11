import 'dart:io';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'personal_access_tokens.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await CreateUserTable().up();
    await PersonalAccessTokens().up();
  }

  dropTables() async {
    await PersonalAccessTokens().down();
    await CreateUserTable().down();
  }
}
