# frozen_string_literal: true

module Layout
  class ModalComponent < ViewComponent::Base
    renders_one :title

    def initialize(title:, id: nil)
      @id = id
      @title = title
      super
    end

    def id = @id ||= "modal-#{rand(36**6).to_s(36)}"
  end
end
