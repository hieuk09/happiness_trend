require 'rails_helper'

describe ResponsesController do
  describe 'GET index' do
    let!(:response) { create(:response) }

    it 'returns all responses' do
      get :index
      expect(assigns[:responses]).to eq [response]
    end
  end

  describe 'GET new' do
    context 'when there is no response today' do
      let(:question) { double('Question') }

      before do
        expect(Question).to receive(:default_question)
          .and_return(question)
      end

      it 'returns default question and a new response' do
        get :new
        expect(assigns[:question]).to eq question
        expect(assigns[:response]).to be_new_record
        expect(response).to render_template('new')
      end
    end

    context 'when there is one response today' do
      let!(:existed_response) { create(:response, created_at: Date.today) }

      it 'renders already rated page' do
        get :new
        expect(assigns[:question]).to be_nil
        expect(assigns[:response]).to be_nil
        expect(response).to render_template('already_answer')
      end
    end
  end

  describe 'POST create' do
    let(:detail) { 'detail' }

    context 'when response can be created' do
      it 'returns success' do
        post :create, params: { answer: 1, detail: detail }
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect(json['status']).to eq 'success'
      end
    end

    context 'when response cannot be created' do
      it 'returns error' do
        post :create, params: { answer: '', detail: detail }
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['error']).to eq "Answer can't be blank"
      end
    end
  end
end
