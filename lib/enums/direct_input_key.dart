part of 'package:opticonnect_sdk/enums.dart';

/// Enum representing various direct input keys used for keyboard and barcode input.
///
/// This enum includes numeric, alphabetical (both upper and lower case), function keys,
/// keyboard control keys, special characters, control characters, and other input codes.
enum DirectInputKey {
  // Numeric digits
  /// The numeric digit 0.
  digit0,

  /// The numeric digit 1.
  digit1,

  /// The numeric digit 2.
  digit2,

  /// The numeric digit 3.
  digit3,

  /// The numeric digit 4.
  digit4,

  /// The numeric digit 5.
  digit5,

  /// The numeric digit 6.
  digit6,

  /// The numeric digit 7.
  digit7,

  /// The numeric digit 8.
  digit8,

  /// The numeric digit 9.
  digit9,

  // Uppercase Letters
  /// The uppercase letter A.
  letterA,

  /// The uppercase letter B.
  letterB,

  /// The uppercase letter C.
  letterC,

  /// The uppercase letter D.
  letterD,

  /// The uppercase letter E.
  letterE,

  /// The uppercase letter F.
  letterF,

  /// The uppercase letter G.
  letterG,

  /// The uppercase letter H.
  letterH,

  /// The uppercase letter I.
  letterI,

  /// The uppercase letter J.
  letterJ,

  /// The uppercase letter K.
  letterK,

  /// The uppercase letter L.
  letterL,

  /// The uppercase letter M.
  letterM,

  /// The uppercase letter N.
  letterN,

  /// The uppercase letter O.
  letterO,

  /// The uppercase letter P.
  letterP,

  /// The uppercase letter Q.
  letterQ,

  /// The uppercase letter R.
  letterR,

  /// The uppercase letter S.
  letterS,

  /// The uppercase letter T.
  letterT,

  /// The uppercase letter U.
  letterU,

  /// The uppercase letter V.
  letterV,

  /// The uppercase letter W.
  letterW,

  /// The uppercase letter X.
  letterX,

  /// The uppercase letter Y.
  letterY,

  /// The uppercase letter Z.
  letterZ,

  // Lowercase Letters
  /// The lowercase letter a.
  lettera,

  /// The lowercase letter b.
  letterb,

  /// The lowercase letter c.
  letterc,

  /// The lowercase letter d.
  letterd,

  /// The lowercase letter e.
  lettere,

  /// The lowercase letter f.
  letterf,

  /// The lowercase letter g.
  letterg,

  /// The lowercase letter h.
  letterh,

  /// The lowercase letter i.
  letteri,

  /// The lowercase letter j.
  letterj,

  /// The lowercase letter k.
  letterk,

  /// The lowercase letter l.
  letterl,

  /// The lowercase letter m.
  letterm,

  /// The lowercase letter n.
  lettern,

  /// The lowercase letter o.
  lettero,

  /// The lowercase letter p.
  letterp,

  /// The lowercase letter q.
  letterq,

  /// The lowercase letter r.
  letterr,

  /// The lowercase letter s.
  letters,

  /// The lowercase letter t.
  lettert,

  /// The lowercase letter u.
  letteru,

  /// The lowercase letter v.
  letterv,

  /// The lowercase letter w.
  letterw,

  /// The lowercase letter x.
  letterx,

  /// The lowercase letter y.
  lettery,

  /// The lowercase letter z.
  letterz,

  // Function Keys
  /// Function key F1.
  functionF1,

  /// Function key F2.
  functionF2,

  /// Function key F3.
  functionF3,

  /// Function key F4.
  functionF4,

  /// Function key F5.
  functionF5,

  /// Function key F6.
  functionF6,

  /// Function key F7.
  functionF7,

  /// Function key F8.
  functionF8,

  /// Function key F9.
  functionF9,

  /// Function key F10.
  functionF10,

  /// Function key F11.
  functionF11,

  /// Function key F12.
  functionF12,

  // Keyboard Keys
  /// The Backspace key.
  backspace,

  /// The Tab key.
  tab,

  /// The Return key.
  returnKey,

  /// The Enter key on the numeric keypad.
  enterNumericKeypad,

  /// The Escape key.
  escapeKey,

  /// The Down Arrow key.
  arrowDown,

  /// The Up Arrow key.
  arrowUp,

  /// The Right Arrow key.
  arrowRight,

  /// The Left Arrow key.
  arrowLeft,

  /// The Delete key.
  del,

  /// The Insert key.
  insert,

  /// The Home key.
  home,

  /// The End key.
  end,

  /// The Page Up key.
  pageUp,

