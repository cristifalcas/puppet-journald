require 'spec_helper'
describe 'zram' do

  context 'with defaults for all parameters' do
    it { should contain_class('zram') }
  end
end
