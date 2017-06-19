require 'httparty'
require 'nokogiri'
require 'pry'
require 'csv'

page = "https://en.wikipedia.org/wiki/List_of_Orange_Is_the_New_Black_characters#Recurring_cast"

OITNB_C = {}

def complete_dic(page)
  parsed_content = Nokogiri::HTML(page).css('.pod')[0].css('tr').each do |game|
    game_name = game.css('td a').text.strip
    publisher = game.css('td')[2].text.split("\t")[2].split(",")[0]
    platform = game.css('td')[1].text.strip
    img = game.css('td img').map {|i| i['src']}

    if GAMES_DIC.key?(game_name)
      GAMES_DIC[game_name][:platform] << platform
    else
      GAMES_DIC[game_name] = {publisher: publisher, platform: [platform], img: img, game: game_name}
    end
  end
end

def table_extracter(table)
  final_list = []
  table.css('tr').each do |row|
    if row.css('td')[1]
      char_name = row.css('td')[1].text
      if row.css('td').each { |i| i.text == "Main"}
        cast = "Main"
      else
        cast = "Recurring"
      end
      puts [char_name, cast]
      final_list << {char_name: char_name, cast: cast}
    end
  end
  final_list
end



#complete_dic

#GAMES_DIC.each {|i| puts i}

#binding.pry

#puts "end of program"