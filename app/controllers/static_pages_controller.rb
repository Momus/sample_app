class StaticPagesController < ApplicationController

  attr_accessor :secret_word
  
  def home
    @secret_word = "FOO!"
  end

  def help
  end
end
