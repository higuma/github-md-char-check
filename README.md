# Markdown output check for Unicode characters

Unicode characters are basically displayed as-is for Markdown processing.

But some Unicode characters are automatically converted to Emoji in GitHub markdown
(e.g. `▶` (U+25B6) is converted to ▶).

> See Wikipedia for Emoji-Unicode mapping as below.
> 
> https://en.wikipedia.org/wiki/Emoji#In_Unicode

The following lists can be used to determine how each character is diplayed in GitHub Markdown.

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

## Controling text and emoji outputs

Unicode characters which are associated with emojis are basically displayed as emoji icons in GitHub Markdown. Most characters higher than U+1000 which has emoji representations are displayed as emoji as default (e.g. `☀`(U+2600) is displayed as ☀).

But sometimes it would cause problems. Suppose you want to output `A ↔ B` as normal text. But `↔` is displayed as an emoji icon as default.

You can display normal texts using VS15(U+FE0E) for characters which display as emoji as default.

| Example | Output |
| - | - |
| `A ↔ B` | A ↔ B |
| `A ↔&#xFE0E; B;` | A ↔&#xFE0E; B |

On the other hand, you can display emoji icons using VS16(U+FE0F) for characters which display as text as default. For example, `©`(U+00A9) and `®`(U+00AF) are displayed as text as default. But you can change them to emojis as follows.

| Example | Output |
| - | - |
| `© ®` | © ® |
| `©&#xFE0F; ®&#xFE0F;` | ©&#xFE0F; ®&#xFE0F; |

> VS15(U+FE0E) and VS16(U+FE16) are called _validation selectors_ and they are are used as switches for a character to display as text or emoji. See Wikipedia as below for details.
> 
> https://en.wikipedia.org/wiki/Variation_Selectors_(Unicode_block)
 
