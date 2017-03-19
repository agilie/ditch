require 'creek'
module Ditch

  # Extends the Creek::Book
  class Ditch::Book < Creek::Book
    # Retrieve the Sheet on a given index in the Book
    # * +number+ The sheet <i>number</i> within the Book
    # * +options+ Options passed on to the Creation of the Ditch::Sheet
    def sheet(number, options={})
      Ditch::Sheet.new sheets[number],  options
    end
  end

end
