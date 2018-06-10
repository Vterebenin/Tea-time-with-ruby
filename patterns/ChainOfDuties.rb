=begin 
Описание: Данный паттерн представляет собой реализацию последовательной цепочки 
обработчиков для какого либо события/сообщения. Каждый обработчиков решает одну 
задачу: обработать запрос самостоятельно или передать его дальше по цепочке.

Пример задачи: У нас есть веб-приложение. На каждый ответ от сервера должен 
генерироваться небольшой лог в виде json и создаваться запись в лог-файле. 
Есть определенная корпоративная политика по обработке таких логов:
Логи c 2xx статусами храняться в файла production.log;
Логи c 2xx статусами содержащую информацию об оплате храняться в production_payments.log;
Логи с 4хх статусами храняться в файле production4xx.log и падают в канал в telegram;
Логи с 5хх статусами храняться в файле production5xx.log и падают в канал в slack;

Реализация: Основная логика объекта, для цепочки, будет описана в абстрактном 
классе <LogHandler>. От него будем наследовать классы-обработчики для каждого
условия хранения логов. Далее, созданные классы необходимо объединить в цепочку. 
Цепочку будем формировать от частного к общему.
=end

class LogHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def process(log_item)
    if accept(log_item)
      return true
    elsif @successor
      @successor.process(log_item)
    else
      fail(log_item)
    end
  end

  private

  def fail(log_item)
    msg = "The log-item '#{log_item}' could not be handled."
    save_to_file(msg, 'LogHandler_erros.log')
  end

  def accept(log_item)
    raise '#accept_request method must be implemented.'
  end

  def save_to_file(log_item, file_name)
    File.open(file_name, 'a') do |f|
      f.write(log_item)
      f.write("\n")
    end
  end
end

class StandartLogHandler < LogHandler
  def accept(log_item)

    if log_item[:http_status] =~ /^2\d\d$/
      puts 'StandartLogHandler\'s accept'
      save_to_file(log_item, 'production.log')
      return true
    else
      return false
    end
  end
end

class PayLogHandler < LogHandler
  def accept(log_item)
    if valid_item?(log_item)
      puts 'PayLogHandler\'s accept'
      save_to_file(log_item, 'production_payments.log')
      return true
    else
      return false
    end
  end

  private

  def valid_item?(log_item)
    (log_item[:http_status] =~ /^2\d\d$/ &&
      log_item[:http_method]=='POST' &&
      log_item[:processing][:by]=='PayController#create')
  end
end

class ClientErrorLogHandler < LogHandler
  def accept(log_item)
    if log_item[:http_status] =~ /^4\d\d$/
      puts 'ClientErrorLogHandler\'s accept'
      save_to_file(log_item, 'production4xx.log')
      send_to_telegram(log_item)
      return true
    else
      return false
    end
  end

  private

  def send_to_telegram(log_item)
    # ::TelegramSender.notify_about4xx(log_item)
  end
end

class ServerErrorLogHandler < LogHandler
  def accept(log_item)
    if log_item[:http_status] =~ /^5\d\d$/
      puts 'ServerErrorLogHandler\'s accept'
      save_to_file(log_item, 'production5xx.log')
      send_to_slack(log_item)
      return true
    else
      return false
    end
  end

  private

  def send_to_slack(log_item)
    # ::SlackSender.notify_about5xx(log_item)
  end
end


chain_of_responsibility = ServerErrorLogHandler.new(
  ClientErrorLogHandler.new(
    PayLogHandler.new(
      StandartLogHandler.new
    )
  )
)


chain_of_responsibility.process(example_200)
# StandartLogHandler's accept

chain_of_responsibility.process(example_payment)
# PayLogHandler's accept

chain_of_responsibility.process(example_404)
# ClientErrorLogHandler's accept

chain_of_responsibility.process(example_500)
# ServerErrorLogHandler's accept