require 'spec_helper'
require 'rails_helper'
require 'byebug'

RSpec.describe Todo, type: :model do
  let(:list_one) { List.create(name: "Test List")}
  let(:todo) { 
    Todo.create(
      task: "test todo", 
      completed: false, 
      list_id: list_one.id 
      )
    }

  it 'has a task' do
    expect(todo.task).to eql("test todo")
  end

  it 'has a completed boolean' do
    expect(todo.completed).to eql(false)
  end

  it 'belongs to a list' do
    expect(list_one.todos).to eq([todo])
  end
end