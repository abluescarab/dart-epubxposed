import 'package:epub_editor/src/schema/opf/epub_metadata_field.dart';
import 'package:quiver/collection.dart';

class EpubMetadataMeta extends EpubMetadataField {
  EpubMetadataMeta({
    super.id,
    this.name,
    this.content,
    this.textContent,
    this.refines,
    this.property,
    this.scheme,
    this.dir,
    this.lang,
    Map<String, String>? attributes,
  }) : this.attributes = attributes ?? {};

  String? name;
  String? content;
  String? textContent;
  String? refines;
  String? property;
  String? scheme;
  Map<String, String> attributes;
  String? dir;
  String? lang;

  @override
  int get hashCode => Object.hashAll([
        id.hashCode,
        name.hashCode,
        content.hashCode,
        textContent.hashCode,
        refines.hashCode,
        property.hashCode,
        scheme.hashCode,
        ...attributes.keys.map((e) => e.hashCode),
        ...attributes.values.map((e) => e.hashCode),
        dir.hashCode,
        lang.hashCode,
      ]);

  @override
  bool operator ==(other) {
    if (!(other is EpubMetadataMeta)) {
      return false;
    }

    return name == other.name &&
        content == other.content &&
        textContent == other.textContent &&
        id == other.id &&
        refines == other.refines &&
        property == other.property &&
        scheme == other.scheme &&
        mapsEqual(attributes, other.attributes) &&
        dir == other.dir &&
        lang == other.lang;
  }
}
