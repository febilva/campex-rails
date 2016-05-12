class StreamsController < ApplicationController
  before_action :set_board, except: [:show, :edit, :update, :destroy]
  before_action :set_stream, only: [:show, :edit, :update, :destroy]

  # GET boards/1/streams
  def index
    @streams = @board.streams
    respond_to do |format|
      format.html
      format.json { render json: @streams }
    end
  end

  # GET boards/1/streams/1
  def show
  end

  # GET boards/1/streams/new
  def new
    @stream = @board.streams.build
  end

  # GET boards/1/streams/1/edit
  def edit
  end

  # POST boards/1/streams
  def create
    @stream = @board.streams.build(stream_params)

    if @stream.save
      redirect_to(@stream, notice: 'Stream was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT boards/1/streams/1
  def update
    if @stream.update_attributes(stream_params)
      redirect_to(@stream, notice: 'Stream was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE boards/1/streams/1
  def destroy
    @stream.destroy

    redirect_to board_streams_url(@stream.board)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_stream
      @stream = Stream.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stream_params
      params.require(:stream).permit(:name)
    end
end
