#!/usr/bin/env ruby

# Genarate Markdown output list for Unicode characters

N_COL = 16

def output_hr(f)
  f.puts
  f.puts "--------------------"
  f.puts
end

def output_links(f, code_from)
  f.puts "| [README](../README.md) |<br>"
  f.print "|"
  for n in 0..1
    for m in 0..15
      base = (16 * n + m) * 0x1000
      if base == code_from
        f.printf " %X%X\\*\\*\\* |", n, m
      else
        f.printf " [%X%X\\*\\*\\*](%04X.md) |", n, m, (16 * n + m) * 0x1000
      end
    end
    f.puts "<br>|" if n == 0
  end
  f.puts
end

def generate_char_list(f, code_from, code_to)
  f.printf "# Markdown outputs for Unicode characters (U+%04X..%04X)\n", code_from, code_to
  f.puts
  code_base = code_from
  output_links f, code_base
  output_hr f

  f.puts "`code`: as code span, &nbsp; **none**: character only, &nbsp; **txt**: character + VS15(U+FE0E), &nbsp; **emo**: character + VS16(U+FE0F)"
  f.puts

  if code_from < 0x20
    f.puts "> U+0000..001F are omitted (unprintable control characters)."
    f.puts
    code_from = 0x20
  end

  f.puts (0..15).inject("| U+ | ") {|row, col|
    row + sprintf(" %X<br>`code`<br>none<br>txt<br>emo |", col)
  }
  f.puts (0..N_COL).inject('|') {|row, _| row + ' :-: |' }
  all_codes = (code_from..code_to).to_a
  until all_codes.empty?
    codes = all_codes.shift(N_COL)
    if codes[0] == 0xD800
      f.puts
      f.puts "> U+D800..DFFF are omitted (reserved for surrogate pairs)."
      break
    else
      hex = sprintf("%03X", codes[0] / 16)
      f.puts "| <span id=\"#{hex}x\">#{hex}0</span> |" +
             codes.inject('') {|row, code|
               chr = code.chr(Encoding::UTF_8)
               row + sprintf(" <span id=\"%04X\">`%s`</span><br>%s<br>%s\uFE0E<br>%s\uFE0F |",
                             code, chr, chr, chr, chr)
             }
    end
  end
  output_hr f
  output_links f, code_base
end

for base in 0..0x1F
  code_from = base * 0x1000
  code_to = code_from + 0x0FFF
  filename = sprintf "lists/%04X.md", code_from
  open(filename, "w") do |f|
    generate_char_list f, code_from, code_to
  end
end
