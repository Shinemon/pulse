"
runs on default rabbitMQ setup, with events on and events queues bound to events exchange  
events.permission.deleted  queue must not be empty 
"
Class {
	#name : #RMQEventParserTestPermissionDeleted,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'parser',
		'consumer'
	],
	#category : #'RMQ-Core-Parser'
}

{ #category : #initialization }
RMQEventParserTestPermissionDeleted >> setUp [

 | newPermission user vhost |
"todo : go further and create the events queue and bing it to the exchange queue ?"

	model := PulseModel new.
	model name: 'test'.
	
	parser := RMQEventParser new. 
	
	consumer := ConsumeEvents new. 
	consumer model: model. 
	consumer parser: parser.
	
	"create the elements in the model"
	newPermission := RMQPermission new.
   "add the user to the model if it doest not exist"
   user := model selectOrAddEntityNamed: 'testuser' withType: RMQUser.
	newPermission user: user.
	user permissions add: newPermission.
							
	"add the vhost to the model if it doest not exist"
	vhost := model selectOrAddEntityNamed: '/' withType: RMQVHost.
	newPermission vhost: vhost.
	vhost permissions add: newPermission.
						
	model add: newPermission.
	
	"consume from the events queues"
	consumer consumeQueue: 'events.permission.deleted'; start. 
	2 seconds wait.
	
	

]

{ #category : #tests }
RMQEventParserTestPermissionDeleted >> testModelPopulation [

	self assert: (model allRMQPermissions anySatisfy: [ :el | el vhost pulseName = '/' and:[ el deletionDate isNotNil and: [ el user pulseName = 'testuser' ] ] ] ).
]