class CurrencyConverterWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker # enables job status tracking

  def expiration
    @expiration ||= 60 * 60 * 24 * 30 # 30 days
  end
  
  def perform(*args)
    # Do something
    puts "Changing Currencies"
  end
end
