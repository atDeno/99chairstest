require "spec_helper"
RSpec.describe 'Users', type: :request do
  before(:each) do
    User.destroy_all
  end

  it 'should return list of users which were added in list' do
    params = {
      users: {
        data: Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/file.csv", "text/csv" )
      }
    }

    create_users params
    res_json = JSON.parse response.body
    expect(response.status).to eq 200
    expect(res_json["users"].length).to eq 3
  end

  it 'should not return any result if file is empty' do
    params = {
      users: {
        data: Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/empty.csv", "text/csv" )
      }
    }
    create_users params
    res_json = JSON.parse response.body
    expect(response.status).to eq 200
    expect(res_json["users"].length).to eq 0
  end

  it 'should return error if params are invalide' do
    params = {
      users: {
        file: Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/file.csv", "text/csv" )
      }
    }
    create_users params
    res_json = JSON.parse response.body
    expect(response.status).to eq 400
  end
end
