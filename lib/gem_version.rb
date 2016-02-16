require 'open-uri'
require 'nokogiri'

class GemVersion

	def self.info gem_name
		return puts "A gem must be informed to get version" if gem_name.nil?
		puts "#{gem_name} current version is #{get(gem_name)}"
	end

	def self.get gem_name
		page = Nokogiri::HTML(open("https://rubygems.org/gems/#{gem_name}"))
		page.css("h1 i").text
	end
end

GemVersion.info ARGV[0]
