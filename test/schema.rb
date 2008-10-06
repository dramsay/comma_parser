ActiveRecord::Schema.define :version => 0 do
  
  create_table :countries, :force => true do |t|
    t.column :name, :string, :limit => 50
    t.column :population, :integer
    t.column :gross_domestic_product, :integer
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
  
  create_table :people, :force => true do |t|
    t.column :first_name, :string, :limit => 25
    t.column :last_name, :string, :limit => 25
    t.column :annual_income, :integer
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
  
end