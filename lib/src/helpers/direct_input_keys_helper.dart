import 'package:opticonnect_sdk/enums.dart';

/// A helper class for managing and converting direct input keys to their corresponding key codes.
///
/// This class provides mappings from [DirectInputKey] to their respective string key codes,
/// and also provides utilities for converting characters and integers into direct input keys.
class DirectInputKeysHelper {
  /// A mapping of [DirectInputKey] to their respective string key codes.
  ///
  /// This map is used to translate specific input keys (numeric, alphabetic, function keys, etc.)
  /// into corresponding string codes that can be sent as commands to devices.
  static Map<DirectInputKey, String> directInputKeyCodes = {
    // Numeric
    DirectInputKey.digit0: 'Q0',
    DirectInputKey.digit1: 'Q1',
    DirectInputKey.digit2: 'Q2',
    DirectInputKey.digit3: 'Q3',
    DirectInputKey.digit4: 'Q4',
    DirectInputKey.digit5: 'Q5',
    DirectInputKey.digit6: 'Q6',
    DirectInputKey.digit7: 'Q7',
    DirectInputKey.digit8: 'Q8',
    DirectInputKey.digit9: 'Q9',

    // Uppercase Letters
    DirectInputKey.letterA: '0A',
    DirectInputKey.letterB: '0B',
    DirectInputKey.letterC: '0C',
    DirectInputKey.letterD: '0D',
    DirectInputKey.letterE: '0E',
    DirectInputKey.letterF: '0F',
    DirectInputKey.letterG: '0G',
    DirectInputKey.letterH: '0H',
    DirectInputKey.letterI: '0I',
    DirectInputKey.letterJ: '0J',
    DirectInputKey.letterK: '0K',
    DirectInputKey.letterL: '0L',
    DirectInputKey.letterM: '0M',
    DirectInputKey.letterN: '0N',
    DirectInputKey.letterO: '0O',
    DirectInputKey.letterP: '0P',
    DirectInputKey.letterQ: '0Q',
    DirectInputKey.letterR: '0R',
    DirectInputKey.letterS: '0S',
    DirectInputKey.letterT: '0T',
    DirectInputKey.letterU: '0U',
    DirectInputKey.letterV: '0V',
    DirectInputKey.letterW: '0W',
    DirectInputKey.letterX: '0X',
    DirectInputKey.letterY: '0Y',
    DirectInputKey.letterZ: '0Z',

    // Lowercase Letters
    DirectInputKey.lettera: '\$A',
    DirectInputKey.letterb: '\$B',
    DirectInputKey.letterc: '\$C',
    DirectInputKey.letterd: '\$D',
    DirectInputKey.lettere: '\$E',
    DirectInputKey.letterf: '\$F',
    DirectInputKey.letterg: '\$G',
    DirectInputKey.letterh: '\$H',
    DirectInputKey.letteri: '\$I',
    DirectInputKey.letterj: '\$J',
    DirectInputKey.letterk: '\$K',
    DirectInputKey.letterl: '\$L',
    DirectInputKey.letterm: '\$M',
    DirectInputKey.lettern: '\$N',
    DirectInputKey.lettero: '\$O',
    DirectInputKey.letterp: '\$P',
    DirectInputKey.letterq: '\$Q',
    DirectInputKey.letterr: '\$R',
    DirectInputKey.letters: '\$S',
    DirectInputKey.lettert: '\$T',
    DirectInputKey.letteru: '\$U',
    DirectInputKey.letterv: '\$V',
    DirectInputKey.letterw: '\$W',
    DirectInputKey.letterx: '\$X',
    DirectInputKey.lettery: '\$Y',
    DirectInputKey.letterz: '\$Z',

    // Function Keys
    DirectInputKey.functionF1: '8J',
    DirectInputKey.functionF2: '8K',
    DirectInputKey.functionF3: '8L',
    DirectInputKey.functionF4: '8M',
    DirectInputKey.functionF5: '8N',
    DirectInputKey.functionF6: '8O',
    DirectInputKey.functionF7: '8P',
    DirectInputKey.functionF8: '8Q',
    DirectInputKey.functionF9: '8R',
    DirectInputKey.functionF10: '8S',
    DirectInputKey.functionF11: '8T',
    DirectInputKey.functionF12: '8U',

    // Keyboard Keys
    DirectInputKey.backspace: '9X',
    DirectInputKey.tab: '7H',
    DirectInputKey.returnKey: '7I',
    DirectInputKey.enterNumericKeypad: '7Q',
    DirectInputKey.escapeKey: '7J', // Renamed to avoid conflict
    DirectInputKey.arrowDown: '7K',
    DirectInputKey.arrowUp: '7L',
    DirectInputKey.arrowRight: '7M',
    DirectInputKey.arrowLeft: '7N',
    DirectInputKey.del: '7T',
    DirectInputKey.insert: 'VQ',
    DirectInputKey.home: 'VR',
    DirectInputKey.end: 'VS',
    DirectInputKey.pageUp: '7O',
    DirectInputKey.pageDown: '7P',
    DirectInputKey.leftShift: '7U',
    DirectInputKey.rightShift: '7V',
    DirectInputKey.leftCtrl: '7W',
    DirectInputKey.rightCtrl: '7X',
    DirectInputKey.leftAlt: '7Y',
    DirectInputKey.rightAlt: '7Z',
    DirectInputKey.leftGUI: '\$8',
    DirectInputKey.rightGUI: '\$9',
    DirectInputKey.capsLock: '9S',

    // Numeric Keypad
    DirectInputKey.numMinus: '\$A9',
    DirectInputKey.numDivide: '\$D4',
    DirectInputKey.numMultiply: '\$D5',
    DirectInputKey.numPlus: '\$D7',
    DirectInputKey.numDot: '\$E3',

    // Special Characters
    DirectInputKey.space: '5A',
    DirectInputKey.exclamation: '5B',
    DirectInputKey.doubleQuote: '5C',
    DirectInputKey.hash: '5D',
    DirectInputKey.dollar: '5E',
    DirectInputKey.percent: '5F',
    DirectInputKey.ampersand: '5G',
    DirectInputKey.singleQuote: '5H',
    DirectInputKey.openParen: '5I',
    DirectInputKey.closeParen: '5J',
    DirectInputKey.asterisk: '5K',
    DirectInputKey.plus: '5L',
    DirectInputKey.comma: '5M',
    DirectInputKey.minus: '5N',
    DirectInputKey.period: '5O',
    DirectInputKey.slash: '5P',
    DirectInputKey.colon: '6A',
    DirectInputKey.semicolon: '6B',
    DirectInputKey.lessThan: '6C',
    DirectInputKey.equal: '6D',
    DirectInputKey.greaterThan: '6E',
    DirectInputKey.questionMark: '6F',
    DirectInputKey.atSymbol: '6G',
    DirectInputKey.openBracket: '7A',
    DirectInputKey.backslash: '7B',
    DirectInputKey.closeBracket: '7C',
    DirectInputKey.caret: '7D',
    DirectInputKey.underscore: '7E',
    DirectInputKey.backtick: '7F',
    DirectInputKey.openBrace: '9T',
    DirectInputKey.pipe: '9U',
    DirectInputKey.closeBrace: '9V',
    DirectInputKey.tilde: '9W',

    // Control Characters
    DirectInputKey.nullChar: '9G',
    DirectInputKey.soh: '1A',
    DirectInputKey.stx: '1B',
    DirectInputKey.etx: '1C',
    DirectInputKey.eot: '1D',
    DirectInputKey.enq: '1E',
    DirectInputKey.ack: '1F',
    DirectInputKey.bel: '1G',
    DirectInputKey.bs: '1H',
    DirectInputKey.ht: '1I',
    DirectInputKey.lf: '1J',
    DirectInputKey.vt: '1K',
    DirectInputKey.ff: '1L',
    DirectInputKey.cr: '1M',
    DirectInputKey.so: '1N',
    DirectInputKey.si: '1O',
    DirectInputKey.dle: '1P',
    DirectInputKey.dc1: '1Q',
    DirectInputKey.dc2: '1R',
    DirectInputKey.dc3: '1S',
    DirectInputKey.dc4: '1T',
    DirectInputKey.nak: '1U',
    DirectInputKey.syn: '1V',
    DirectInputKey.etb: '1W',
    DirectInputKey.can: '1X',
    DirectInputKey.em: '1Y',
    DirectInputKey.sub: '1Z',
    DirectInputKey.escapeChar: '9A', // Renamed to avoid conflict
    DirectInputKey.fs: '9B',
    DirectInputKey.gs: '9C',
    DirectInputKey.rs: '9D',
    DirectInputKey.us: '9E',
    DirectInputKey.delAscii: '9F',

    // Code id/length
    DirectInputKey.codeIdentification: '\$2',
    DirectInputKey.codeIdentificationISO: '\$1',
    DirectInputKey.codeIdentificationBT: '\$BT',
    DirectInputKey.codeLength2Digits: '\$3',
    DirectInputKey.codeLength6Digits: '\$6',

    // Special
    DirectInputKey.readDirection: '\$4',
    DirectInputKey.timestamp: '\$TM',
  };

