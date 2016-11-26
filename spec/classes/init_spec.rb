require 'spec_helper'

describe 'journald' do
  on_supported_os.each do |os, facts|
    context "with defaults on #{os}" do
      let(:facts) do
        facts.merge({:puppetmaster => 'localhost.localdomain'})
      end
      let(:params) { { :options => {} } }
      it { should compile.with_all_deps }
      it { should contain_class('journald') }
    end
  end
end
