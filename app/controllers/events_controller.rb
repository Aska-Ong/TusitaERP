class EventsController < ApplicationController
	before_action :signed_in_user, only: [:report]
  def report
  	if !params[:temp].blank? 
  	event_id = params[:temp][:event_id]
  	@chart = LazyHighCharts::HighChart.new('pie') do |f|
		f.chart({:defaultSeriesType=>"pie", :margin=> [50,200,60,170]})
		series ={
			:type => 'pie',
			:name => 'Event Headcount',
			:data => [
				['Did Not Attend',Event.find(event_id).signed_up-Event.find(event_id).attended],
				['Attended',Event.find(event_id).attended]
			]
		}
		f.series(series)
		f.options[:title][:text] = Event.find(event_id).name + ' Event Headcount ' + Event.find(event_id).date.to_s
		f.legend(:layout => 'vertical',:style=> {:left => 'auto', :bottom=> 'auto', :right=> '50px',:top=> '100px'})
		f.plot_options(:pie=>{
			:allowPointSelect=>true, 
        	:cursor=>"pointer" , 
        	:dataLabels=>{
          	:enabled=>true,
          	:color=>"black",
          	:style=>{
            	:font=>"13px Trebuchet MS, Verdana, sans-serif"
          		}
        	}
      	})
    end
	else
	end
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
