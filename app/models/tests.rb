class Tests < BaseModel
  attr_reader :id, :automate_or_die, :twenty_first_century_digital_boy, :questions_id, :subtotal


  def initialize(attributes={})
    set_attributes(attributes)
  end

  def set_attributes(attributes)
    @id = attributes['id'] if new_record?
    @automate_or_die = attributes['automate_or_die'].to_i
    @twenty_first_century_digital_boy = attributes['twenty_first_century_digital_boy'].to_i
    @questions_id = attributes['questions_id']
    @subtotal = attributes['subtotal']
  end
  def set_subtotal
    # @tests = Tests.find(params['id'])
    @subtotal = (@automate_or_die + @twenty_first_century_digital_boy)
  end

  def insert
    insert_query = <<-SQL
INSERT INTO tests (automate_or_die, twenty_first_century_digital_boy, questions_id, subtotal)
VALUES (?, ?, ?, ?)
    SQL
    connection.execute insert_query,
                       automate_or_die,
                       twenty_first_century_digital_boy,
                       questions_id,
                       subtotal
  end

  def update
    update_query = <<-SQL
UPDATE tests
SET automate_or_die = ?,
    twenty_first_century_digital_boy = ?,
    questions_id = ?,
    subtotal = ?
WHERE tests.id = ?
    SQL
    connection.execute update_query,
                       automate_or_die,
                       twenty_first_century_digital_boy,
                       questions_id,
                       subtotal
  end


  def find_lit(id)
    query_string = "SELECT * FROM tests WHERE tests.id = ? LIMIT 1"
    record_hash = connection.execute(query_string, id).first
    new(record_hash)
  end


  def self.connection
    db_connection = SQLite3::Database.new 'db/development.sqlite3'
    db_connection.results_as_hash = true
    db_connection
  end

  def new_record?
    id.nil?
  end

  def valid?
    automate_or_die.present? && twenty_first_century_digital_boy.present?
  end

  # def save
  #   if new_record?
  #     insert
  #   else
  #     update
  #   end
  # end

  def self.all
    tests_hashes = connection.execute("SELECT * FROM tests")
    tests_hashes.map do |tests_hash|
      Tests.new(tests_hash)
    end
  end




end
