require 'report_builder'
require 'date'

Before do
  page.current_window.resize_to(1920, 1080)
  visit "/"
end

After do |scenario|
  screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
  screenshot = Base64.encode64(File.open(temp_shot, 'rb').read)
  embed(screenshot, "image/png", "Screenshot")
end

d = DateTime.now
@current_date = d.to_s.tr(":","-")
@current_date.tr("T","_")

at_exit do
  # Ex 1:
  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/"+ @current_date
    config.report_types = [:html]
    config.report_title = "NinjaFlix - WebApp"
    config.compress_image = true
    config.additional_info = { "App" => "Web", "Data de execução" => @current_date }
    config.color = "indigo"
  end
  
  ReportBuilder.build_report
end