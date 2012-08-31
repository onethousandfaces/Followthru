class PledgeValidator < ActiveModel::Validator
  def validate(record)
    if record.nil?
      record.errors[:base] << "Pledge creation failed"
    else
      type = record.pledge_type
      if (record.amount == nil)
        record.errors[:base] << "Pledge amount must not be blank"
      elsif record.amount < type.amount 
        record.errors[:base] << "Pledge amount is not sufficient for that pledge type"
      elsif record.amount < 0
        record.errors[:base] << "Pledge amount must be at least zero"
      end 
    end
  end
end
