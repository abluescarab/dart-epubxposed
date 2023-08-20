class EpubLanguageRelatedAttributes {
  /// https://www.w3.org/TR/epub-33/#attrdef-xml-lang
  String? Lang;

  /// Paragraph direction/Global base direction. (v3.0)
  ///
  /// Reading systems will assume the value "auto" when EPUB creators omit the attribute or use an invalid value.
  /// https://www.w3.org/TR/epub-33/#attrdef-dir
  String? Dir;

  EpubLanguageRelatedAttributes({
    this.Lang,
    this.Dir,
  });

  @override
  bool operator ==(other) {
    final otherAs = (other as EpubLanguageRelatedAttributes?);

    if (otherAs == null) return false;

    return ((Lang == otherAs.Lang) && (Dir == otherAs.Dir));
  }
}