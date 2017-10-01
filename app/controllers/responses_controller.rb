class ResponsesController < ApplicationController
  # GET /responses
  def index
    @responses = Response.all.order(created_at: :asc)

    respond_to do |format|
      format.html {
        @average = Response.average(:answer).round(2)

        @style = if @average > 2
          'happy'
        elsif @average > 1
          'normal'
        else
          'sad'
        end
      }

      format.json {
        data = @responses.map do |response|
          {
            created_date: response.created_date,
            answer: response.answer
          }
        end
        render json: data
      }
    end
  end

  # GET /responses/new
  def new
    if Response.answer_on(Date.today).exists?
      render 'already_answer'
    else
      @question = Question.default_question
      @response = Response.new
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
