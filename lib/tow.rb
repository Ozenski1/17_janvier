require 'rubygems'
require 'nokogiri'
require 'open-uri'




@index_of_95 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_urls
@array_townhall_url = []
  @index_of_95.xpath('//p/a/@href').each do |urls|
  @array_townhall_url << "#{urls}".sub('.',"https://www.annuaire-des-mairies.com")
  end
 return @array_townhall_url
end


def get_townhall_email(townhall_url)

@array_townhall_email = []
@array_townhall_name = []
townhall_url.each do |url|
  @townhall_page = Nokogiri::HTML(open(url))
  @townhall_page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
    @array_townhall_email << email.text
  end
  end
  @index_of_95.xpath('//p/a/@href').each do |name|
    @array_townhall_name << name.content
  end

  @array_townhall_names=[]
  @array_townhall_name.each do |i|
  @array_townhall_names<< i[5..-6]
  end

puts @hash_townhall_name_email = @array_townhall_names.zip(@array_townhall_email).to_h
end


def perform
get_townhall_email(get_townhall_urls)
end

perform
