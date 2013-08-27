require 'sinatra'

class Birthday < Sinatra::Base
  get'/' do
    erb :index, :locals => {
      :birthday => birthday?(Date.today)
    }
  end

  private

  def birthday?(date)
    date.month == 8 && date.day == 27
  end
end
