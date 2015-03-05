require 'rubygems'
require 'plivo'
include Plivo

# Generate a Record XML
get '/record' do
    r = Response.new()
    params = {
        'action' => "https://enigmatic-cove-3140.herokuapp.com/record_action", # Submit the result of the record to this URL
        'method' => 'GET', # HTTP method to submit the action URL
        'callbackUrl' => 'https://enigmatic-cove-3140.herokuapp.com/record_callback', # If set, this URL is fired in background when the recorded file is ready to be used.
        'callbackMethod' => 'GET' # Method used to notify the callbackUrl.
    }

    r.addRecord(params)
    puts r.to_xml()
    content_type 'text/xml'
    return r.to_s()
end

# Action URL Example
get '/record_action' do
    url = params[:RecordUrl]
    duration = params[:RecordingDuration]
    id = params[:RecordingID]

    print "Record URL : #{url}, Recording Duration : #{duration}, Recording ID : #{id}"
end

# Callback URL Example
get '/record_callback' do
    url = params[:RecordUrl]
    duration = params[:RecordingDuration]
    id = params[:RecordingID]

    print "Record URL : #{url}, Recording Duration : #{duration}, Recording ID : #{id}"
end

=begin
<Response>
<Record action="https://enigmatic-cove-3140.herokuapp.com/record_action" callbackMethod="GET" 
    callbackUrl="https://enigmatic-cove-3140.herokuapp.com/record_callback" method="GET"/>
</Response>

Sample output for Action URL
Record URL : http://s3.amazonaws.com/recordings_2013/11111111-5555-6666-2222-999944421718.mp3, Recording Duration : 8, Recording ID : a34d252c-94b1-11e4-ab5e-842b2b021718

Sample output for Callback URL
Record URL : http://s3.amazonaws.com/recordings_2013/11111111-5555-6666-2222-999944421718.mp3, Recording Duration : 8, Recording ID : a34d252c-94b1-11e4-ab5e-842b2b021718

=end