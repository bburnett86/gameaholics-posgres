require 'net/http'
require 'uri'
require 'nokogiri'
require 'open-uri'

module Gameaholics

  URL_START = 'http://www.boardgamegeek.com/xmlapi/search?search='
  URL_END = '&exact=1'

  module ApiHook

    def self.get_game_details(name)
      resp = get_response(URL_START + name + URL_END)
      n_obj = Nokogiri::HTML(resp)
      id = n_obj.css('boardgames boardgame')[0]["objectid"]
      resp = get_response('http://www.boardgamegeek.com/xmlapi/boardgame/' + id)
    end

    def self.get_description(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('description')[0].inner_html
      desc.gsub!("&lt;br/&gt;&lt;br/&gt;", " ")
      desc.gsub!("&amp;&amp;", "&")
      desc
    end

    def self.get_year_published(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('yearpublished')[0].inner_html
    end

    def self.get_min_num_players(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('minplayers')[0].inner_html
    end

    def self.get_max_num_players(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('maxplayers')[0].inner_html
    end

    def self.get_min_play_time(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('minplaytime')[0].inner_html
    end

    def self.get_max_play_time(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('maxplaytime')[0].inner_html
    end

    def self.get_average_play_time(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = n_obj.css('playingtime')[0].inner_html
    end

    def self.get_image_url(name)
      details = get_game_details(name)
      n_obj = Nokogiri::HTML(details)
      desc = "http:" + n_obj.css('image')[0].inner_html
    end

    # def self.get_rules_links(name)
    #   details = get_game_details(name)
    #   n_obj = Nokogiri::HTML(details)
    #   id = n_obj.css('boardgames boardgame')[0]["objectid"]
    #   n_obj = Nokogiri::HTML(open("http://boardgamegeek.com/boardgame/#{id}"))
    #   nodes = n_obj.css("td[ng-bind-html*='weblink.objectlink']")
    # end

    private
    def self.get_response(uri_p)
      uri = URI(uri_p)
      http = Net::HTTP.new(uri.host, uri.port)
      http.request(Net::HTTP::Get.new(uri.request_uri)).body
    end

  end

end
