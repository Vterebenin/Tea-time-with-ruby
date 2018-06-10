=begin 
Описание: Фасад — паттерн проектирования, который предоставляет собой простой 
интерфейс к сложной системе классов, библиотеке или фреймворку. Используйте его 
если у вас есть несколько классов и вам нужно написать для них оболочку с 
ограниченным интерфейсом.

Пример задачи: Вам необходимо сделать выгрузку информации о пользователях в 
виде xls-файла и перекодировать его в определенный формат для дальнейшей 
пересылки.

Реализация: Необходимо точно знать какие классы дают доступ к пользовательским 
данным, какой модуль способен сгенерировать xls-файл, в какой формат его нужно 
перекодировать и какая библиотека может это сделать. После, написать алгоритм и 
обернуть его в небольшой метод.
=end
# library for generate xls-file
module RubyXLS
  # a lot of code
end

# class that consis information about user
class User
  # a lot of code
end

# Module provides for the encoding and decoding of binary data using a Base64 representation.
module Base64
  # a lot of code
end

# class-facade
# if some of libraries will be changed we need only change class-facade
class XlsGenerator
  def self.generate
    workbook = RubyXLS::Workbook.new
    worksheet = workbook[0]

    worksheet.add_header(
      ['ID', 'Full name', 'Active?', 'Activate Date']
    )

    User.all.each do |user|
      worksheet.add_row(
        [user.id, user_full_name. user.active?, user.activate_date]
      )
    end

    content = workbook.stream.string
    Base64.strict_encode64(content)
  end
end

# email-sender
class ReportSender
  def self.send(email)
    report = XlsGenerater.generate
    MainMailer.send(
      to: 'email'
      attach: report
    )
  end
end