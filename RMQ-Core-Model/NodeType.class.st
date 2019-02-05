Class {
	#name : #NodeType,
	#superclass : #PulseEnum,
	#instVars : [
		'nodes'
	],
	#category : #'RMQ-Core-Model'
}

{ #category : #'as yet unclassified' }
NodeType class >> disc [
	^ self new rmqState: #disc
]

{ #category : #'as yet unclassified' }
NodeType class >> ram [
	^ self new rmqState: #ram
]

{ #category : #accessing }
NodeType >> nodes [
	<MSEProperty: #nodes type: #RMQNode opposite:#type>
	<multivalued>
	^ nodes
]

{ #category : #accessing }
NodeType >> nodes: anObject [
	nodes := anObject
]