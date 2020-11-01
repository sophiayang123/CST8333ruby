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
  # read all data
  def index
    # import_from_csv()
    @covids = Covid.all
  end

  # create new record object
  def new
    @covidRecord = Covid.new
    render :new
  end

  # create new record object and insert to db
  def create
    @covids = Covid.create(covid_params)
    redirect_to '/'
  end

  # edit the object redirect to edit form
  def edit 
    @crecord = Covid.find(params[:id])
    respond_to do |format|
      format.html { render :edit, locals: { crecord: @crecord } }
    end
  end

  # find record and show detail
  def show
    @crecord = Covid.find(params[:id])
    render :show
  end

  # update record detail
  def update  
    @record = Covid.find(params[:id])
    # @record.update(cid: params[:cid], date: params[:date], deaths: params[:deaths], cases: param[:cases], name_fr: param[:name_fr], name_en: param[:name_en])
    # redirect_to covid_index_path
    # respond_to do |format|
    if @record.update(covid_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  # delete record object 
  def delete 
    @record = Covid.find(params[:id])
    @record.destroy!
    redirect_to '/'
  end

  # import data set from csv
  def import
    import_from_csv
    redirect_to '/'
  end

  # write data to another csv
  def writedata
    @records = Covid.all
    respond_to do |format|
      format.html
      format.csv { send_data @records.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end
  
  # use for initial new record obj
  private
    def covid_params
      # It's mandatory to specify the nested attributes that should be permitted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:covid).permit(:cid, :date, :cases, :deaths, :name_fr, :name_en )
    end

  # program by Shuting Yang
  # open csv file
  def openFile
    begin
        csv = File.path('/Users/shutingyang/Desktop/CST8333ruby/myRailApp/app/controllers/InternationalCovid19Cases.csv')
    rescue SystemCallError => e
        puts e.class # => Errno::ENOENT
        puts e.class.superclass # => SystemCallError
        puts e.class.superclass.superclass # => StandardError
    end
  end
  
  # program by Shuting Yang
  # import data from csv
  def import_from_csv
    Covid.delete_all
    csv = openFile()
    i=0
    CSV.foreach(csv, headers: true) do |row|
        row_hash = row.to_h
        object = Covid.create!(              
            cid: Covid.processAsString(row_hash['id']),
            date: Covid.processAsLocalDate(row_hash['date']),
            cases: Covid.processAsInteger(row_hash['cases']),
            deaths: Covid.processAsInteger(row_hash['deaths']),
            name_fr: Covid.processAsString(row_hash['name_fr']),
            name_en: Covid.processAsString(row_hash['name_en']) )
        i+=1;
        break if i>=100;
    end
  end

  # take a list of covid data object, loop through it and print out them
  # param [array]
  def printList(list)
    list.each do |item|
      puts item
    end
  end

end


