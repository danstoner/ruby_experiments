require 'set'
input_lines = $stdin.read.split("\n")

#puts input_lines

dictionary = Hash.new

dictionary_size = input_lines[0].to_i

1.upto(dictionary_size) {|i|
  sorted = input_lines[i].chars.sort.join
  dictionary[sorted] = Set[].add(input_lines[i])

}

wordlist = input_lines[dictionary_size+1, input_lines.length]


(dictionary_size+1).upto(input_lines.length-1) {|i|
  word = input_lines[i]

  sorted = word.chars.sort.join

  dictionary[sorted].add(word)
}

wordlist.each { |word| 
  out_array = Array.new

  dictionary[word.chars.sort.join].each {|w|
    if w != word 
      out_array.push(w)
    end
  }


  stuff_and_sorted = [word].concat(out_array.sort)

#  out_line =  ([word] << sorted).join(" ")

  puts stuff_and_sorted.join(" ")

}
