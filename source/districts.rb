require 'nokogiri'
doc = Nokogiri::HTML(File.open("#{File.expand_path(File.dirname(__FILE__))}/districts.xml"))
districts = doc.xpath('//svg/path')

districts.each do |node|
  if node.attr('id') != "State_Borders"
  	puts "\"#{node.attr('id')}\": \"#{node.attr('d')}\","
  end
end