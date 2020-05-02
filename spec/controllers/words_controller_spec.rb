require 'rails_helper'

RSpec.describe WordsController, type: :controller do 
  # index method specs
  describe "GET index" do
    before { get :index }

    context 'when words exist' do
      let!(:word) { create(:word) }

      it "assigns @words" do
        expect(assigns(:words)).to eq([word])
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
    end

    context 'when no words exist' do
      it "assigns @words" do
        expect(assigns(:words)).to eq([])
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
    end
  end

  # new method specs
  describe "GET new" do
    before { get :new }

      let!(:word) { create(:word) }

      it "assigns @word" do
        expect(assigns(:word)).to be_a_new(Word)
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end
  end

  describe "POST create" do
    subject { post :create, params: params }

    context 'when valid params' do
      let(:params) do 
        { word: { value: 'dog', language: 'english' } }
      end
      it 'creates a new word' do  
        expect { subject }.to change(Word, :count).from(0).to(1)
      end
    end

    context 'when invalid params' do
      let(:params) do 
        { word: { value: 'dog' } }
      end
      it 'does not creates a new word' do  
        expect { subject }.not_to change(Word, :count)
      end
    end
  end

end