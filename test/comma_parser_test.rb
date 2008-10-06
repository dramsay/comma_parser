require File.dirname(__FILE__) + '/test_helper'

class CommaParserTest < Test::Unit::TestCase
  def setup
    @country = Country.new
    @person = Person.new
  end
  
  def teardown
    Country.delete_all
    Person.delete_all
  end
  
  def test_commas_are_parsed_for_allow_commas
    @country.population = "1,000,000"
    @country.gross_domestic_product = "5,000,000"
    @country.save
    assert_equal 1000000, @country.population
    assert_equal 5000000, @country.gross_domestic_product
  end
  
  def test_numbers_are_still_saved_correctly
    @country.population = 1000000
    @country.gross_domestic_product = 5000000
    @country.save
    assert_equal 1000000, @country.population
    assert_equal 5000000, @country.gross_domestic_product
  end
  
  def test_commas_are_not_parsed_without_allow_commas
    @person.annual_income = "50,000"
    @person.save
    assert_equal 50, @person.annual_income
  end
end
