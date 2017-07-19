require 'rails_helper'

describe TodoItemsController, type: :controller do
  render_views

  describe "GET #show" do
    let(:doug) {  User.create(first_name: "Doug", last_name: "Mill",
                              email: "doug@destinationdev.com", user_type: 1,
                              dob: Date.new(1988, 4, 15), ice_cream: "cookies+cream",
                              password: "chipmunk", password_confirmation: "chipmunk") }

    let(:list) { TodoList.create(title: "AHHHHHHHHHHHH") }
    let(:item) { TodoItem.create(todo_list: list, user: doug,
                                 asignee: doug, summary: "hi", description: "bye") }

    before(:each) { get :show, params: params  }

    context "todo item with id exists" do
      let(:params) { {todo_list_id: list.id, id: item.id} }

      it { expect(response.status).to eq(200) }
      it { expect(response.body).to include("hi") }
    end

    context "todo item with id does not exist" do
      let(:params) { { todo_list_id: list.id, id: item.id + 17 } }

      it { expect(response.status).to eq(404) }
    end
  end

  describe "GET #index"
end
