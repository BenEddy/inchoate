module Inchoate
  class FakeModel < OpenStruct
    extend ActiveModel::Naming
    include ActiveModel::Conversion

    def persisted?
      persisted
    end
  end
end