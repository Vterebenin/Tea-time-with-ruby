=begin
Описание: Данный паттерн навязывает структуру писать отдельный объект для 
описания каждой бизнес-логики. В идеале, этот объект имеет только один публичный 
метод в котором последовательно вызываются все приватные.

Пример задачи: Необходимо реализовать функционал запроса на восстановление 
пароля.

Реализация: Создадим класс <ForgottenPasswordService> для описание следующего 
алгоритма действий: Найти пользователя по его email; Сгенерировать токен 
восстановления пароля; Отправить сообщение со ссылкой-восстановления на почту.
=end

class ForgottenPasswordService
  def initialize(user_email)
    @user_email = user_email
    @user = nil
  end

  def perform
    find_user and generate_token and send_email
  end

  private

    def find_user
      @user = User.find_by(email: @user_email)
      @user.present?
    end

    def generate_token
      @user.update_attributes(token: TokenGenerator.generate)
    end

    def send_email
      UserMailer.password_reset(@user.email, @user.token)
    end
end