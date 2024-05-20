library epubreadertest;

import 'package:archive/archive.dart';
import 'package:epub_editor/src/ref_entities/epub_book_ref.dart';
import 'package:epub_editor/src/ref_entities/epub_chapter_ref.dart';
import 'package:epub_editor/src/ref_entities/epub_text_content_file_ref.dart';
import 'package:test/test.dart';

main() async {
  final arch = Archive();
  final bookRef = EpubBookRef(arch);
  final contentFileRef = EpubTextContentFileRef(bookRef);
  final reference = EpubChapterRef(contentFileRef);

  reference
    ..anchor = "anchor"
    ..contentFileName = "orthros"
    ..subChapters = []
    ..title = "A New Look at Chapters";

  EpubBookRef? bookRef2;
  EpubChapterRef? testChapterRef;
  setUp(() async {
    final arch2 = Archive();
    bookRef2 = EpubBookRef(arch2);
    final contentFileRef2 = EpubTextContentFileRef(bookRef2!);

    testChapterRef = EpubChapterRef(contentFileRef2);
    testChapterRef
      !..anchor = "anchor"
      ..contentFileName = "orthros"
      ..subChapters = []
      ..title = "A New Look at Chapters";
  });

  tearDown(() async {
    testChapterRef = null;
    bookRef2 = null;
  });
  group("EpubChapterRef", () {
    group(".equals", () {
      test("is true for equivalent objects", () async {
        expect(testChapterRef, equals(reference));
      });

      test("is false when Anchor changes", () async {
        testChapterRef!.anchor = "NotAnAnchor";
        expect(testChapterRef, isNot(reference));
      });

      test("is false when ContentFileName changes", () async {
        testChapterRef!.contentFileName = "NotOrthros";
        expect(testChapterRef, isNot(reference));
      });

      test("is false when SubChapters changes", () async {
        final subchapterContentFileRef = EpubTextContentFileRef(bookRef2!);
        final chapter = EpubChapterRef(subchapterContentFileRef);
        chapter
          ..title = "A Brave new Epub"
          ..contentFileName = "orthros.txt";
        testChapterRef!.subChapters = [chapter];
        expect(testChapterRef, isNot(reference));
      });

      test("is false when Title changes", () async {
        testChapterRef!.title = "A Boring Old World";
        expect(testChapterRef, isNot(reference));
      });
    });

    group(".hashCode", () {
      test("is true for equivalent objects", () async {
        expect(testChapterRef.hashCode, equals(reference.hashCode));
      });

      test("is true for equivalent objects", () async {
        expect(testChapterRef.hashCode, equals(reference.hashCode));
      });

      test("is false when Anchor changes", () async {
        testChapterRef!.anchor = "NotAnAnchor";
        expect(testChapterRef.hashCode, isNot(reference.hashCode));
      });

      test("is false when ContentFileName changes", () async {
        testChapterRef!.contentFileName = "NotOrthros";
        expect(testChapterRef.hashCode, isNot(reference.hashCode));
      });

      test("is false when SubChapters changes", () async {
        final subchapterContentFileRef = EpubTextContentFileRef(bookRef2!);
        final chapter = EpubChapterRef(subchapterContentFileRef);
        chapter
          ..title = "A Brave new Epub"
          ..contentFileName = "orthros.txt";
        testChapterRef!.subChapters = [chapter];
        expect(testChapterRef, isNot(reference));
      });

      test("is false when Title changes", () async {
        testChapterRef!.title = "A Boring Old World";
        expect(testChapterRef.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
