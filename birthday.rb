require 'sinatra'

module Content
  VIDEOS = [
    "//www.youtube.com/embed/DbGPFsBPtgo"
  ]

  IMAGES = [
    "happy.jpg"
  ]
end

class Birthday < Sinatra::Base
  get'/' do
    erb :index, :locals => {
      :birthday => birthday?(Date.today),
      :fun => choose_fun
    }
  end

  private

  def birthday?(date)
    #date.month == 8 && date.day == 27
    true
  end

  def choose_fun
    if Random.rand > 0.5
      image(Content::IMAGES.sample)
    else
      video(Content::VIDEOS.sample)
    end
  end

  def image(path)
    "<img src=\"#{path}\">"
  end

  def video(path)
    "<iframe width=\"420\" height=\"315\" src=\"#{path}?autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>"
  end
end
