library visualizeit_extension_template;

import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/logging.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_extensions/extension.dart';

final _logger = Logger("extension.fake");

final class FakeExtension extends Extension {
  static const extensionId = "fake_extension";

  FakeExtension._create({required super.markdownDocs, required super.extensionCore}) : super.create(id: extensionId);
}

class FakeExtensionBuilder implements ExtensionBuilder {
  static const _docsLocationPath = "packages/visualizeit_extension_template/assets/docs";
  static const _availableDocsLanguages = [LanguageCodes.en];

  @override
  Future<Extension> build() async{
    _logger.trace(() => "Building fake extension");

    final markdownDocs = {
      for (final languageCode in _availableDocsLanguages) languageCode : '$_docsLocationPath/$languageCode.md'
    };

    return FakeExtension._create(markdownDocs: markdownDocs, extensionCore: FakeExtensionCore());
  }
}

class FakeExtensionCore extends SimpleExtensionCore {

  FakeExtensionCore() : super({
    FakeCommand.commandDefinition: FakeCommand.build,
  });

  @override
  Widget? render(Model model, BuildContext context) {
    _logger.trace(() => "Rendering fake extension model: $model");
    return Positioned.fill(
      child: Align(
      child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(15), // Rounded borders
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Position of shadow
          ),
        ],
      ),
      child: Text(
        (model as FakeModel).text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
    )));
  }
}

class FakeCommand extends ModelBuilderCommand {
  static final commandDefinition = CommandDefinition(FakeExtension.extensionId, "fake-command", []);

  FakeCommand.build(RawCommand rawCommand);

  @override
  Model call(CommandContext context) {
    _logger.trace(() => "Calling Fake command");
    return FakeModel();
  }
}

class FakeModel extends Model {
  final text = "Fake model text";

  FakeModel(): super(FakeExtension.extensionId, "fake_model");

  @override
  Model clone() {
    return this; //return the same as this example is immutable
  }
}