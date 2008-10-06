class Country < ActiveRecord::Base
  allow_commas :population, :gross_domestic_product
end