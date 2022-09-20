# Genarate Unicode character lists

N_COL = 16

def generate_char_list(f, code_from, code_to)
  f.printf "# Unicode character list (%04X-%04X)\n", code_from, code_to
  f.puts
  f.puts (0..15).inject("| U+ | ") {|row, col| row + sprintf(" %X |", col) }
  f.puts (0..N_COL).inject('|') {|row, _| row + ' :-: |' }
  all_codes = (code_from..code_to).to_a
  until all_codes.empty?
    codes = all_codes.shift(N_COL)
    if codes[0] == 0xD800
      f.puts
      f.puts "> D800-DFFF are not allocated for single characters. They are used for surrogate pairs."
      return
    else
      f.puts sprintf("| %04X |", codes[0]) +
             codes.inject('') {|row, c|
               c = c.chr(Encoding::UTF_8)
               row + sprintf(" `%s`<br>%s |", c, c)
             }
    end
  end
end

(0..0x1F).each {|base|
  code_from = base * 0x1000
  code_to = code_from + 0x0FFF
  filename = sprintf "%04X.md", code_from
  open(filename, "w") do |f|
    generate_char_list f, code_from, code_to
  end
}