  /// A mapping of characters to [DirectInputKey] for direct input key conversion.
  ///
  /// This map is used to map individual characters (e.g., 'A', 'a', '1', etc.) to
  /// their corresponding [DirectInputKey] enum value.
  static Map<String, DirectInputKey> charToDirectInputKey = {
    // Numeric
    '0': DirectInputKey.digit0,
    '1': DirectInputKey.digit1,
    '2': DirectInputKey.digit2,
    '3': DirectInputKey.digit3,
    '4': DirectInputKey.digit4,
    '5': DirectInputKey.digit5,
    '6': DirectInputKey.digit6,
    '7': DirectInputKey.digit7,
    '8': DirectInputKey.digit8,
    '9': DirectInputKey.digit9,

    // Uppercase Letters
    'A': DirectInputKey.letterA,
    'B': DirectInputKey.letterB,
    'C': DirectInputKey.letterC,
    'D': DirectInputKey.letterD,
    'E': DirectInputKey.letterE,
    'F': DirectInputKey.letterF,
    'G': DirectInputKey.letterG,
    'H': DirectInputKey.letterH,
    'I': DirectInputKey.letterI,
    'J': DirectInputKey.letterJ,
    'K': DirectInputKey.letterK,
    'L': DirectInputKey.letterL,
    'M': DirectInputKey.letterM,
    'N': DirectInputKey.letterN,
    'O': DirectInputKey.letterO,
    'P': DirectInputKey.letterP,
    'Q': DirectInputKey.letterQ,
    'R': DirectInputKey.letterR,
    'S': DirectInputKey.letterS,
    'T': DirectInputKey.letterT,
    'U': DirectInputKey.letterU,
    'V': DirectInputKey.letterV,
    'W': DirectInputKey.letterW,
    'X': DirectInputKey.letterX,
    'Y': DirectInputKey.letterY,
    'Z': DirectInputKey.letterZ,

    // Lowercase Letters
    'a': DirectInputKey.lettera,
    'b': DirectInputKey.letterb,
    'c': DirectInputKey.letterc,
    'd': DirectInputKey.letterd,
    'e': DirectInputKey.lettere,
    'f': DirectInputKey.letterf,
    'g': DirectInputKey.letterg,
    'h': DirectInputKey.letterh,
    'i': DirectInputKey.letteri,
    'j': DirectInputKey.letterj,
    'k': DirectInputKey.letterk,
    'l': DirectInputKey.letterl,
    'm': DirectInputKey.letterm,
    'n': DirectInputKey.lettern,
    'o': DirectInputKey.lettero,
    'p': DirectInputKey.letterp,
    'q': DirectInputKey.letterq,
    'r': DirectInputKey.letterr,
    's': DirectInputKey.letters,
    't': DirectInputKey.lettert,
    'u': DirectInputKey.letteru,
    'v': DirectInputKey.letterv,
    'w': DirectInputKey.letterw,
    'x': DirectInputKey.letterx,
    'y': DirectInputKey.lettery,
    'z': DirectInputKey.letterz,

    // Special Characters
    ' ': DirectInputKey.space,
    '!': DirectInputKey.exclamation,
    '"': DirectInputKey.doubleQuote,
    '#': DirectInputKey.hash,
    '\$': DirectInputKey.dollar,
    '%': DirectInputKey.percent,
    '&': DirectInputKey.ampersand,
    '\'': DirectInputKey.singleQuote,
    '(': DirectInputKey.openParen,
    ')': DirectInputKey.closeParen,
    '*': DirectInputKey.asterisk,
    '+': DirectInputKey.plus,
    ',': DirectInputKey.comma,
    '-': DirectInputKey.minus,
    '.': DirectInputKey.period,
    '/': DirectInputKey.slash,
    ':': DirectInputKey.colon,
    ';': DirectInputKey.semicolon,
    '<': DirectInputKey.lessThan,
    '=': DirectInputKey.equal,
    '>': DirectInputKey.greaterThan,
    '?': DirectInputKey.questionMark,
    '@': DirectInputKey.atSymbol,
    '[': DirectInputKey.openBracket,
    '\\': DirectInputKey.backslash,
    ']': DirectInputKey.closeBracket,
    '^': DirectInputKey.caret,
    '_': DirectInputKey.underscore,
    '`': DirectInputKey.backtick,
    '{': DirectInputKey.openBrace,
    '|': DirectInputKey.pipe,
    '}': DirectInputKey.closeBrace,
    '~': DirectInputKey.tilde,

    // Keyboard Keys - using HT (Horizontal Tab) for special case
    '\t':
        DirectInputKey.ht, // HT for compatibility with Excel and other systems
    '↹': DirectInputKey.tab, // The graphical representation of tab for clarity

    // Control Characters for escape
    '\n': DirectInputKey.lf,
    '\r': DirectInputKey.cr,
    '\b': DirectInputKey.bs,
  };

  /// Converts an integer value to a list of corresponding direct input key codes.
  ///
  /// The method takes an integer value, converts it to its string representation, and then
  /// maps each character to its respective [DirectInputKey] and key code. This is useful for
  /// generating commands based on numeric input.
  ///
  /// Example:
  /// ```dart
  /// List<String> keys = DirectInputKeysHelper.convertIntToDirectInputKeys(123);
  /// // Returns ['Q1', 'Q2', 'Q3']
  /// ```
  ///
  /// [value] is the integer value to be converted to a list of direct input key codes.
  static List<String> convertIntToDirectInputKeys(int value) {
    final text = value.toString();
    final keys = text
        .split('')
        .map((c) => charToDirectInputKey[c]!)
        .map((key) => directInputKeyCodes[key]!)
        .toList();
    return keys;
  }
}
