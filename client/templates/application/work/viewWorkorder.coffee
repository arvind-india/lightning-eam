Template.viewWorkorderPage.onRendered ->
  $(".dropdown-button").dropdown()   
  $('.tooltipped').tooltip {delay: 50}

Template.viewWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Collections.Workorders.Current
  workorder: -> Collections.Workorders.Current.status > 2

Template.viewWoForm.helpers
  viewDoc: -> Collections.Workorders.Current
  safetyDoc: -> Collections.Workorders.Current.safetyMethod
  settingsSafety: -> {
      rowsPerPage: 10
      showFilter: false
      fields:  [
        { key: 'id', label: 'Sequence ID'}
        { key: 'createdBy', label: 'Created by' }
        { key: 'activity', label: ' Activity' }
        { key: 'hazards', label: ' Hazards' }
        { key: 'controls', label: ' Risk control measures' }
        { key: 'responsible', label: 'Responsible' }
        { key: 'completedTime', label: 'Completed Time' }
        { key: '', label: 'Start/Complete', tmpl: Template.rtViewEditDelete }
      ]
    }
  workDoc: -> Collections.Workorders.Current.workPlan
  settingsWork: -> {
      rowsPerPage: 10
      showFilter: false
      fields:  [
        { key: 'id', label: 'Sequence ID'}
        { key: 'text', label: 'Instructions' }
        { key: 'estimatedTime', label: 'Est hrs' }
        { key: 'finishTime', label: 'Finish Time' }
        { key: 'completedTime', label: 'Completed Time' }
        { key: '', label: 'Start/Complete', tmpl: Template.rtViewEditDelete }
      ]
    }
