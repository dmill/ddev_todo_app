require 'rails_helper'

describe User, type: :model do
  let(:user) { User.new(first_name: "Doug", last_name: "Mill",
                        email: "doug@destinationdev.com", user_type: 1,
                        dob: Date.new(1988, 4, 15), ice_cream: "cookies+cream",
                        password: "chipmunk", password_confirmation: "chipmunk") }

  describe "associations"

  describe "validations" do
    context "with all fields input and valid" do
      it { expect(user).to be_valid }
    end

    context "with a password and password confirmation mismatch" do
      before(:each) { user.password_confirmation = "squirrel" }

      it { expect(user).to_not be_valid }
    end

    context "without a password" do
      before(:each) { user.password = nil }

      it { expect(user).to_not be_valid }
    end

    context "without an email" do
      before(:each) { user.email = nil }

      it { expect(user).to_not be_valid }
    end

    context "with an invalid email" do
      before(:each) { user.email = "string" }

      it { expect(user).to_not be_valid }
    end

    context "testing before each" do
      before(:all) { 20.times { TodoList.create(title: "AHHHHHHHHHHH") } }

      it do
        list = TodoList.first
        list.title = "New Title"
        list.save

        p TodoList.first.title
      end
      it { p TodoList.first.title }
      it { p TodoList.first.title }
    end
  end

  describe "enums"

  describe "scopes"
  describe "callbacks"
  describe "#todo_list_count" do
    before(:each) do
      20.times { TodoList.create(title: "AHHHHHHHHHHH") }
      TodoList.limit(6).each { |list| user.todo_lists << list; user.save }
    end

    it { expect(user.todo_list_count).to eq(6) }
  end
end
