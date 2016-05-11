class StreamSubjectsController < ApplicationController
  before_action :set_stream, except: [:show, :edit, :update, :destroy]
  before_action :set_stream_subject, only: [:show, :edit, :update, :destroy]

  # GET streams/1/stream_subjects
  def index
    @stream_subjects = @stream.stream_subjects
  end

  # GET streams/1/stream_subjects/1
  def show
  end

  # GET streams/1/stream_subjects/new
  def new
    @stream_subject = @stream.stream_subjects.build
  end

  # GET streams/1/stream_subjects/1/edit
  def edit
  end

  # POST streams/1/stream_subjects
  def create
    @stream_subject = @stream.stream_subjects.build(stream_subject_params)

    if @stream_subject.save
      redirect_to(@stream_subject.stream, notice: 'Stream subject was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT streams/1/stream_subjects/1
  def update
    if @stream_subject.update_attributes(stream_subject_params)
      redirect_to(@stream_subject, notice: 'Stream subject was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE streams/1/stream_subjects/1
  def destroy
    @stream_subject.destroy

    redirect_to stream_stream_subjects_url(@stream_subject.stream)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = Stream.find(params[:stream_id])
    end

    def set_stream_subject
      @stream_subject = StreamSubject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stream_subject_params
      params.require(:stream_subject).permit(:name, :part, :max_marks)
    end
end
