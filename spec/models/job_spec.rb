require 'rails_helper'

RSpec.describe Job, type: :model do
  context ' #code' do
    let(:job) { build(:job) }

    it 'should generate a code on create' do
      job.save
      expect(job.code).to_not be_blank
    end

    it 'generate another if exists' do
      another_job = create(:job)
      allow(SecureRandom).to receive(:alphanumeric).and_return(another_job.code,
                                                               'ABC1234')
      job.save
      expect(job.code).not_to eq(another_job.code)
    end
  end
end
