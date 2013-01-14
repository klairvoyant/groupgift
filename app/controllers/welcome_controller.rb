class WelcomeController < ApplicationController
  layout 'application', :except => :index
#  before_filter   :authenticate, :except => [:index]
  def index
    session[:receivername]="";
    session[:receiverid]="";
  end

end
