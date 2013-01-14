require 'test_helper'

class GiftReceiverTest < ActiveSupport::TestCase
  fixtures :gift_receivers
  u=GiftReceiver.new
  test "empty_name" do
   
    u.name=""
    u.occassion="Marriage"
    u.email="john@klairvoyant.com"
    u.coast=300
    assert !u.save
    assert u.errors['name'].any?
    
  end
  test "correct_name" do
    u.name="john"
    u.occassion="Marriage"
    u.email="jo@hotmail.com"
    u.coast=300
    assert u.save
    assert u.errors['name'].empty?
    
  end 
  test "empty_coast" do
   
    u.name="john"
    u.occassion="Marriage"
    u.email="john@klairvoyant.com"
    u.coast=""
    assert !u.save
    assert u.errors['coast'].any?
    
  end
  test "text_coast" do
   
    u.name="john"
    u.occassion="Marriage"
    u.email="john@klairvoyant.com"
    u.coast="t67"
    assert !u.save
    assert u.errors['coast'].any?
    
  end
  test "correct_coast" do
    u.name="john"
    u.occassion="Marriage"
    u.email="jo@hotmail.com"
    u.coast=300
    assert u.save
    assert u.errors['coast'].empty?
    
  end 
  
  test "empty_email" do
    u.name="john"
    u.occassion="Marriage"
    u.email=""
    u.coast=300
    assert !u.save
    assert u.errors['email'].any?
    
  end 
  test "short_email" do
    u.name="john"
    u.occassion="Marriage"
    u.email="jo"
    u.coast=300
    assert !u.save
    assert u.errors['email'].any?
    
  end 
  test "invalied_email" do
    u.name="john"
    u.occassion="Marriage"
    u.email="jo.hotmail.com"
    u.coast=300
    assert !u.save
    assert u.errors['email'].any?
    
  end 
  test "correct_email" do
    u.name="john"
    u.occassion="Marriage"
    u.email="jo@hotmail.com"
    u.coast=300
    assert u.save
    assert u.errors['email'].empty?
    
  end 
  test "empty_ocassion" do
    u.name="john"
    u.email="jo@hotmail.com"
    u.occassion=""
    u.coast=300
    assert !u.save
    assert u.errors['occassion'].any?
    
  end 
  test "correct_ocassion" do
    u.name="john"
    u.email="jo@hotmail.com"
    u.occassion="Marriage"
    u.coast=300
    assert u.save
    assert u.errors['occassion'].empty?
    
  end 
end
