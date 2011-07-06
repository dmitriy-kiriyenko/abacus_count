class User < ActiveRecord::Base
  has_many :transactions
end

class Transaction < ActiveRecord::Base
  belongs_to :user
end

ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :name
    t.string :email
  end

  create_table :transactions do |t|
    t.integer :amount
    t.integer :user_id
  end
end
