require 'test_helper'

class GiftSelectedTest < ActiveSupport::TestCase
 fixtures :gift_selecteds
  u=GiftSelected.new
  test "title_empty" do
   
    u.title=""
    u.amount=300
    assert !u.save
    assert u.errors['title'].any?
    
  end
  test "title_correct" do
   
    u.title="watch"
    u.amount=300
    assert u.save
    assert u.errors['title'].empty?
    
  end
  test "amount_empty" do
   
    u.title="watch"
    u.amount=""
    assert !u.save
    assert u.errors['amount'].any?
    
  end
  test "amount_numerical" do
   
    u.title="watch"
    u.amount="5t"
    assert !u.save
    assert u.errors['amount'].any?
    
  end
  test "amount_correct" do
   
    u.title="watch"
    u.amount=300
    assert u.save
    assert u.errors['amount'].empty?
    
  end
  
end
