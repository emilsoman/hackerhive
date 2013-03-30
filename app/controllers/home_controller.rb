class HomeController < ApplicationController
  caches_page :facebook_js_sdk

  def index
    puts request.host_with_port
  end

end
