# encoding: utf-8

require_relative './convert-v3-v4'
require 'date'

def new_post(title)
    time = Time.now
    date = time.strftime("%Y%m%d%H%M")

    File.open(get_file_path(date, title), "w:UTF-8") do |f|
        f.write get_front_matters(date, title)
    end
end

if __FILE__ == $0
    new_post(ARGV[0])
end