require 'plivo'

AUTH_ID = ""
AUTH_TOKEN = ""


p = RestAPI.new(AUTH_ID, AUTH_TOKEN)

# Get live conferences
response = p.get_live_conference()


# Get live conference
params = {'conference_id' => 'XXXXXXXXXXXXXXXXX', 
        }   
response = p.get_live_conference(params)


# Hangup conference
params = {'conference_id' => 'XXXXXXXXXXXXXXXXX', 
        }   
response = p.hangup_conference(params)


# Hangup member
params = {'conference_id' => 'XXXXXXXXXXXXXXXXX', 
          'member_id' => 'MMMMMMMMMMMMMMM',
        }   
response = p.hangup_member(params)


# Record conference
params = {'conference_id' => 'XXXXXXXXXXXXXXXXX', 
        }   
response = p.record_conference(params)


# Stop recording conference
params = {'conference_id' => 'XXXXXXXXXXXXXXXXX', 
        }   
response = p.stop_record_conference(params)


# Get recordings
response = p.get_recordings()
