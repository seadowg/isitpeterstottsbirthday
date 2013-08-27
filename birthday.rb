require 'sinatra'

module Content
  VIDEOS = [
    "//www.youtube.com/embed/DbGPFsBPtgo",
    "//www.youtube.com/embed/OHC_ytdgfXY",
    "//www.youtube.com/embed/J78Rg7VnRiA",
    "//www.youtube.com/embed/8i-uR7p2XII",
    "//www.youtube.com/embed/pSkObM50LBA",
    "//www.youtube.com/embed/ZDoi_kg5qHg"
  ]

  IMAGES = [
    "happy.jpg",
    "hef.jpg",
    "middle.jpg",
    "crazy.jpg",
    "sad_cake.jpg"
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
    date.month == 8 && date.day == 27
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
