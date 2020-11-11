module Ditch

  # Class wrapping the data-structure used or Row data in Creek
  class Ditch::IndexedRow
    attr_reader :index, :creek_row

    # Create instance of IndexedRow
    # * +headers+ Array holding column-headers
    # * +index+ Row Index in the sheet
    # * +data+ The original <i>creek row</i>
    def initialize (headers,index, data)
      @headers = headers
      @index = index
      @creek_row = data
    end

    # Get cell value from column-designation
    # * +cell+ column-designation such as 'A'
    def get( cell )
      creek_value = @creek_row["#{cell.upcase}#{@index}"]
      (creek_value.nil? || creek_value == 'NULL' || (creek_value.class.method_defined?(:empty?) && creek_value.empty?)) ? nil : creek_value
    end

    # Get cell value from 'header-title'
    # * +title+ Sting describing column by <i>name</i>
    def lookup( title )
      raise Ditch::DitchError.new('No headers..') if @headers.nil?
      cell = @headers[title]

      raise Ditch::DitchError.new("Title '#{title}' not found in headers..") if cell.nil?
      get cell.strip
    end

    # Test if cell non-nil value
    # * +title+ String containing header-title of a column
    def has_value?(title)
      !lookup(title).nil?
    end

    # Format the row into a <i>human-readable</i> string
    def to_s
      if @headers.nil?
        "#{@index}: #{@creek_row.to_s}"
      else
        parts = Array.new
        @headers.each_key do |h|
          parts << "'#{h}'=>'#{lookup(h)}'"
        end
        "#{@index}: {#{parts.join(', ')}}"
      end
    end

  end
end
