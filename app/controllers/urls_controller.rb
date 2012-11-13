class UrlsController < ApplicationController
  #before_filter :random_url, :only => [:create]
  def index
    @user = User.find(params[:user_id])
    @urls = @user.urls
    @url = Url.new
  end

  def create
    attributes = params[:url]
    attributes[:user_id] = params[:user_id]
    @url = Url.new(attributes)

    # Generate short url
    list = [('a'..'z'), ('A'..'Z'), (0..9)].map { |range| range.to_a }.flatten 

    if @url.short.empty?
      short = (0..5).map { list[Random.rand(list.length)] }.join
      @url.update_attributes(:short => "#{short}")
    end

    @url.save
    
    redirect_to user_urls_path
  end

  def show
    url = Url.find_by_short(request.path[1..-1])
    if url
      url.update_attributes(:view_count => url.view_count += 1)
      redirect_to url.original
    end
  end


end

