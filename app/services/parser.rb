require "csv"
module Parser
  class CSVParser
    class << self
      def parse file
        users = []
        CSV.foreach(file.path, headers: true) do |row|
          row_hash = row.to_hash
          first_name = row_hash["first_name"]
          last_name = row_hash["last_name"]
          next if first_name.blank?

          user = User.find_by first_name: first_name

          puts user
          if user.present?
            user.update count: user.count + 1
          else
            user = User.create first_name: first_name, last_name: last_name
          end
          users << user
        end
        users
      end
    end
  end
end
