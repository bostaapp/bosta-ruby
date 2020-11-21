# frozen_string_literal: true

#:nodoc: all
class Hash
  def compact
    delete_if { |_k, v| v.nil? }
  end
end
