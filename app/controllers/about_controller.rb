# frozen_string_literal: true

class AboutController < ApplicationController
  before_action :authenticate_user!
  def index; end
end
