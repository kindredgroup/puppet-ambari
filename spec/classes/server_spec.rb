require 'spec_helper'


describe "ambari::server" do
  ['RedHat'].each do |osfamily|

    context "on #{osfamily}" do
      let(:facts) do
        {
          :osfamily     => osfamily,
          :architecture => 'x86_64'
        }
      end

      context 'with defaults for all parameters' do
        it { is_expected.to compile }
        it { should_not contain_class('amabari::repo') }
      end

      context 'with use_repo => true' do
        let(:params) do
          {
            :use_repo => true
          }
        end
        it { is_expected.to compile }
        it { should contain_class('ambari::repo') }
      end
    end

  end
end
