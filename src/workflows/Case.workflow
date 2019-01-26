<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_To_User</fullName>
        <description>Send Email To User</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Case_Requester__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Email_For_Case_Action</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Case_to_Escalated</fullName>
        <field>IsEscalated</field>
        <literalValue>1</literalValue>
        <name>Set Case to Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Status_Change_Date</fullName>
        <field>Last_Status_Change_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Last Status Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Case Escalate on High Priority</fullName>
        <actions>
            <name>Set_Case_to_Escalated</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Follow_Up_on_Escalated_Case</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Priority</field>
            <operation>equals</operation>
            <value>High</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Reminder To Owner</fullName>
        <active>true</active>
        <formula>ISPICKVAL(Status,&quot;Response Received&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_To_User</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Last_Requester_Comment_Date__c</offsetFromField>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_To_User</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Last_Requester_Comment_Date__c</offsetFromField>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_To_User</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Last_Requester_Comment_Date__c</offsetFromField>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send Reminder To Requester</fullName>
        <active>true</active>
        <formula>ISPICKVAL(Status,&quot;Waiting for Customer&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_To_User</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Last_Owner_Comment_Date__c</offsetFromField>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_To_User</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Last_Owner_Comment_Date__c</offsetFromField>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Email_To_User</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Last_Owner_Comment_Date__c</offsetFromField>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Test Workflow Rule 1</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Record Type Name 1</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Last Status Change Date On Case</fullName>
        <actions>
            <name>Update_Last_Status_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Status)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Follow_Up_on_Escalated_Case</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up on Escalated Case</subject>
    </tasks>
</Workflow>
