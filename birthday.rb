require 'sinatra'

class Birthday < Sinatra::Base
  def birthday?(date)
    date.month == 8 && date.day == 27
  end

  get'/' do
    erb :index, :locals => {
      :birthday => birthday?(Date.today)
    }
  end
end
