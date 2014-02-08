class FormSubmissionMailer < ActionMailer::Base
	default :from => "rswilsonuk@gmail.com"
		def form_submitted(form_submission)
		@form_submission = form_submission
		#attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
		mail(:to => "#{form_submission.form.notification_address}", :subject => "#{form_submission.form.name} Submitted")
	end
end
