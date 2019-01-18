require 'rubygems'
require 'nokogiri'
require 'open-uri'

@my_hash = []

def senator_informations
  listing_senator
end

def listing_senator
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  page.css('.col3 > li > a').each do |node|
    url_senator = node.values
    get_last_fist_name_email(url_senator)
  end
end

def get_last_fist_name_email(url_senator)
  email =[]
  name = []
  page2 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{url_senator[0]}"))
  page2.xpath('//a[@class = "email"]').each do |node|
    h = node.values[1].delete_prefix('mailto:')
    email << h
  end

  name << page2.xpath('//h1').text

  @my_hash = name.zip(email).to_h
  puts @my_hash

end

puts senator_informations

