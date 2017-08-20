class ResponsesController < ApplicationController
  # GET /responses
  def index
    @responses = Response.all
  end

  # GET /responses/new
  def new
    if Response.answer_on(Date.today).exists?
      @question = Question.default_question
      @response = Response.new
    else
      render 'already_answer'
    end
  end

  # POST /responses
  def create
    response_params = params.permit(:answer, :detail)
    question = Question.default_question
    response = Response.new(response_params.merge(question_id: question.id))

    if response.save
      render json: { status: 'success' }, status: 200
    else
      render json: { error: response.errors.full_messages.join(', ') }, status: 422
    end
  end
end
