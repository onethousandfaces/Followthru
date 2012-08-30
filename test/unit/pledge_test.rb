require 'test_helper'

class PledgeTest < ActiveSupport::TestCase

  def insert_test_data(key)
    
    # Setup all the things
    u = User.new(:email => 'test@test.com', :name => key, 'password' => 'dougdoug')
    assert u.valid?, "Invalid user"
    u.save

    ud = Userdatum.new
    ud.user = u
    assert ud.valid?, "Invalid user data"
    ud.save

    p = Project.new
    p.userdatum = ud
    p.name = "Project"
    p.desc = "About project"
    assert p.valid?, "Invalid project: #{p.errors.messages}"
    p.save

    pt1 = PledgeType.new
    pt1.name = "Pledge type 1"
    pt1.desc = "About pledge"
    pt1.amount = 10.00
    pt1.userdatum = ud
    assert pt1.valid?, "Invalid pledge type 1: #{pt1.errors.messages}"
    pt1.save

    pt2 = PledgeType.new
    pt2.name = "Pledge type 2"
    pt2.desc = "About pledge"
    pt2.amount = 20.00
    pt2.userdatum = ud
    assert pt2.valid?, "Invalid pledge type 2"
    puts pt2.errors.messages
    pt2.save

    p.pledge_types.push pt1
    p.pledge_types.push pt2
    assert p.valid?, "Invalid project after adding pledge types"
    p.save

    g1 = Goal.new
    g1.project = p
    g1.total = 100.00
    g1.instances = 0
    g1.userdatum = ud
    assert g1.valid?, "Invalid goal 1"
    g1.save

    g2 = Goal.new
    g2.project = p
    g2.total = 100.00
    g2.instances = 0
    g2.userdatum = ud
    assert g2.valid?, "Invalid goal 2"
    g2.save

    p.goals.push g1
    p.goals.push g2
    assert p.valid?, "Invalid project after adding goals"
    p.save

    pl = Pledge.new
    pl.userdatum = ud
    pl.pledge_type = pt1
    pl.amount = 15.00
    pl.userdatum = ud
    assert pl.valid?, "Invalid pledge type"

    ud.pledges.push pl
    assert p.valid?, "Invalid project after adding pledge"
    ud.save

    u.save

    return u, ud, pt1, pt2
  end

  def test_pledge_validator_works
  
    # Magic user key
    key = rand(100000)
    u, ud, pt1, pt2 = self.insert_test_data key
    
    # Test 
    pl = Pledge.new
    pl.userdatum = ud
    pl.pledge_type = pt2
    pl.amount = 15.00
    assert !pl.valid?, "Pledge valid when amount too low"

    pl.pledge_type = pt1
    assert pl.valid?, "Pledge invalid when amount ok"
  end

  def test_can_save_and_restore
  
    # Magic user key
    key = rand(100000)
    self.insert_test_data key
    
    # Load all the stuff we just saved
    u = User.where("name = ?", [key]).first
    assert !u.nil?, "No matching user"

    ud = Userdatum.where("id = ?", [u.id]).first
    assert !ud.nil?, "Unable to load userdata"

    assert ud.pledges.count == 1, "Invalid pledge count"
    assert ud.projects.count == 1, "No project on load"
    p = ud.projects.first

    assert p.goals.count == 2, "Invalid goal count"
    assert p.pledge_types.count == 2, "Invalid pledge type count"
  end
end
