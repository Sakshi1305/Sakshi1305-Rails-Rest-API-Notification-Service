# Rails Rest API Notification Service
API implementation to send notifications to developers in the form of SMS and emails.  Created api for developers, teams and messages. Response of message api consist SMS and emails values. When message created, SMS and email to be sent to all the developers of that team.

## Project Setup

**Clone Project**:

```console
$ git clone 
```

**Install all gems**:

```console
$ bundle install
```

**Update the database with new data model**:

```console
$ rake db:migrate
```

**Feed the database with default seeds**:

```console
$ rake db:seed
```

**Start the web server on `http://localhost:3000` by default**:

```console
$ rails server
```

## Usage

| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| POST | /developers| Create a developer|
| POST | /teams | Create a team |
| PUT | /teams/:team_id | Update a team |
| POST | /messages | Create a message |

## Use Case Examples


### CRUD

**Create a new developer**:

```console
curl --location -g --request POST 'localhost:3000/api/v1/developers?developer[full_name]=developer12&developer[email]=developer1@gmail.com2&developer[mobile]=+917726938963&developer[team_ids]=17'
```

**Create a new team**:

```console
curl --location -g --request POST 'localhost:3000/api/v1/teams?team[name]=team1&team[dept_name]=cs&team[developer_ids]=2'
```

**Update an existing team by id**:

```console
curl --location -g --request PUT 'localhost:3000/api/v1/teams/15?team[name]=team2&team[dept_name]=cse1&team[developer_ids]=2'
```

**Create a new message**:

```console
curl --location -g --request POST 'localhost:3000/api/v1/messages?message[content]=Hi%20Testing%20Message&message[title]=message&message[team_id]=17'
```