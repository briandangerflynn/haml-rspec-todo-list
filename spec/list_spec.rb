require 'spec_helper'
require 'rails_helper'
require 'byebug'

RSpec.describe List, type: :model do
  let(:list) { List.new(name: "Test List")}

  it 'has a name' do
    byebug
    expect(list.name).to eql("Test List")
  end
end