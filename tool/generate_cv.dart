import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:personal_site/content/profile.dart';

Future<void> main() async => generateCv();

Future<void> generateCv() async {
  // Print uses PDF's built-in Helvetica: regular weight and no variable-font ambiguity.
  final font = pw.Font.helvetica();
  final document = pw.Document(title: '${Profile.name} — Curriculum vitae', author: Profile.name);
  const blue = PdfColor.fromInt(0xff315c98);
  const grey = PdfColor.fromInt(0xff5c6573);
  document.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(48),
      theme: pw.ThemeData.withFont(base: font, bold: pw.Font.helveticaBold()),
      footer: (context) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          _text('${Profile.name} / Curriculum vitae', style: const pw.TextStyle(fontSize: 8, color: grey)),
          _text(
            '${context.pageNumber} / ${context.pagesCount}',
            style: const pw.TextStyle(fontSize: 8, color: grey),
          ),
        ],
      ),
      build: (_) => [
        _text('CURRICULUM VITAE', style: pw.TextStyle(fontSize: 9, letterSpacing: 2, color: blue)),
        pw.SizedBox(height: 20),
        _text(Profile.name, style: pw.TextStyle(fontSize: 36, letterSpacing: -1)),
        pw.SizedBox(height: 8),
        _text(Profile.role, style: const pw.TextStyle(fontSize: 14, color: grey)),
        pw.SizedBox(height: 10),
        _text(
          '${Profile.email}  |  linkedin.com/in/simon-lukas',
          style: const pw.TextStyle(fontSize: 9, color: grey),
        ),
        pw.SizedBox(height: 24),
        pw.Divider(color: blue, thickness: 1),
        _section('PROFILE', [_text(Profile.introduction, style: const pw.TextStyle(fontSize: 11, lineSpacing: 5))]),
        _section('FOCUS', [
          _text(Profile.skills.join('  /  '), style: const pw.TextStyle(fontSize: 10, lineSpacing: 5)),
        ]),
        _section('EXPERIENCE', [
          for (final role in Profile.experience) ...[
            _text(
              '${role.company} | ${role.role}',
              style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 4),
            _text(role.period, style: const pw.TextStyle(fontSize: 9, color: grey)),
            for (final highlight in role.highlights) ...[
              pw.SizedBox(height: 5),
              _text(highlight, style: const pw.TextStyle(fontSize: 10, lineSpacing: 3)),
            ],
            pw.SizedBox(height: 12),
          ],
        ]),
        _section('EDUCATION', [
          for (final qualification in Profile.education)
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 6),
              child: _text(qualification, style: const pw.TextStyle(fontSize: 10)),
            ),
        ]),
      ],
    ),
  );
  final file = File('web/downloads/lukas-simon-cv.pdf');
  await file.parent.create(recursive: true);
  await file.writeAsBytes(await document.save());
  stdout.writeln('Generated ${file.path}');
}

pw.Widget _section(String title, List<pw.Widget> children) => pw.Padding(
  padding: const pw.EdgeInsets.only(top: 23),
  child: pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _text(title, style: pw.TextStyle(fontSize: 9, color: const PdfColor.fromInt(0xff5c6573), letterSpacing: 1.4)),
      pw.SizedBox(height: 11),
      ...children,
    ],
  ),
);

pw.Widget _text(String value, {pw.TextStyle? style}) => pw.Text(
  value.replaceAll('–', '-').replaceAll('—', '-').replaceAll('’', "'").replaceAll('→', 'to'),
  style: style,
);
