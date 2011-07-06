require 'spec_helper'

describe "calculations" do
  before(:all) do
    User.create(:name => "John", :email => "john@example.com").tap do |u|
      u.transactions.create :amount => 10
      u.transactions.create :amount => 15
      u.transactions.create :amount => 20
    end

    User.create(:name => "Mike").tap do |u|
      u.transactions.create :amount => 5
      u.transactions.create :amount => 10
      u.transactions.create :amount => 15
    end

    User.create(:name => "Jane").tap do |u|
      u.transactions.create :amount => 10
      u.transactions.create :amount => 20
      u.transactions.create :amount => 30
    end
  end

  let(:grouped_scope) do
    User.select("users.id, avg(transactions.amount) as avg_amount").joins(:transactions).group("user_id").having("avg_amount >= 15")
  end

  let(:simple_scope) do
    User.select("users.id, email AS my_email_alias").where("my_email_alias IS NOT NULL")
  end

  it "should return users' count with having condition" do
    grouped_scope.abacus.count.should == 2
  end

  it "should return users' count with having condition counted by column" do
    grouped_scope.abacus.count(:email).should == 1
  end

  it "should return sum of all user's amount with having condition" do
    grouped_scope.abacus.sum(:amount) == 105
  end

  it "should return users' count with where condition" do
    simple_scope.abacus.count.should == 1
  end
end