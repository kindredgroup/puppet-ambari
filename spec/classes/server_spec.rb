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
        if osfamily == 'RedHat'
          it { should contain_service('ambari-server').with_hasstatus(false) }
          it { should_not contain_service('ambari-server').with_pattern(nil) }
        end
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

      context 'with use_repo => false' do
        let(:params) do
          {
            :use_repo => false
          }
        end
        it { is_expected.to compile }
        it { should_not contain_class('ambari::repo') }
      end

      context 'with db_backend => mysql' do
        let(:params) do
          {
            :db_backend => 'mysql'
          }
        end
        it { is_expected.to compile }
        it { should contain_class('ambari::server::db::mysql') }
      end

      context 'with initial_install => true' do
        let(:params) do
          {
            :initial_install => true
          }
        end
        it { is_expected.to compile }
        it { should contain_class('ambari::server::setup') }
      end
    end

  end
end
