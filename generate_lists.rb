#!/usr/bin/env ruby

# Genarate Markdown output list for Unicode characters

N_COL = 16

def generate_char_list(f, code_from, code_to)
  f.printf "# Markdown outputs for Unicode characters (U+%04X to U+%04X)\n", code_from, code_to
  f.puts

  if code_from < 0x20
    f.puts "> U+0000 to U+001F are control characters."
    f.puts
    code_from = 0x20
  end

  f.puts (0..15).inject("| U+ | ") {|row, col| row + sprintf(" %X |", col) }
  f.puts (0..N_COL).inject('|') {|row, _| row + ' :-: |' }
  all_codes = (code_from..code_to).to_a
  until all_codes.empty?
    codes = all_codes.shift(N_COL)
    if codes[0] == 0xD800
      f.puts
      f.puts "> U+D800 to U+DFFF are reserved for surrogate pairs."
      return
    else
      hex = sprintf("%03X", codes[0] / 16)
      f.puts "| <span id=\"#{hex}x\">#{hex}0</span> |" +
             codes.inject('') {|row, code|
               chr = code.chr(Encoding::UTF_8)
               row + sprintf(" <span id=\"%04X\">`%s`</span><br>%s |", code, chr, chr)
             }
    end
  end
end

for base in 0..0x1F
  code_from = base * 0x1000
  code_to = code_from + 0x0FFF
  filename = sprintf "%04X.md", code_from
  open(filename, "w") do |f|
    generate_char_list f, code_from, code_to
  end
end
