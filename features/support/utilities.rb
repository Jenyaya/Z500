require 'open-uri'
require 'nokogiri'
require 'hpricot'
require 'net/http'

def array_to_hash(array)
  h = {}
  array.each { |a|

    h[a[0]] = a[1]

  }
  return h
end


def paging
  # http://www.z500.pl/domy.html

  #doc = Nokogiri::HTML(open("http://www.z500.pl/domy.html"))
  #
  ##puts doc.css("div[@class='pagenator']")
  #
  #puts doc.css("div[@class='pagenator']//ul/li/a")
  #
  #@hp = Hpricot(open('http://www.z500.pl/domy.html'))
  #
  # (@hp/"div[@class='pagenator']//ul[1]/li").each { |page|
  #
  #   puts page.at('a/')
  #
  # }
end

def download_pdf


  z500 = ["Z42", "Z60", "Z73", "Z11", "Z139", "Z57", "Z39", "Z16", "Z262", "Z264", "Z12", "Z78", "Z87", "Z71", "Z72", "Z212", "Z254", "Z15", "Z249", "Z211", "Z42", "Z60", "Z73", "Z11", "Z139", "Z57", "Z39", "Z16", "Z262", "Z264", "Z12", "Z78", "Z87", "Z71", "Z72", "Z212", "Z254", "Z15", "Z249", "Z211", "Z42", "Z60", "Z73", "Z11", "Z139", "Z57", "Z39", "Z16", "Z262", "Z264", "Z12", "Z78", "Z87", "Z71", "Z72", "Z212", "Z254", "Z15", "Z249", "Z211", "Z42", "Z60", "Z73", "Z11", "Z139", "Z57", "Z39", "Z16", "Z262", "Z264", "Z12", "Z78", "Z87", "Z71", "Z72", "Z212", "Z254", "Z15", "Z249", "Z211"]


  z500.each { |key|

    Net::HTTP.start("www.z500.pl") { |http|
      resp = http.get("/res/rysunki/#{key}_rysunek_szczegolowy.pdf")
      puts "Response body for project "+ key
      puts resp.body.nil?
      puts resp.body.empty?
      open("C:/Z500/#{key}_project.pdf", "wb") { |file|
        file.write(resp.body)
      }

    }
  }

end

