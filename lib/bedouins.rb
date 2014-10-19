#!/usr/bin/env ruby

require 'csv'
require 'active_support/core_ext'

class Bedouins
  def self.execute
    fn = File.join(File.dirname(__FILE__), '../public/members.csv')
    

    ignores = ["thirdprestigeco","capitalfactory","railsvitamins"]

    hashes = []
    CSV.foreach(fn, :headers => true, :col_sep => ',') do |row|
      row_hash = row.to_hash
      hashes << {"name" => row_hash["name"], "screen_name" => row_hash["screen_name"], "image_url" => row_hash["image"].gsub("normal","bigger")} unless ignores.include?(row_hash["screen_name"].downcase)
    end

    h = {"members" => hashes.shuffle[0..19]}

    h.to_json
  end
end