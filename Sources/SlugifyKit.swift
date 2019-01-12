//
//  SlugifyKit.swift
//  SlugifyKit
//
//  Created by Joe Blau on 1/11/19.
//  Copyright © 2019 SlugifyKit. All rights reserved.
//

import Foundation

import Foundation

extension String {
    private var safeString: String {
        switch self {
        case "0", "°", "₀", "۰": return "0"
        case "1", "¹", "₁", "۱": return "1"
        case "2", "²", "₂", "۲": return "2"
        case "3", "³", "₃", "۳": return "3"
        case "4", "⁴", "₄", "۴", "٤": return "4"
        case "5", "⁵", "₅", "۵", "٥": return "5"
        case "6", "⁶", "₆", "۶", "٦": return "6"
        case "7", "⁷", "₇", "۷": return "7"
        case "8", "⁸", "₈", "۸": return "8"
        case "9", "⁹", "₉", "۹": return "9"
        case "a", "à", "á", "ả", "ã", "ạ", "ă", "ắ", "ằ", "ẳ", "ẵ", "ặ", "â", "ấ", "ầ", "ẩ", "ẫ", "ậ", "ā", "ą", "å", "α", "ά", "ἀ", "ἁ", "ἂ", "ἃ", "ἄ", "ἅ", "ἆ", "ἇ", "ᾀ", "ᾁ", "ᾂ", "ᾃ", "ᾄ", "ᾅ", "ᾆ", "ᾇ", "ὰ", "ᾰ", "ᾱ", "ᾲ", "ᾳ", "ᾴ", "ᾶ", "ᾷ", "а", "أ", "အ", "ာ", "ါ", "ǻ", "ǎ", "ª", "ა", "अ", "ا": return "a"
        case "b", "б", "β", "Ъ", "Ь", "ب", "ဗ", "ბ": return "b"
        case "c", "ç", "ć", "č", "ĉ", "ċ": return "c"
        case "d", "ď", "ð", "đ", "ƌ", "ȡ", "ɖ", "ɗ", "ᵭ", "ᶁ", "ᶑ", "д", "δ", "د", "ض", "ဍ", "ဒ", "დ": return "d"
        case "e", "é", "è", "ẻ", "ẽ", "ẹ", "ê", "ế", "ề", "ể", "ễ", "ệ", "ë", "ē", "ę", "ě", "ĕ", "ė", "ε", "έ", "ἐ", "ἑ", "ἒ", "ἓ", "ἔ", "ἕ", "ὲ", "е", "ё", "э", "є", "ə", "ဧ", "ေ", "ဲ", "ე", "ए", "إ", "ئ": return "e"
        case "f", "ф", "φ", "ف", "ƒ", "ფ": return "f"
        case "g", "ĝ", "ğ", "ġ", "ģ", "г", "ґ", "γ", "ဂ", "გ", "گ": return "g"
        case "h", "ĥ", "ħ", "η", "ή", "ح", "ه", "ဟ", "ှ", "ჰ": return "h"
        case "i", "í", "ì", "ỉ", "ĩ", "ị", "î", "ï", "ī", "ĭ", "į", "ı", "ι", "ί", "ϊ", "ΐ", "ἰ", "ἱ", "ἲ", "ἳ", "ἴ", "ἵ", "ἶ", "ἷ", "ὶ", "ῐ", "ῑ", "ῒ", "ῖ", "ῗ", "і", "ї", "и", "ဣ", "ိ", "ီ", "ည်", "ǐ", "ი", "इ": return "i"
        case "j", "ĵ", "ј", "Ј", "ჯ", "ج": return "j"
        case "k", "ķ", "ĸ", "к", "κ", "Ķ", "ق", "ك", "က", "კ", "ქ", "ک": return "k"
        case "l", "ł", "ľ", "ĺ", "ļ", "ŀ", "л", "λ", "ل", "လ", "ლ": return "l"
        case "m", "м", "μ", "م", "မ", "მ": return "m"
        case "n", "ñ", "ń", "ň", "ņ", "ŉ", "ŋ", "ν", "н", "ن", "န", "ნ": return "n"
        case "o", "ó", "ò", "ỏ", "õ", "ọ", "ô", "ố", "ồ", "ổ", "ỗ", "ộ", "ơ", "ớ", "ờ", "ở", "ỡ", "ợ", "ø", "ō", "ő", "ŏ", "ο", "ὀ", "ὁ", "ὂ", "ὃ", "ὄ", "ὅ", "ὸ", "ό", "о", "و", "θ", "ို", "ǒ", "ǿ", "º", "ო", "ओ": return "o"
        case "p", "п", "π", "ပ", "პ", "پ": return "p"
        case "q", "ყ": return "q"
        case "r", "ŕ", "ř", "ŗ", "р", "ρ", "ر", "რ": return "r"
        case "s", "ś", "š", "ş", "с", "σ", "ș", "ς", "س", "ص", "စ", "ſ", "ს": return "s"
        case "t", "ť", "ţ", "т", "τ", "ț", "ت", "ط", "ဋ", "တ", "ŧ", "თ", "ტ": return "t"
        case "u", "ú", "ù", "ủ", "ũ", "ụ", "ư", "ứ", "ừ", "ử", "ữ", "ự", "û", "ū", "ů", "ű", "ŭ", "ų", "µ", "у", "ဉ", "ု", "ူ", "ǔ", "ǖ", "ǘ", "ǚ", "ǜ", "უ", "उ": return "u"
        case "v", "в", "ვ", "ϐ": return "v"
        case "w", "ŵ", "ω", "ώ", "ဝ", "ွ": return "w"
        case "x", "χ", "ξ": return "x"
        case "y", "ý", "ỳ", "ỷ", "ỹ", "ỵ", "ÿ", "ŷ", "й", "ы", "υ", "ϋ", "ύ", "ΰ", "ي", "ယ": return "y"
        case "z", "ź", "ž", "ż", "з", "ζ", "ز", "ဇ", "ზ": return "z"
        case "ع", "आ", "آ": return "aa"
        case "ä", "æ", "ǽ": return "ae"
        case "ऐ": return "ai"
        case "@": return "at"
        case "ч", "ჩ", "ჭ", "چ": return "ch"
        case "ђ": return "dj"
        case "џ", "ძ": return "dz"
        case "ऍ": return "ei"
        case "غ", "ღ": return "gh"
        case "ई": return "ii"
        case "ĳ": return "ij"
        case "х", "خ", "ხ": return "kh"
        case "љ": return "lj"
        case "њ": return "nj"
        case "ö", "œ", "ؤ": return "oe"
        case "ऑ": return "oi"
        case "ψ": return "ps"
        case "ш", "შ", "ش": return "sh"
        case "ß": return "ss"
        case "ŝ": return "sx"
        case "þ", "ϑ", "ث", "ذ", "ظ": return "th"
        case "ц", "ც", "წ": return "ts"
        case "ü": return "ue"
        case "ऊ": return "uu"
        case "я": return "ya"
        case "ю": return "yu"
        case "ж", "ჟ", "ژ": return "zh"
        case "©": return "(c"
        case "A", "Á", "À", "Ả", "Ã", "Ạ", "Ă", "Ắ", "Ằ", "Ẳ", "Ẵ", "Ặ", "Â", "Ấ", "Ầ", "Ẩ", "Ẫ", "Ậ", "Å", "Ā", "Ą", "Α", "Ά", "Ἀ", "Ἁ", "Ἂ", "Ἃ", "Ἄ", "Ἅ", "Ἆ", "Ἇ", "ᾈ", "ᾉ", "ᾊ", "ᾋ", "ᾌ", "ᾍ", "ᾎ", "ᾏ", "Ᾰ", "Ᾱ", "Ὰ", "ᾼ", "А", "Ǻ", "Ǎ": return "A"
        case "B", "Б", "Β", "ब": return "B"
        case "C", "Ç", "Ć", "Č", "Ĉ", "Ċ": return "C"
        case "D", "Ď", "Ð", "Đ", "Ɖ", "Ɗ", "Ƌ", "ᴅ", "ᴆ", "Д", "Δ": return "D"
        case "E", "É", "È", "Ẻ", "Ẽ", "Ẹ", "Ê", "Ế", "Ề", "Ể", "Ễ", "Ệ", "Ë", "Ē", "Ę", "Ě", "Ĕ", "Ė", "Ε", "Έ", "Ἐ", "Ἑ", "Ἒ", "Ἓ", "Ἔ", "Ἕ", "Ὲ", "Е", "Ё", "Э", "Є", "Ə": return "E"
        case "F", "Ф", "Φ": return "F"
        case "G", "Ğ", "Ġ", "Ģ", "Г", "Ґ", "Γ": return "G"
        case "H", "Η", "Ή", "Ħ": return "H"
        case "I", "Í", "Ì", "Ỉ", "Ĩ", "Ị", "Î", "Ï", "Ī", "Ĭ", "Į", "İ", "Ι", "Ί", "Ϊ", "Ἰ", "Ἱ", "Ἳ", "Ἴ", "Ἵ", "Ἶ", "Ἷ", "Ῐ", "Ῑ", "Ὶ", "И", "І", "Ї", "Ǐ", "ϒ": return "I"
        case "J": return "J"
        case "K", "К", "Κ": return "K"
        case "L", "Ĺ", "Ł", "Л", "Λ", "Ļ", "Ľ", "Ŀ", "ल": return "L"
        case "M", "М", "Μ": return "M"
        case "N", "Ń", "Ñ", "Ň", "Ņ", "Ŋ", "Н", "Ν": return "N"
        case "O", "Ó", "Ò", "Ỏ", "Õ", "Ọ", "Ô", "Ố", "Ồ", "Ổ", "Ỗ", "Ộ", "Ơ", "Ớ", "Ờ", "Ở", "Ỡ", "Ợ", "Ø", "Ō", "Ő", "Ŏ", "Ο", "Ό", "Ὀ", "Ὁ", "Ὂ", "Ὃ", "Ὄ", "Ὅ", "Ὸ", "О", "Θ", "Ө", "Ǒ", "Ǿ": return "O"
        case "P", "П", "Π": return "P"
        case "Q": return "Q"
        case "R", "Ř", "Ŕ", "Р", "Ρ", "Ŗ": return "R"
        case "S", "Ş", "Ŝ", "Ș", "Š", "Ś", "С", "Σ": return "S"
        case "T", "Ť", "Ţ", "Ŧ", "Ț", "Т", "Τ": return "T"
        case "U", "Ú", "Ù", "Ủ", "Ũ", "Ụ", "Ư", "Ứ", "Ừ", "Ử", "Ữ", "Ự", "Û", "Ū", "Ů", "Ű", "Ŭ", "Ų", "У", "Ǔ", "Ǖ", "Ǘ", "Ǚ", "Ǜ": return "U"
        case "V", "В": return "V"
        case "W", "Ω", "Ώ", "Ŵ": return "W"
        case "X", "Χ", "Ξ": return "X"
        case "Y", "Ý", "Ỳ", "Ỷ", "Ỹ", "Ỵ", "Ÿ", "Ῠ", "Ῡ", "Ὺ", "Ύ", "Ы", "Й", "Υ", "Ϋ", "Ŷ": return "Y"
        case "Z", "Ź", "Ž", "Ż", "З", "Ζ": return "Z"
        case "Ä", "Æ", "Ǽ": return "AE"
        case "Ч": return "CH"
        case "Ђ": return "DJ"
        case "Џ": return "DZ"
        case "Ĝ": return "GX"
        case "Ĥ": return "HX"
        case "Ĳ": return "IJ"
        case "Ĵ": return "JX"
        case "Х": return "KH"
        case "Љ": return "LJ"
        case "Њ": return "NJ"
        case "Ö", "Œ": return "OE"
        case "Ψ": return "PS"
        case "Ш": return "SH"
        case "ẞ": return "SS"
        case "Þ": return "TH"
        case "Ц": return "TS"
        case "Ü": return "UE"
        case "Я": return "YA"
        case "Ю": return "YU"
        case "Ж": return "ZH"
        case "_": return "_"
        default: return " "
        }
    }
    
    public var slugify: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
            .map { "\($0)".safeString }
            .joined()
            .lowercased()
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: "-")
    }
}
