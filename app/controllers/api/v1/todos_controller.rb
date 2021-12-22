class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, raise: false

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
    limit = params[:_limit]
    if limit.present?
      @todos = @todos.last(limit.to_i)
    end
    render json: @todos.reverse
  end

  # GET /todos/1 or /todos/1.json
  def show
    render json: @todo
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity, location: @todo
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:id, :title, :completed, :_limit)
    end
end