  /// The Page Down key.
  pageDown,

  /// The Left Shift key.
  leftShift,

  /// The Right Shift key.
  rightShift,

  /// The Left Control key.
  leftCtrl,

  /// The Right Control key.
  rightCtrl,

  /// The Left Alt key.
  leftAlt,

  /// The Right Alt key.
  rightAlt,

  /// The Left GUI (Windows/Command) key.
  leftGUI,

  /// The Right GUI (Windows/Command) key.
  rightGUI,

  /// The Caps Lock key.
  capsLock,

  // Numeric Keypad
  /// The Minus key on the numeric keypad.
  numMinus,

  /// The Divide key on the numeric keypad.
  numDivide,

  /// The Multiply key on the numeric keypad.
  numMultiply,

  /// The Plus key on the numeric keypad.
  numPlus,

  /// The Dot (Decimal) key on the numeric keypad.
  numDot,

  // Special Characters
  /// The Space key.
  space,

  /// The Exclamation mark (!).
  exclamation,

  /// The Double Quote (").
  doubleQuote,

  /// The Hash symbol (#).
  hash,

  /// The Dollar sign ($).
  dollar,

  /// The Percent symbol (%).
  percent,

  /// The Ampersand (&).
  ampersand,

  /// The Single Quote (').
  singleQuote,

  /// The Open Parenthesis (().
  openParen,

  /// The Close Parenthesis ()).
  closeParen,

  /// The Asterisk (*).
  asterisk,

  /// The Plus symbol (+).
  plus,

  /// The Comma (,).
  comma,

  /// The Minus symbol (-).
  minus,

  /// The Period or Dot (.).
  period,

  /// The Slash (/).
  slash,

  /// The Colon (:).
  colon,

  /// The Semicolon (;).
  semicolon,

  /// The Less Than symbol (<).
  lessThan,

  /// The Equal sign (=).
  equal,

  /// The Greater Than symbol (>).
  greaterThan,

  /// The Question Mark (?).
  questionMark,

  /// The At symbol (@).
  atSymbol,

  /// The Open Bracket ([).
  openBracket,

  /// The Backslash (\).
  backslash,

  /// The Close Bracket (]).
  closeBracket,

  /// The Caret (^).
  caret,

  /// The Underscore (_).
  underscore,

  /// The Backtick (`).
  backtick,

  /// The Open Brace ({).
  openBrace,

  /// The Pipe (|).
  pipe,

  /// The Close Brace (}).
  closeBrace,

  /// The Tilde (~).
  tilde,

  // Control Characters
  /// The Null character (NUL).
  nullChar,

  /// Start of Header (SOH).
  soh,

  /// Start of Text (STX).
  stx,

  /// End of Text (ETX).
  etx,

  /// End of Transmission (EOT).
  eot,

  /// Enquiry (ENQ).
  enq,

  /// Acknowledge (ACK).
  ack,

  /// Bell (BEL).
  bel,

  /// Backspace (BS).
  bs,

  /// Horizontal Tab (HT).
  ht,

  /// Line Feed (LF).
  lf,

  /// Vertical Tab (VT).
  vt,

  /// Form Feed (FF).
  ff,

  /// Carriage Return (CR).
  cr,

  /// Shift Out (SO).
  so,

  /// Shift In (SI).
  si,

  /// Data Link Escape (DLE).
  dle,

  /// Device Control 1 (DC1).
  dc1,

  /// Device Control 2 (DC2).
  dc2,

  /// Device Control 3 (DC3).
  dc3,

  /// Device Control 4 (DC4).
  dc4,

  /// Negative Acknowledge (NAK).
  nak,

  /// Synchronous Idle (SYN).
  syn,

  /// End of Transmission Block (ETB).
  etb,

  /// Cancel (CAN).
  can,

  /// End of Medium (EM).
  em,

  /// Substitute (SUB).
  sub,

  /// Escape (ESC).
  escapeChar,

  /// File Separator (FS).
  fs,

  /// Group Separator (GS).
  gs,

  /// Record Separator (RS).
  rs,

  /// Unit Separator (US).
  us,

  /// Delete (DEL).
  delAscii,

  // Code identification and length
  /// Identifies the code type.
  codeIdentification,

  /// Identifies the ISO code.
  codeIdentificationISO,

  /// Identifies the BT code.
  codeIdentificationBT,

  /// Specifies a 2-digit code length.
  codeLength2Digits,

  /// Specifies a 6-digit code length.
  codeLength6Digits,

  // Special
  /// Represents the read direction of the input.
  readDirection,

  /// Represents the timestamp of the input.
  timestamp
}
