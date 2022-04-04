class SharedController < ApplicationController

  def index
  end

  def toggle_enable_status
    @shared.toggle!(:enabled)
  end
  
end
