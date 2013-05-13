# -*- coding: utf-8 -*-

require 'sqlite3'

class SqliteTest
	def initialize(fname = "test_sqlite.db")
		@fname = fname
	end

	def selectDB
		@db = SQLite3::Database.new(@fname)
	end

	def sqliteExecute(sql)
		# sqlに入っている複数の命令を実行する
		@db.execute_batch(sql)
	end

	def selectExecute(sql)
		@db.execute(sql) do |row|
			p row
		end
	end

	def insertExecute(table_name, array)
		sql = "insert into #{table_name} values ("
		first = true
		array.each do |str|
			if first
				sql += '"' + str + '"'
				# sql += str
			else
				sql += ', "' + str + '"'
				# sql += ", #{str}"
			end
			first = false
		end
		sql += ");"
		puts sql
		@db.execute(sql)

	end

	def closeDB
		@db.close
	end

end
