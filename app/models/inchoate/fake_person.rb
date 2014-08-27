module Inchoate
  class FakePerson < FakeModel
    def name
      [first_name, last_name].join(' ')
    end
  end
end