class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        # DB[:conn].execute(sql, self.name, self.type)
        # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        name = pokemon[1]
        type = pokemon[2]

        new_pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
    end

end
