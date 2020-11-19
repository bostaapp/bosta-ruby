# frozen_string_literal: true

module Bosta
  # Represents the spec type that used by bosta apis
  class Specs < BostaObject
    attr_accessor :size, :items_count, :desc

    #=== Initialize Specs Object
    # * +size+ (optional) String
    # * +items_count+ (optional) String
    # * +desc+ (optional) String
    #
    def initialize(size = nil, items_count = nil, desc = nil)
      super()
      @size = size
      @items_count = items_count
      @description = desc
    end

    def format_obj #:nodoc: all
      obj = {}
      package_details = {}
      obj[:size] = @size unless @size.nil?
      package_details[:items_count] = @items_count unless @items_count.nil?
      package_details[:description] = @description unless @description.nil?

      obj[:package_details] = package_details unless package_details.empty?
      obj
    end
  end
end
