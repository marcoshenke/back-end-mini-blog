require 'rails_helper'

RSpec.describe Posts::Create do
  let(:valid_params) do
    {
      title: Faker::Quote.yoda,
      description: Faker::Lorem.characters(number: 15)
    }
  end
  let(:invalid_params) do
    {
      title: Faker::Quote.yoda
    }
  end

  describe '#initialize' do
    before do
      @instance = described_class.new(valid_params)
    end

    it 'returns instancied variables' do
      expect(@instance.params).to eq(valid_params)
    end
  end

  describe '#execute' do
    context 'when no errors happens' do
      before do
        @instance = described_class.new(valid_params)

        allow(@instance).to receive(:mount_params).and_return(valid_params)
      end

      after do
        @instance.execute
      end

      it 'call executions methods' do
        expect(@instance).to receive(:mount_params).once
      end

      it 'call create method from Post' do
        expect(Post).to receive(:create!).with(valid_params).once
      end
    end

    context 'when at least one param is invalid' do
      before do
        @instance = described_class.new(invalid_params)
      end

      it 'raises ActiveRecord::RecordInvalid' do
        expect { @instance.execute }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  context '#mount_params' do
    before do
      instance = described_class.new(valid_params)
      @response = instance.send(:mount_params)
    end

    it 'return a mounted_params' do
      expect(@response).to eq(valid_params)
    end
  end
end
