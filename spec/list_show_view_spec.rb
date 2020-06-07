require 'capybara/rspec'
require 'spec_helper'
require 'rails_helper'
require 'byebug'

RSpec.describe "lists/show.html.haml", type: :view do

  before :each do
    @list = List.create(name: "Groceries")
    @todos = Todo.create([
      {
        task: "todo test one",
        completed: false,
        list_id: @list.id
      },
      {
        task: "todo test two",
        completed: false,
        list_id: @list.id
      }
    ])
  end

  it "displays the list title" do
    render
    expect(rendered).to have_css("h2", text: "Groceries")
  end

  it "renders a message if there are no todos" do
    @todos = []
    render
    expect(rendered).to have_css("i", text: "no tasks. please add a task below")
  end

  it "does not render a message if there are todos" do
    render
    expect(rendered).to_not have_css("i", text: "no tasks. please add a task below")
  end

  it "conditionally renders tasks style based on completion" do
    @todos.first.completed = true
    render
    expect(rendered).to have_css(".todo", class: "done")
  end
end