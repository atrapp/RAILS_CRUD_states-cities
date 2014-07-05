require "spec_helper"

describe StatesController do

  describe 'given a state' do    
    before :each do
      @california = State.new()
      @california.name = 'California'
      @california.save
    end

    # --- INDEX ---
    describe 'GET index' do     
      before :each do
       get :index
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @states' do 
        actual = assigns(:states)
        expected = [@california]
        expect(actual).to eq(expected)
      end

    end 

    # --- NEW ---
    describe 'GET new' do
      before :each do
        get :new
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end

    end

    # --- CREATE ---
    describe "POST create" do
      before :each do
        post :create, {:state => {name: 'Nevada', abbreviation: 'NV'}}
      end

      it "responds with a redirect" do
        actual = response.code
        expected = "302"
        expect(actual).to eq (expected)
      end

      it "inserts a state record" do
        actual = State.last.name
        expected = 'Nevada'
        expect(actual).to eq(expected)
      end

      it "redirects to show" do
        response.should redirect_to state_path(State.last)
      end

    end

    # --- EDIT ---
    describe 'GET edit' do
      before :each do
        get :edit, :id => @california.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq (expected)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

    end

    # --- UPDATE ---
    describe 'POST update' do
      before :each do
        post :update, {:id => @california.id, :state => {name: 'galifornia'}}
      end

      it "responds with a redirect" do
        actual = response.code
        expected = "302"
        expect(actual).to eq (expected)
      end

      it 'updates state record' do
        @california.reload
        actual = @california.name
        expected = 'galifornia'
        expect(actual).to eq (expected)       
      end

      it "redirects to show" do
        response.should redirect_to state_path(@california)
      end

    end

    # --- SHOW ---
    describe 'GET show' do
      before :each do
        get :show, :id => @california.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @state' do
        actual = assigns(:state)
        expected = @california
        expect(actual).to eq(expected)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

    end

    # --- DELETE ---
    describe 'DELETE destroy' do
      it 'destroys state record' do
        expect { delete :destroy, {:id => @california.id} }
        .to change(State, :count).by(-1)     
      end
    end

  end 
  
end