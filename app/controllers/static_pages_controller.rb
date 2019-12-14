class StaticPagesController < ApplicationController

  def home
    if params[:user].present?
      user_id = params[:user][:id]
      FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
      FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
      flickr = FlickRaw::Flickr.new
      @person = flickr.people.getInfo :user_id => user_id
      @photo_list = flickr.people.getPhotos :user_id => user_id
    end
  end

end
