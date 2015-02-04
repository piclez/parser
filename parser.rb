class Parser

  def initialize
    @hash = {}
    begin
      @file = File.open('config', 'r')
    rescue => error_info
      return "\nConfig file: #{ error_info }"
    end
  end

  def parse
    File.open(@file) do |fp|
      fp.each do |line|
        next if line.chomp! =~ /^$|#/ # Ignore comments
        key, value = line.gsub(/\t/, '').chomp.split("=")
        @hash[key.to_sym] = parse_value value
      end
    end
    @hash
  end

  private
  def is_numeric? value
    Float(value) != nil rescue false
  end

  def is_integer? value
    Integer(value) != nil rescue false
  end

  def is_boolean? value
    /(true|yes|on|false|no|off)$/.match value
  end

  def to_boolean value
    return true if value == true || value =~ (/(true|yes|on)$/i)
    return false if value == false || value =~ (/(false|no|off)$/i)

    raise ArgumentError.new("Invalid value for Boolean: \"#{value}\"")
  end

  def to_number value
    is_integer?(value) ? Integer(value) : Float(value)
  end

  def parse_value value
    if is_numeric? value
      to_number(value)
    elsif is_boolean? value
      to_boolean(value)
    else
      value
    end
  end
end