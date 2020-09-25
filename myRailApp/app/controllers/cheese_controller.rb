#  Author: Shuting Yang
#  Date: Sep 20, 2020
#  Modified Sep 24, 2020
#  Description: Sample program, that uses Apache Commons CSV library to open
#  and print records from the CSV dataset on screen.
 
#  Apache Commons CSV version 1.6 downloaded from:
#  http://commons.apache.org/proper/commons-csv/download_csv.cgi
#  License is packaged within the downloadable binary zip archive,
#   as well as included in this project folder.
 
#  This program was created with help from Appache Commons API documents:
#  http://commons.apache.org/proper/commons-csv/archives/1.6/apidocs/index.html

require 'csv'

class CheeseController < ApplicationController
  def index
    print "mumu"
    @cheeseList = []
    csv = openFile()
    i=0
    CSV.parse(csv, headers: false).each do |row|
      # puts row
      if i<1
        i+=1
        next
      end
      i+=1;
      item = CheeseModel.new(id: row[0], date:row[1], cases:row[2], deaths:row[3], cases_14_100k:row[4], cases_100k:row[5],name_fr:row[6], name_en:row[7])
      @cheeseList.push(item)
      puts item
      break if i>10
    end
    print @cheeseList
  end

  def openFile
    begin
      csv = File.read('/Users/shutingyang/Desktop/CST8333ruby/myRailApp/app/controllers/InternationalCovid19Cases.csv')
    rescue SystemCallError => e
      puts e.class # => Errno::ENOENT
      puts e.class.superclass # => SystemCallError
      puts e.class.superclass.superclass # => StandardError
    end
  end

  def cheesedata
  end
end

