# frozen_string_literal: true

module Bosta
  # Set your pick in Time Slot '10:00 to 13:00'
  TIME_SLOT_10_TO_13 = '10:00 to 13:00'

  # Set your pick in Time Slot '13:00 to 16:00'
  TIME_SLOT_13_TO_16 = '13:00 to 16:00'

  #=== Four different types
  #
  # * SEND => 10
  # * CASH_COLLECTION => 15
  # * CRP => 25
  # * EXCHANGE => 30
  #

  DELIVERY_TYPES = {
    SEND: 10,
    CASH_COLLECTION: 15,
    CRP: 25,
    EXCHANGE: 30
  }.freeze

  #=== Three different sizes
  #
  # * SMALL
  # * MEDIUM
  # * LARGE
  #
  DELIVERY_SIZES = {
    SMALL: 'SMALL',
    MEDIUM: 'MEDIUM',
    LARGE: 'LARGE'
  }.freeze
end
