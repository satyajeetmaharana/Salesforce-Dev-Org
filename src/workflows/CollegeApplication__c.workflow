<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Reminder_As_Window_Opens</fullName>
        <description>Send Reminder As Window Opens</description>
        <protected>false</protected>
        <recipients>
            <recipient>satyajeet.maharana@personal.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Reminder_Window_Open</template>
    </alerts>
    <rules>
        <fullName>Send Window Open Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>CollegeApplication__c.WindowOpen__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Reminder_As_Window_Opens</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>CollegeApplication__c.WindowOpen__c</offsetFromField>
            <timeLength>-30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
