require 'spec_helper'

describe Parser do
  describe '#parse' do
    let(:output) do
      Parser.new.parse
    end

    let(:hash_config) do
      {
        host:               'test.com',
        server_id:          55331,
        server_load_alarm:  2.5,
        user:               'user',
        verbose:            true,
        test_mode:          true,
        debug_mode:         false,
        log_file_path:      '/tmp/logfile.log',
        send_notifications: true
      }
    end

    it 'should return a Hash object' do
      expect(output).to be_a_kind_of(Hash)
    end

    it 'should be able to parse the host' do
      expect(output[:host]).to eql hash_config[:host]
    end

    it 'should be able to parse the server_id as integer' do
      expect(output[:server_id]).to eql hash_config[:server_id]
    end

    it 'should be able to parse the server_load_alarm as float' do
      expect(output[:server_load_alarm]).to eql hash_config[:server_load_alarm]
    end

    it 'should be able to parse the user' do
      expect(output[:user]).to eql hash_config[:user]
    end

    it 'should be able to parse verbose as boolean' do
      expect(output[:verbose]).to eql hash_config[:verbose]
    end

    it 'should be able to parse test_mode = on as boolean' do
      expect(output[:test_mode]).to eql hash_config[:test_mode]
    end

    it 'should be able to parse debug_mode = off as boolean' do
      expect(output[:debug_mode]).to eql hash_config[:debug_mode]
    end

    it 'should be able to parse log_file_path' do
      expect(output[:log_file_path]).to eql hash_config[:log_file_path]
    end

    it 'should be able to parse send_notifications = true as boolean' do
      expect(output[:send_notifications]).to eql hash_config[:send_notifications]
    end
  end
end