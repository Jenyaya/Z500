require 'open-uri'
require 'nokogiri'

When /^I set search filter with:$/ do |table|

  search = array_to_hash(table.raw)

  search.each { |key, value|
    case key
      when 'Min square' then
        # fill_in 'search[powierzchnia_min]', :with => '50'

      when 'Max square' then
        #fill_in 'search[powierzchnia_max]', :with => '125'


      when 'tylko parterowe' then
        check('tylko parterowe')

    end

  }

end


When /^I click '(.*)' button$/ do |button|
  click_button(button)
  sleep(10)
end

Then /^I should see list of plans$/ do
  page.should have_selector('div#projects-list')

end

When /^I parse HTML$/ do

  doc = Nokogiri::HTML(open(current_url))
  @projects = []


  while page.has_css?('div.pagenator a.next-page')

    doc.css("div.details span.project-name").each { |name|
      @projects << name.text
    }

    next_button = find('a.next-page')
    next_button.click
  end

  puts @projects
end

Then /^I download PDFs$/ do

  base = "http://www.z500.pl/res/rysunki/{ID}_rysunek_szczegolowy.pdf"

  @projects.each { |key|

    Net::HTTP.start("www.z500.pl") { |http|
      resp = http.get("/res/rysunki/#{key}_rysunek_szczegolowy.pdf")

      open("C:/Z500/#{key}_rysunek_szczegolowy.pdf", "wb") { |file|
        file.write(resp.body)
      }

    }
  }
end


When /^I browse search pages$/ do

  doc = Nokogiri::HTML(open(current_url))

  doc.css("ul.pages").each { |name|
    puts name.text.inspect
  }
end


