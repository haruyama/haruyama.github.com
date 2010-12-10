#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

passwords = []

File::open(ARGV[0]) { |f|

  f.each { |l|
    passwords << l.chomp
  }
}

#p passwords


File::open(ARGV[1]) { |f|
  f.each { |l|
    entry = l.split(':')

    passwords.each { |p|
      if p.crypt(entry[1]) == entry[1]
        print entry[0], "'s password is ", p, "\n"
        break
      end
    }
  }
}
