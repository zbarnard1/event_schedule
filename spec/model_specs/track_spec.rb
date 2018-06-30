require 'rails_helper'

RSpec.describe Track do
  
  let(:valid_params) {{
    name: 'Track 1 - Pattern Recognition',
    display_order: 1
  }}

  context 'it validates its parameters' do
    it 'can create a valid Track record' do
      expect(Track.new(valid_params).valid?).to eq true
    end

    it 'must have a name' do
      expect(Track.new(valid_params.merge({name: nil})).valid?).to eq false
    end

    it 'must have a display order' do
      expect(Track.new(valid_params.merge({ display_order: nil })).valid?).to eq false
    end
  end
end