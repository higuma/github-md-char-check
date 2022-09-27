# Markdown output check for Unicode characters

## Emoji in Unicode

Unicode 15.0 represents emoji using 1424 characters. Some of them are

* [Miscellaneous Symbols](https://en.wikipedia.org/wiki/Miscellaneous_Symbols) (U+2600..U+26FF)
* [Dingbats](https://en.wikipedia.org/wiki/Dingbats_(Unicode_block)) (U+2700..U+27BF)
* [Miscellaneous Symbols and Pictographs](https://en.wikipedia.org/wiki/Miscellaneous_Symbols_and_Pictographs) (U+1F300..U+1F5FF)
* [Emoicons](https://en.wikipedia.org/wiki/Emoticons_(Unicode_block)): U+1F600..U+1F64F
* [Supplemental Symbols and Pictographs](https://en.wikipedia.org/wiki/Supplemental_Symbols_and_Pictographs) (U+1F900..U+1F9FF)
* [Symbols and Pictographs Extended-A](https://en.wikipedia.org/wiki/Symbols_and_Pictographs_Extended-A) (U+1FA70..U+1FAFF)
* [Transport and Map Symbols](https://en.wikipedia.org/wiki/Transport_and_Map_Symbols) (U+1F680..U+1F6FF)







Unicodeと絵文字の関係の文章

> See Wikipedia for Emoji-Unicode mapping as follows.
> 
> https://en.wikipedia.org/wiki/Emoji#In_Unicode

Unicode characters associated with emojis are basically displayed as emoji in GitHub Markdown. Most characters higher than U+1000 which have emoji representations are displayed as emoji as default (e.g. `☀`(U+2600) is displayed as ☀).

## Controlling text and emoji outputs on GitHub

But sometimes it would cause problems. Suppose you want to output `A ↔ B` as normal text. But `↔` is displayed as emoji (e.g. A ↔ B). You can display them as normal text using VS15 (U+FE0E) for characters which display as emoji as default.

| Markdown | Output |
| - | - |
| `A ↔ B` | A ↔ B |
| `A ↔&#xFE0E; B;` | A ↔&#xFE0E; B |

On the other hand, you can display emoji icons using VS16 (U+FE0F) for characters which display as text as default. For example, `©`(U+00A9), `®`(U+00AF), and `™`(U+2122) are displayed as text. You can change them to emojis as follows.

| Markdown | Output |
| - | - |
| `© ® ™` | © ® ™ |
| `©&#xFE0F; ®&#xFE0F; ™&#xFE0F;` | ©&#xFE0F; ®&#xFE0F; ™&#xFE0F; |

VS15 (U+FE0E) and VS16 (U+FE16) are called _variation selectors_. They act as switches for each character to display as text or emoji. See Wikipedia for details.

https://en.wikipedia.org/wiki/Variation_Selectors_(Unicode_block)

## Lists

The following lists display all printable Unicode characters which may be associated with emojis as text on the target Markdown environment (e.g. GitHub). You can check which representation (text or emoji) is displayed for each character.

| 00000-0FFFF | 10000-1FFFF |
| :-: | :-: |
| [0000-0FFF](lists/0000.md) | [10000-10FFF](lists/10000.md) |
| [1000-1FFF](lists/1000.md) | [11000-11FFF](lists/11000.md) |
| [2000-2FFF](lists/2000.md) | [12000-12FFF](lists/12000.md) |
| [3000-3FFF](lists/3000.md) | [13000-13FFF](lists/13000.md) |
| [4000-4FFF](lists/4000.md) | [14000-14FFF](lists/14000.md) |
| [5000-5FFF](lists/5000.md) | [15000-15FFF](lists/15000.md) |
| [6000-6FFF](lists/6000.md) | [16000-16FFF](lists/16000.md) |
| [7000-7FFF](lists/7000.md) | [17000-17FFF](lists/17000.md) |
| [8000-8FFF](lists/8000.md) | [18000-18FFF](lists/18000.md) |
| [9000-9FFF](lists/9000.md) | [19000-19FFF](lists/19000.md) |
| [A000-AFFF](lists/A000.md) | [1A000-1AFFF](lists/1A000.md) |
| [B000-BFFF](lists/B000.md) | [1B000-1BFFF](lists/1B000.md) |
| [C000-CFFF](lists/C000.md) | [1C000-1CFFF](lists/1C000.md) |
| [D000-DFFF](lists/D000.md) | [1D000-1DFFF](lists/1D000.md) |
| [E000-EFFF](lists/E000.md) | [1E000-1EFFF](lists/1E000.md) |
| [F000-FFFF](lists/F000.md) | [1F000-1FFFF](lists/1F000.md) |

