#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-


File::open(ARGV[0]) { |f|
  f.each { |l|
    entry = l.split(':')

    p = 'a'
    while p.length < 5
      if p.crypt(entry[1]) == entry[1]
        print entry[0], "'s password is ", p, "\n"
        break
      end
      p.succ!
    end
  }
}
