module Inchoate
  class PagesController < ApplicationController

    def show
      Inchoate::Renderer.new(:context => self).render
    end
  end
end