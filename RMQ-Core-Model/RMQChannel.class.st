Class {
	#name : #RMQChannel,
	#superclass : #PulseEntity,
	#instVars : [
		'connection',
		'prefetchCount',
		'globalPrefetchCount',
		'idleSince',
		'guaranteeMode',
		'rmqState',
		'subscribedComponents',
		'vhost',
		'users',
		'user_who_performed_connection',
		'creationDate',
		'closingDate',
		'consumedQueues'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #accessing }
RMQChannel >> closingDate [
	<MSEProperty: #closingDate type: #Number>
	^ closingDate
]

{ #category : #accessing }
RMQChannel >> closingDate: anObject [
	closingDate := anObject
]

{ #category : #accessing }
RMQChannel >> connection [
	<MSEProperty: #connection type: #RMQConnection opposite:#channels>
	^ connection
]

{ #category : #accessing }
RMQChannel >> connection: anObject [
	connection := anObject
]

{ #category : #accessing }
RMQChannel >> consumedQueues [
	<MSEProperty: #consumedQueues type: #RMQQueue opposite:#consumerChannels>
	<multivalued>
	^ consumedQueues
]

{ #category : #accessing }
RMQChannel >> consumedQueues: anObject [
	consumedQueues := anObject
]

{ #category : #accessing }
RMQChannel >> creationDate [
	<MSEProperty: #creationDate type: #Number>
	^ creationDate
]

{ #category : #accessing }
RMQChannel >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
RMQChannel >> globalPrefetchCount [
	<MSEProperty: #globalPrefetchCount type: #Number>
	^ globalPrefetchCount
]

{ #category : #accessing }
RMQChannel >> globalPrefetchCount: anObject [
	globalPrefetchCount := anObject
]

{ #category : #accessing }
RMQChannel >> guaranteeMode [
	<MSEProperty: #guaranteeMode type: #GuaranteeMode opposite: #channels>
	^ guaranteeMode
]

{ #category : #accessing }
RMQChannel >> guaranteeMode: anObject [
	guaranteeMode := anObject
]

{ #category : #accessing }
RMQChannel >> idleSince [
	<MSEProperty: #idleSince type: #Number>
	^ idleSince
]

{ #category : #accessing }
RMQChannel >> idleSince: anObject [
	idleSince := anObject
]

{ #category : #initialization }
RMQChannel >> initialize [

	super initialize.
	users := Set new.
	consumedQueues := Set new.
	subscribedComponents := Set new.
	guaranteeMode := GuaranteeMode none.
	guaranteeMode channels add: self.
	
	rmqState := State idle.
	rmqState channels add: self.
]

{ #category : #accessing }
RMQChannel >> prefetchCount [
	<MSEProperty: #prefetchCount type: #Number>
	^ prefetchCount
]

{ #category : #accessing }
RMQChannel >> prefetchCount: anObject [
	prefetchCount := anObject
]

{ #category : #accessing }
RMQChannel >> reationDate: anObject [
	reationDate := anObject
]

{ #category : #accessing }
RMQChannel >> rmqState [
	<MSEProperty: #rmqState type: #State opposite: #channels>
	^ rmqState
]

{ #category : #accessing }
RMQChannel >> rmqState: anObject [
	rmqState := anObject
]

{ #category : #accessing }
RMQChannel >> subscribedComponents [
	<MSEProperty: #subscribedComponents type: #RMQComponent opposite:#subscribedChannels>
	<multivalued>
	^ subscribedComponents
]

{ #category : #accessing }
RMQChannel >> subscribedComponents: anObject [
	subscribedComponents := anObject
]

{ #category : #accessing }
RMQChannel >> user_who_performed_connection [
	<MSEProperty: #user_who_performed_connection type: #RMQUser opposite:#initializedChannels>
	^ user_who_performed_connection
]

{ #category : #accessing }
RMQChannel >> user_who_performed_connection: anObject [
	user_who_performed_connection := anObject
]

{ #category : #accessing }
RMQChannel >> users [
	<MSEProperty: #users type: #RMQUser opposite:#usedChannels>
	<multivalued>
	^ users
]

{ #category : #accessing }
RMQChannel >> users: anObject [
	users := anObject
]

{ #category : #accessing }
RMQChannel >> vhost [
	<MSEProperty: #vhost type: #RMQVHost opposite:#channels>
	^ vhost
]

{ #category : #accessing }
RMQChannel >> vhost: anObject [
	vhost := anObject
]
