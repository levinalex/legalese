require 'helper'

class TestLegalese < Test::Unit::TestCase

  should "have a parse method" do
    assert_nothing_raised do
      Legalese.parse("hello world")
    end
  end

  [
    ["empty text", "", []]
  ].each do |note, input, expected|
    should "parse #{note} correctly" do
      assert_equal expected, Legalese.parse(input)
    end
  end

  Dir[File.join(File.dirname(__FILE__), "examples/**/*.rb")].each do |fname|
    should "parse #{fname} correctly" do
      expected, input = File.read(fname).split("__END__")
      expected = eval(expected)

      actual = Legalese.parse(input)

      assert_equal actual, expected
    end
  end
end