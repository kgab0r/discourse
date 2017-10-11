require 'rails_helper'

RSpec.describe "Running Sidekiq Jobs in Multisite" do
  it 'should revert back to the default connection' do
    expect(RailsMultisite::ConnectionManagement.current_db)
      .to eq('default')

    Jobs::DestroyOldDeletionStubs.new.perform({})

    expect(RailsMultisite::ConnectionManagement.current_db)
      .to eq('default')
  end
end