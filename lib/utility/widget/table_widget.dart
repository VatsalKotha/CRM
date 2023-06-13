import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({
    super.key,
    required this.heading,
    required this.value,
    this.isBold = false,
    this.valueColor,
    this.isUnderlined = false,
    this.onPressed,
  });

  final String heading;
  final String value;
  final Color? valueColor;
  final bool isBold;
  final bool isUnderlined;
  final VoidCallback? onPressed;

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                  widget.heading,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    color: const Color(0xFF777777),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: GestureDetector(
                  onTap: widget.onPressed,
                  child: Text(
                    widget.value,
                    // overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 15.0,
                      color: widget.valueColor ?? Colors.black,
                      fontWeight: widget.isBold ? FontWeight.w500 : FontWeight.normal,
                      decoration: widget.isUnderlined ? TextDecoration.underline : TextDecoration.none,
                      decorationColor: widget.valueColor ?? Colors.black,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
