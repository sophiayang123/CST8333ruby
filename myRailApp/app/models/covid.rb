#  Author: Shuting Yang
#  Date September 24, 2019
#  Description: Covid object for covid records.
 
require "time"

# Represents a covid-19 statictis record from a csv file 
# @author Shuting Yang
class Covid < ApplicationRecord
    puts "Shuting Yang, Assignment1"
    attr_accessor :id, :date, :cases, :deaths, :name_fr, :name_en

    # Default Constructor */
    # String-based constructor, to facilitate reading string values from csv file.
    # The strings are cleaned, and converted to the appropriate type where needed, 
    # additionally empty strings are converted to null references.
    def initialize(params)    
        super()
        params ||={}
        @id = processAsString(params[:id])
        @date = processAsLocalDate(params[:date])
        @cases = processAsInteger(params[:cases])
        @deaths = processAsInteger(params[:deaths])
        @name_fr = processAsString(params[:name_fr])
        @name_en = processAsString(params[:name_en])
    end

    # If string is not null return it,
    # Strings with only "null" or blank result in null reference being returned.
    # @param [String] String to be processed
    # @return [String] processed String or null
    def processAsString(value)
        if value.nil? || value.blank?
          nil
        else 
          value
        end
    end

    #  Utility method that cleans the String passed and attempts to convert
    #  it into an Integer. If the passed String is null, empty, or contains "null",
    #  then a null is returned.
    #  @param [String] String to be processed
    #  @return [Integer] Integer or null
    def processAsInteger(value) 
        result = processAsString(value);
        result==nil ? nil: Integer(result);
    end

    #  Utility method that cleans the String passed and attempts to convert
    #  it into a Decimal. If the passed String is null, empty, or contains "null",
    #  then a null is returned.
    #  @param [String] String to be processed
    #  @return [Decimal] or null
    def processAsDecimal(value)
        result = processAsString(value);
        result==nil ? nil: result.to_d;
    end

    
    #  Utility method that cleans the String passed and attempts to convert
    #  it into a Date. If the passed String is null, empty, or contains "null",
    #  then a null is returned.
    #  @param [String] String to be processed
    #  @return [Date] or null 
    def processAsLocalDate(value)
        result = processAsString(value);
        result==nil ? nil: Date.parse(result);
    end

    # basic string reprentation of the covid data record */
    def to_s
        '%s %s %s %s %s %s' % [@id, @date, @cases, @deaths, @name_en, @name_fr]
    end
end
