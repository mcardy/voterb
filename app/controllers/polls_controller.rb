class PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def show
    @poll = Poll.find(params[:id])
    @total = 0
    @poll.poll.each do |key, poll|
      @total += poll[1]
    end
    if @total == 0
      @total = 1
    end
  end

  def vote
    @poll = Poll.find(params[:id])
  end

  def submit
    @poll = Poll.find(params[:id])
    @poll.poll[params["option"].to_i][1] = @poll.poll[params["option"].to_i][1] + 1
    @poll.save
    redirect_to @poll
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to @poll
    else
      render 'new'
    end
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    redirect_to polls_path
  end

  def update
    @poll = Poll.find(params[:id])
    update_params = poll_params
    if (@poll.update(update_params))
      redirect_to @poll
    else
      render 'edit'
    end
  end

  private
    def poll_params
      poll = Hash.new
      i = 0
      params["options"].each do |key, item|
        votes = 0
        if @poll
          @poll.poll.each do |key, val|
            if item == val[0]
              votes = val[1]
            end
          end
        end
        poll[i] = [item, votes]
        i+=1
      end

      params.require(:poll).permit(:title).merge(poll: poll)
    end

end
