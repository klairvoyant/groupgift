require 'test_helper'

class GiftGroupTest < ActiveSupport::TestCase
   fixtures :gift_groups
    u=GiftGroup.new
   test "empty_name" do
   
    u.name=""
    u.email="john@klairvoyant.com"
    assert !u.save
    assert u.errors['name'].any?
    
  end
  
  test "correct_name" do
    u.name="john"
    u.email="jo@hotmail.com"
    assert u.save
    assert u.errors['name'].empty?
    
  end 
  
  test "empty_email" do
    u.name="john"
    u.email=""
    assert !u.save
    assert u.errors['email'].any?
    
  end 
  test "minimum_email" do
    u.name="john"
    u.email="jo"
    assert !u.save
    assert u.errors['email'].any?
    
  end 
  test "invalied_email" do
    u.name="john"
    u.email="jo.hotmail.com"
    assert !u.save
    assert u.errors['email'].any?
    
  end 
  test "correct_email" do
    u.name="john"
    u.email="jo@hotmail.com"
    assert u.save
    assert u.errors['email'].empty?
    
  end 
end
