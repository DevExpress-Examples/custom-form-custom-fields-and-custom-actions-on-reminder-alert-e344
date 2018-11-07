﻿<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxe" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    </div>
        <dxp:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%">
            <PanelCollection>
                <dxp:PanelContent runat="server" _designerRegion="0">
                    <dxe:aspxbutton id="btnCreateAptRem" runat="server" text="Create appointment with reminder" AutoPostBack="False" ClientInstanceName="btnCreateAptRem">
                    <ClientSideEvents Click="function(s, e) { OnBtnCreateAptRemClick(); }" />
                    </dxe:aspxbutton>
                    &nbsp;
                    <br />
        <dxwschs:ASPxScheduler id="ASPxScheduler1" runat="server" Width="100%" 
        OnAppointmentFormShowing="ASPxScheduler1_AppointmentFormShowing" 
        OnBeforeExecuteCallbackCommand="ASPxScheduler1_BeforeExecuteCallbackCommand" GroupType="Resource" Start="2008-08-08" ClientInstanceName="scheduler" OnAppointmentViewInfoCustomizing="ASPxScheduler1_AppointmentViewInfoCustomizing" OnReminderAlert="ASPxScheduler1_ReminderAlert">     
        <OptionsForms AppointmentFormTemplateUrl="~/MyForms/MyAppointmentForm.ascx" />
        <Views>
            <DayView ResourcesPerPage="1" DayCount="3"><TimeRulers><cc1:TimeRuler /></TimeRulers></DayView>
            <WorkWeekView><TimeRulers><cc1:TimeRuler /></TimeRulers></WorkWeekView>
            <WeekView ResourcesPerPage="1">
            </WeekView>
        </Views>
            <OptionsBehavior RemindersFormDefaultAction="Custom" ShowRemindersForm="False" />
    </dxwschs:ASPxScheduler>
                </dxp:PanelContent>
            </PanelCollection>
        </dxp:ASPxPanel>
        &nbsp;
<asp:ObjectDataSource ID="appointmentDataSource" runat="server" DataObjectTypeName="CustomEvent" TypeName="CustomEventDataSource" DeleteMethod="DeleteMethodHandler" SelectMethod="SelectMethodHandler" InsertMethod="InsertMethodHandler" UpdateMethod="UpdateMethodHandler" OnObjectCreated="appointmentsDataSource_ObjectCreated" />

    </form>
    <script type="text/javascript">
    function OnBtnCreateAptRemClick() {
        scheduler.RaiseCallback("CREATAPTWR|");
    }
    </script>

</body>
</html>