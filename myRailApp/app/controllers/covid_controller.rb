#  Author: Shuting Yang
#  Date: Sep 20, 2020
#  Modified Sep 24, 2020
#  Description: Sample program, that uses Rails CSV library to open
#  and print records from the CSV dataset on screen.
 
#  csv data retrieve from government site https://open.canada.ca/data/en/dataset/fc11aa70-821b-4c64-be19-020a2465b0de
#  License is from government site https://open.canada.ca/en/open-government-licence-canada
#   as well as included in this project folder.


require 'csv'

class CovidController < ApplicationController
  def index
    @covidList = []
    csv = openFile()
    i=0
    CSV.parse(csv, headers: false).each do |row|
      # puts row
      if i<1
        i+=1
        next
      end
      i+=1;
      item = Covid.new(id: row[0], date:row[1], cases:row[2], deaths:row[3], name_fr:row[6], name_en:row[7])
      @covidList.push(item)
      # puts item
      break if i>10
    end
    puts 'Id date  cases deaths name_fr name_en'
    printList(@covidList)
    # print @covidList
  end

  # take a list of covid data object, loop through it and print out them
  # param [array]
  def printList(list)
    list.each do |item|
      puts item
    end
  end

  # find file covidCases, if cannot find, handle the exception
  def openFile
    begin
      csv = File.read('/Users/shutingyang/Desktop/CST8333ruby/myRailApp/app/controllers/InternationalCovid19Cases.csv')
    rescue SystemCallError => e
      puts e.class # => Errno::ENOENT
      puts e.class.superclass # => SystemCallError
      puts e.class.superclass.superclass # => StandardError
    end
  end

end

