require 'uri'
require 'net/http'
require 'rexml/document'

namespace :db do
  desc "Update currency exchange rate data in the database"
  task update: :environment do
    begin
      uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")
      response = Net::HTTP.get_response(uri)
      doc = REXML::Document.new(response.body)
      valute = doc.root.elements.to_a
    rescue Exception => e
      abort "Не удалось установить соединение! #{e}"
    end

    valute.each do |valute_id|
      nominal = valute_id.elements['Nominal'].text + " "
      name = valute_id.elements['Name'].text
      value = valute_id.elements['Value'].text.gsub(/,/, ".").to_f

      currency = Currency.find_by(name: nominal + name)
      if currency
        currency.update!(rate: value)
      else
        Currency.create!(rate: value, name: nominal + name)
      end
    end
  end
end
