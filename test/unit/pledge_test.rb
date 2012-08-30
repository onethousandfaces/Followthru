require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  def test_pledge_validator_works
  
    # Setup all the things
    u = User.new(:email => 'test@test.com', :name => 'dougdoug', 'password' => 'dougdoug')
    assert u.valid?, "Invalid user"
    u.save

    ud = Userdatum.new
    ud.user = u
    assert ud.valid?, "Invalid user data"
    ud.save

    p = Project.new
    p.name = "Project"
    p.desc = "About project"

    pt1 = PledgeType.new
    pt1.name = "Pledge type 1"
    pt1.desc = "About pledge"
    pt1.amount = 10.00
    assert pt1.valid?, "Invalid pledge type 1"

    pt2 = PledgeType.new
    pt2.name = "Pledge type 1"
    pt2.desc = "About pledge"
    pt2.amount = 20.00
    assert pt2.valid?, "Invalid pledge type 1"

    p.pledge_types.push pt1
    p.pledge_types.push pt2
    assert p.valid?, "Invalid project"
    p.save

    # Test 
    pl = Pledge.new
    pl.userdatum = ud
    pl.pledge_type = pt2
    pl.amount = 15.00
    assert !p.valid?, "Pledge valid when amount too low"

    pl.pledge_type = pt1
    assert p.valid?, "Pledge invalid when amount ok"
  end
end
