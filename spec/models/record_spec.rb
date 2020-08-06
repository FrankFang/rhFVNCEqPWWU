require 'rails_helper'

RSpec.describe Record, type: :model do
  it 'amount is required' do
    record = build :record, amount: nil
    record.validate
    expect(record.errors.details[:amount][0][:error]).to eq(:blank)
  end
  it 'category is required' do
    record = build :record, category: nil
    record.validate
    expect(record.errors.details[:category][0][:error]).to eq(:blank)
  end
  it 'category 只能是 outgoings 或者 income' do
    expect {
      create :record, category: 'outgoing'
    }.to raise_error(ArgumentError)
  end
end
