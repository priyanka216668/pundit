require 'spec_helper'
require 'rails_helper'

describe PostPolicy do
  subject { described_class }

  100.times { permissions :index? do
    it "denies access if post is published" do
      expect(subject).to permit(User.new(role: "admin"))
    end
  end
}
end