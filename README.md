# Rebel Sunshine API

Hi! This is the  **Rebel Sunshine** API. It is built with Ruby on Rails.


# Getting Started
1. Clone the Repo
2. `bundle install`
3. `rake db:migrate`
4. `rails s`
5. Go to localhost:3000

# API Endpoints
The Rebel Sunshine API is a comprehensive API for managing plant information and sensor data. The endpoints are as follows:

|Endpoint               |Description                                             |Usage
|-----------------------|--------------------------------------------------------|-------------------------------------|
|Shelves                |See all the shelves and all of their plants and sensors |`GET /shelves`                       |
|Specific Shelf         |See a specific shelf                                    |`GET /shelves/:shelf_id`             |
|Latest Sensor Data     |See the latest datapoint for a specified sensor         |`GET /sensor_data/latest/:sensor_id` |
|Range of Sensor Data   |See the sensro data between a range of timestamps       |`GET /sensor_data/range/:sensor_id`  |


For the Range of sensor data, you must pass a start and end timestamp (end timestamp will deafult to current time if none provided) like so: `/sensor_data/range/:sensor_id?start=2018-06-04T14:42:03.344Z&end=2018-06-04T14:52:03.524Z`