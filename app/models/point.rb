class Point < BaseModel
  attr_reader :id, :user, :github_url, :point_total, :create_at, :errors

  def initialize(attributes={})
    set_attributes(attributes)
    @errors = {}
  end

  def valid?
    user.present? && github_url.present?
  end

  def set_attributes(attributes)
    @id = attributes['id'] if new_record?
    @user = attributes['user']
    @github_url = attributes['github_url']
    @point_total = attributes['point_total']
    @create_at ||= attributes['create_at']
  end

  def insert
    insert_query = <<-SQL
      INSERT INTO points (user, github_url, point_total, create_at)
      VALUES (?, ?, ?, ?)
    SQL
    connection.execute insert_query,
                       user,
                       github_url,
                       point_total,
                       Date.current.to_s
  end

  def update
    update_query = <<-SQL
UPDATE points
SET user = ?,
    github_url = ?,
    point_total = ?
WHERE points.id = ?
    SQL

    connection.execute update_query,
                       user,
                       github_url,
                       point_total,
                       id
  end

  # def delete
  #   connection.execute("DELETE FROM points WHERE points.id = ?", id)
  # end

  # def self.all
  #   point_hashes = connection.execute("SELECT * FROM points")
  #   point_hashes.map do |point_hash|
  #     Point.new(point_hash)
  #   end
  # end
  #
  # def self.find(id)
  #   point_hash = connection.execute("SELECT * FROM points WHERE points.id = ? LIMIT 1", id).first
  #   Point.new(point_hash)
  # end

  # def self.connection
  #   db_connection = SQLite3::Database.new 'db/development.sqlite3'
  #   db_connection.results_as_hash = true
  #   db_connection
  # end
  #
  # def connection
  #   self.class.connection
  # end
  #
  # def new_record?
  #   id.nil?
  # end
  #
  # def save
  #   return false unless valid?
  #   if new_record?
  #     insert
  #   else
  #     update
  #   end
  # end


end
