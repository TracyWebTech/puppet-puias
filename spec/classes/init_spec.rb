require 'spec_helper'
describe 'puias' do

  context 'with defaults for all parameters' do
    it { should contain_class('puias') }
  end
end
