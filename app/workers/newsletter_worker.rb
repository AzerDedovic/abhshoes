class NewsletterWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #recurrence { hourly.minute_of_hour(0, 10, 20, 30, 40, 50) }
  recurrence { hourly(6) }

  def perform()
  	@users=User.where(email_confirmed:true)
  	@users.each do |user|
    #@email=user.username
    	Newsletter.newsletter(user.username).deliver_now
    end
  end
end