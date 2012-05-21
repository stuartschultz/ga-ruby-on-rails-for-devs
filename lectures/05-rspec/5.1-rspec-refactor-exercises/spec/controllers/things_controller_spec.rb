require 'spec_helper'

describe ThingsController do

  context "with mocks" do
    describe "GET index" do #index
      let(:mock_thing) { mock_model(Thing).as_null_object }
      it "returns things" do
        Thing.stub!(:all).and_return [ mock_thing ]
        get :index
        assigns(:things).should eq [ mock_thing ]
      end
      it "returns things" do
        Thing.should_receive(:all)
        get :index
      end
    end # index
    describe "GET thing" do #show
      it "fetches thing from the database" do
        Thing.should_receive(:find).with("42").once
        get :show, id: 42
      end
    end # describe show
  end # context with mocks
  
  context "with fabricator" do

    describe '#new' do #new
      it "should display the new page" do
        get :new
        response.should be_success
        assigns(:thing).should_not be_nil
      end    
    end # new

    describe '#create' do #create
      let(:fake_thing) {Fabricate.build(:thing)}
      it "should create a thing" do
        params = {thing: {name: fake_thing.name}}
        expect {
          post :create, params
          response.should be_redirect
        }.to change {Thing.count}.by(1)      
      end
    end # create

    describe '#destroy' do #destroy
      let(:fake_thing) {Fabricate(:thing)}
      it "should destory a thing" do
        f = fake_thing
        expect {
          delete :destroy, {:id => f.id}
          response.should be_redirect
        }.to change {Thing.count}.by(-1)
      end
    end # destroy

  end # context with fabricator
  
end
