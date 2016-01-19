class StaticPagesController < ApplicationController
  def company
    @current_nav = :company
  end

  def projects
    @current_nav = :projects
  end

  def media
    @current_nav = :media
  end

  def contact
    @current_nav = :contact
  end
end
