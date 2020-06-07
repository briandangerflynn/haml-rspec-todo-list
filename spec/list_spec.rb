require 'spec_helper'
require 'rails_helper'
require 'byebug'

RSpec.describe List, type: :model do
  let(:list_one) { List.create(name: "Test List")}

  let(:todo_one) { 
    Todo.create(
      task: "test todo one", 
      completed: false, 
      list_id: list_one.id 
      )
    }

  let(:todo_two) { 
    Todo.create(
      task: "test todo two", 
      completed: false, 
      list_id: list_one.id 
      )
    }

  it 'has a name' do
    expect(list_one.name).to eql("Test List")
  end

  it 'can have many todos' do 
    expect(list_one.todos).to eq([todo_one, todo_two])
  end
end