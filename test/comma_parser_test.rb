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
    @country.reload
    assert_equal 1_000_000, @country.population
    assert_equal 5_000_000, @country.gross_domestic_product
  end
  
  def test_numbers_are_still_saved_correctly
    @country.population = 2_000_000
    @country.gross_domestic_product = 10_000_000
    @country.save
    @country.reload
    assert_equal 2_000_000, @country.population
    assert_equal 10_000_000, @country.gross_domestic_product
    @person.year_end_bonus = "500"
    @person.save
    @person.reload
    assert_equal 500, @person.year_end_bonus
  end
  
  def test_commas_are_not_parsed_without_allow_commas
    @person.annual_income = "50,000"
    @person.year_end_bonus = "1,000"
    @person.save
    @person.reload
    assert_equal 50, @person.annual_income
    assert_equal 1, @person.year_end_bonus
  end
end
