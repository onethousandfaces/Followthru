class PledgeValidator < ActiveModel::Validator
  def validate(record)
    type = record.pledge_type
    if record.amount < type.amount 
      record.errors[:base] << "Pledge amount is not sufficient for that pledge type"
    elsif record.amount < 0
      record.errors[:base] << "Pledge amount must be at least zero"
    end 
  end
end
