require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))

def get_mps_url
  array_of_mps_firstname = []
  array_of_mps_lastname = []
  array_of_emails = []
  hash_mps_email = {}

  doc.xpath('//td[1]/a/@href').each do |name|
    name.text.split().tr
    array_of_mps_firstname =
    array_of_mps_lastname =
  end
  name
return hash_mps_email = array_of_mps.zip(array_of_emails).to_h
end

pre

//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[1]/a
