module Ditch
  # Class wrapping the Creek::Sheet class for adding small things
  class Ditch::Sheet
    attr_reader :creek_sheet

    # Create a Ditch::Sheet
    # * +sheet+ Creek::Sheet to make the base
    # * +options+ Options to control the behaviour of the sheet
    def initialize(sheet,options={})
      @creek_sheet = sheet
      @opts = options
      if @opts[:first_row_is_header]
        @headers = headers
      end
    end

    # Retrieve headers, if :first_row_is_header option is set
    def headers
      headers = Hash.new
      header_row = @creek_sheet.rows.first
      header_row.each_key do |k|
        headers[header_row[k]]= k.gsub(/\d/,'')
      end
      headers
    end

    # Enumerate the Rows in the given Sheet, As Ditch::IndexedRows
    def rows
      Enumerator.new do |y|
        @creek_sheet.rows.each_with_index do |row, index|
          unless index == 0 && @opts[:first_row_is_header]
            y << Ditch::IndexedRow.new(@headers, index+1, row)
          end
        end
      end
    end

  end
end
