class ErrorSenator
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def as_json(arg)
    {
      errors: [
        {
          detail: @message
        }
      ]
    }
  end
end
