import 'package:html/parser.dart';

String _formatHtmlString(String string) {
  return string
      .replaceAll("<p>", "") // Paragraphs
      .replaceAll("</p>", "\n") // Paragraphs
      .replaceAll("<br>", "\n") // Line Breaks
      .replaceAll("<br />", "\n") // Line Breaks
      .replaceAll("<strong>", "*") // bold
      .replaceAll("</strong>", "*") // bold
      .trim(); // Whitespace
}

String _formatWhatsappString(String string) {
  return string
      .replaceAll("<p>", "") // Paragraphs
      .replaceAll("</p>", "\n") // Paragraphs
      .replaceAll("<br>", "\n") // Line Breaks
      .replaceAll("<br />", "\n") // Line Breaks
      .replaceAll("<strong>", "*") // bold
      .replaceAll("</strong>", "*") // bold
      .replaceAll("<b>", "*") // bold
      .replaceAll("</b>", "*") // bold
      .replaceAll("<i>", "_") // italic
      .replaceAll("</i>", "_") // italic
      .trim(); // Whitespace
}

String parseHtmlString(String htmlString) {
  final document = parse(_formatHtmlString(htmlString));
  final parsedString = parse(document.body!.text).documentElement!.text;
  var formatParsedString = parsedString.replaceAll('\n\n', '\n').replaceAll('\n\n\n', '\n').replaceAll('\n\n\n\n', '\n');
  if (parsedString.length > 3000) {
    formatParsedString = parsedString.substring(0, 3000) + '...';
  }
  return formatParsedString.replaceAll('*', '');
}

String parseWhatsappString(String htmlString) {
  final document = parse(_formatWhatsappString(htmlString));
  final parsedString = parse(document.body!.text).documentElement!.text;
  var formatParsedString = parsedString.replaceAll('\n\n', '\n').replaceAll('\n\n\n', '\n').replaceAll('\n\n\n\n', '\n');
  if (parsedString.length > 3000) {
    formatParsedString = parsedString.substring(0, 3000) + '...';
  }
  return formatParsedString.replaceAll('*', '');
}