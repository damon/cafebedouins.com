#!/usr/bin/env ruby

require 'rubygems'
require 'faster_csv'
require 'activesupport'

class Bedouins
  def self.execute
    fn = "members.csv"

    ignores = ["thirdprestigeco","capitalfactory","railsvitamins"]

    hashes = []
    FasterCSV.foreach(fn, :headers => true, :col_sep => ',') do |row|
      row_hash = row.to_hash
      hashes << {"name" => row_hash["name"], "screen_name" => row_hash["screen_name"], "image_url" => row_hash["image"].gsub("normal","bigger")} unless ignores.include?(row_hash["screen_name"].downcase)
    end

    h = {"members" => hashes.shuffle[0..19]}

    File.open("members.json", 'w') { |file| file.write(h.to_json)}
  end
end