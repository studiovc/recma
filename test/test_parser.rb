require File.dirname(__FILE__) + "/helper"

class ParserTest < Test::Unit::TestCase
  def setup
    @parser = RKelly::Parser.new
  end

  def test_variable_statement
    assert_sexp(
      [:var, [[:var_decl, :foo, [:assign, [:lit, "10"]]]]],
      @parser.parse('var foo = 10;').to_sexp
    )
  end

  def test_variable_statement_no_semi
    assert_sexp(
      [:var, [[:var_decl, :foo, [:assign, [:lit, "10"]]]]],
      @parser.parse('var foo = 10').to_sexp
    )
  end

  def assert_sexp(expected, actual)
    assert_equal(expected, actual)
  end
end