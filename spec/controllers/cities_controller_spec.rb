require "spec_helper"

describe CitiesController do

  describe 'given a state' do    
    before :each do
      @california = State.new()
      @california.name = 'California'
      @california.save
    end

    describe 'given a city' do    
      before :each do       
        @sacramento = City.new(:state => @california)
        @sacramento.name = 'Sacramento'
        @sacramento.save
      end

      # --- NEW ---
      describe 'GET new' do
        before :each do 
          get :new, :state_id => @california.id
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
          post :create, {:state_id => @california.id, :city => {name: 'Sacramento', population: '475,516', state_id: @california.id}}
        end

        it "responds with a redirect" do
          actual = response.code
          expected = "302"
          expect(actual).to eq (expected)
        end

        it "inserts a city record" do
          actual = City.last.name
          expected = 'Sacramento'
          expect(actual).to eq(expected)
        end

        it "redirects to show state" do
          response.should redirect_to state_path(@california.id)
        end
        
      end

      # --- EDIT ---
      describe 'GET edit' do
        before :each do
          get :edit, {:state_id => @california.id, :id => @sacramento.id}
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
          post :update, {:state_id => @california.id, :id => @sacramento.id, :city => {name: 'Macramento'}}         
        end

        it "responds with a redirect" do
          actual = response.code
          expected = "302"
          expect(actual).to eq (expected)
        end

        it 'updates city record' do
          @sacramento.reload
          actual = @sacramento.name
          expected = 'Macramento'
          expect(actual).to eq (expected)       
        end

        it "redirects to show" do
          response.should redirect_to state_path(@california)
        end

      end

      # --- DELETE ---
      describe 'DELETE destroy' do
        it 'destroys city record' do
          expect { delete :destroy, {:state_id => @california.id, :id => @sacramento.id} }
          .to change(City, :count).by(-1)     
        end

      end

    end 

  end
  
end
