# Transliterate into the required encoding if necessary
#
# We can't rely on the encoding option in the Ruby 1.9 version CSV because this
# is ignored when it is 'compatible' (see <tt>Encoding.compatible?</tt>with the
# input for example:
#
#    CSV.generate(:encoding => 'ASCII') { |csv| '£12.34'.encoding('UTF-8') }
#
# will generate a UTF-8 encoded string.
class CsvBuilder::TransliteratingFilter
  # Transliterate into the required encoding if necessary
  def initialize(csv, input_encoding = 'UTF-8', output_encoding = 'ISO-8859-1')
    self.csv = csv

    # <tt>input_encoding</tt> is ignored because we know what this it is
    self.output_encoding = output_encoding
  end

  # Transliterate before passing to CSV so that the right characters
  # (e.g. quotes) get escaped
  def <<(row)
    @csv << convert_row(row)
  end
  alias :add_row :<<

  private

  attr_accessor :csv

  attr_accessor :output_encoding

  def convert_row(row)
    row.map { |value| value.to_s.encode(output_encoding, :undef => :replace) }
  end
end
