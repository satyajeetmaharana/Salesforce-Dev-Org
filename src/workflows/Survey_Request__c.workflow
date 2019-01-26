<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stop_Date_Null</fullName>
        <field>Stop_Started_Date__c</field>
        <name>Stop Date Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stop_Start_Date</fullName>
        <field>Stop_Started_Date__c</field>
        <formula>TODAY()</formula>
        <name>Update Stop Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Stop Date To Null</fullName>
        <actions>
            <name>Stop_Date_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Survey_Request__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Stop</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Stop Start Date</fullName>
        <actions>
            <name>Update_Stop_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Survey_Request__c.Status__c</field>
            <operation>equals</operation>
            <value>Stop</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
