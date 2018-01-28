class HomeController < ApplicationController
  include ProjectsHelper

  def index
    ps = Project.visible.select{ |project| project.identifier != 'inbound' }
    target = ps.first
    if target.nil?
       redirect_to '/welcome'
    else
       redirect_to :controller => 'projects', :action => 'show', :id => ps.first.identifier
    end
  end
end
