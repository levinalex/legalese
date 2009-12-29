$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "legalese")

require "treetop"
require "polyglot"
require "legalese_parser"


class Legalese
  def self.parse(text)
    match = LegaleseGrammarParser.new.parse(text.strip)
    match.content if match
  end
end
