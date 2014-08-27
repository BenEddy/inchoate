require 'fileutils'

module Inchoate
  class PagesController < ApplicationController

    def show
      Inchoate::Renderer.new(:context => self).render
    rescue ActionView::MissingTemplate
      render :missing_page
    end

    def create
      path      = params[:path][1..-1]
      path      = Rails.root.join("app", "views", path + ".html.erb")
      directory = FileUtils.mkdir_p(path.dirname)

      File.open(path, "w") do |file|
        file << "I'm a new file!"
      end

      redirect_to params[:path]
    end
  end
end