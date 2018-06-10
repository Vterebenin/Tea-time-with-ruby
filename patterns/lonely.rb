=begin 
Описание:
Данный паттерн гарантирует что у класса будет только один экземпляр. 
Чаще всего это полезно для доступа к какому-то общему ресурсу, например, 
базе данных.
=end 

class Database
  @@instance = Database.new

  def self.instance
    return @@instance
  end

  private_class_method :new
end

d1 = Database.instance
d2 = Database.instance
d2.object_id == d1.object_id # true