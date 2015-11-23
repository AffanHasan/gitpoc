Feature: Automatic Recipe Synchronization By Scheduler Service

	For those facilities which are part of MB-RDS integration program, this feature will provide synchronization of all the recipes inside facility
	with RDS.
	
	Background:	
		Given we have an "active" Facility Group named "A1 Facility Group" with the following facilities:
			| Facility Name		| Active ?	| RDS Sync Enabled ? |
			| A1				| true		| true				 |
			| A2				| true		| true				 |
			| A3				| true		| false				 |
			| A4				| false		| false				 |
		* Scheduler starts it's activity at the scheduled time 5:00 AM (EST) end of the day
		* At first the scheduler will fetch ( from database ) a list of those facilities which should be sync with RDS
		And this list of facilities MUST contain ONLY the following facilities:
			| A1 |
			| A2 |

	Scenario: A Site Id Is Not Provided For A Facility
		* Suppose that "site id" is not available for facility "A1"
		Then scheduler must detect that a site Id is not provided for facility "A1"
		And the scheduler will immediately stop it's sync activity for facility "A1" at this point
#		Will there be any Email notification or some logging is required in this scenario ???
		But the scheduler will proceed for the sync activity for facility "A2"
