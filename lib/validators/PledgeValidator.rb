class PledgeValidator < ActiveModel::Validator
  def validate(record)
    types = record.pledgetypes.all
    total = 0
    types.each do |p|
      total += p.amount
    end
    if record.amount < total
      record.errors[:base] << "Amount is not sufficient for that pledge type"
    end 
  end
end
