class Record
  attr_reader :id

  def initialize(attributes)
    @id = attributes[:id]
    columns_except_id.each do |column|
      instance_variable_set(:"@#{column}", attributes[:"#{column}"])
      self.class.send(:attr_accessor, column)
    end
  end

  def save
    @id ? update : insert
  end

  def destroy
    DB.execute("DELETE FROM #{self.class.table_name} WHERE id = ?", @id)
  end

  def self.find(id)
    DB.results_as_hash = true
    first_row = DB.execute("SELECT * FROM #{table_name} WHERE id = ?", id).first
    build_record(first_row) if first_row
  end

  def self.all
    DB.results_as_hash = true
    DB.execute("SELECT * FROM #{table_name}").map { |row| build_record(row) }
  end

  def self.build_record(row)
    # row is a hash, keep only string keys (column names), and symbolize them.
    attributes = Hash[row.select { |k, _| k.is_a? String }.map { |k, v| [k.to_sym, v] }]
    new(attributes)
  end

  def self.table_name
    "#{to_s.downcase}s"
  end

  private

  def update
    set_sub_query = columns_except_id.map { |column| "#{column} = ?" }.join(", ")
    bind_params = columns_except_id.map { |column| instance_variable_get(:"@#{column}") }
    bind_params << @id
    DB.execute("UPDATE #{self.class.table_name} SET #{set_sub_query} WHERE id = ?", *bind_params)
  end

  def insert
    bind_params = columns_except_id.map { |column| instance_variable_get(:"@#{column}") }
    columns = "(#{columns_except_id.join(', ')})"
    values = "(#{(['?'] * columns_except_id.size).join(', ')})"
    DB.execute("INSERT INTO #{self.class.table_name} #{columns} VALUES #{values}", *bind_params)
    @id = DB.last_insert_row_id
  end

  def columns_except_id
    statement = DB.prepare("SELECT * FROM #{self.class.table_name}")
    statement.columns - ["id"]
  end
end