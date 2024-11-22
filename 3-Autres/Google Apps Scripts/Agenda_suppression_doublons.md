# Suppression des doublons dans l'agenda Google  

Il faut :  
- Récupérer l'ID de l'agenda dans les paramètres Google Agenda  
- Modifier les dates de début et de fin (initialDateString & finalDateString)  

```
//Script de suppression de doublons dans l'agenda de Congés
function get_dupl() {
  var actions = true
  var formattedDate = Utilities.formatDate(new Date(), "GMT", "yyyy-MM-dd'T'HH:mm:ss'Z'");

  var initialDateString = "07/10/2024"; //format "européen" : jour/mois/année
  var finalDateString = "01/02/2025"; //format "européen" : jour/mois/année
  var initialDate = dateToString(initialDateString);
  var currentDateDebut = dateToString(initialDateString);
  var currentDateFin = dateToString(initialDateString);
  var finalDate = dateToString(finalDateString);
  initialDate.setHours(0,0,0,0)
  currentDateDebut.setHours(0,0,0,0)
  currentDateFin.setHours(23,59,59,99)
  finalDate.setHours(23,59,59,99)

  var Cal = CalendarApp.getCalendarById("<ID_GOOGLE_AGENDA");
  var nbrDeleted = 0

  while (currentDateFin <= finalDate){
    Logger.log('----------DEBUT DE JOURNEE----------')
    Logger.log('Date : %s',currentDateDebut);
    var evtsList = Cal.getEvents(currentDateDebut,currentDateFin);
    Logger.log('  %s événement(s) présent(s).',evtsList.length);
    for (var i = 0; i < evtsList.length; i++) {
    var evtsDupl = Cal.getEvents(currentDateDebut,currentDateFin,{search: evtsList[i].getTitle()});
    if (evtsDupl.length > 1) {
      Logger.log('    Nom de l\'event : %s',evtsList[i].getTitle());
      Logger.log('    Nombre d\'event(s) avec le même nom : %s',evtsDupl.length)
      Logger.log('      Deleting entry %s',evtsList[i].getTitle())
      if (actions){evtsList[i].deleteEvent()}
      nbrDeleted+=1
    }
    }
    currentDateDebut.setDate(currentDateDebut.getDate()+1)
    currentDateFin.setDate(currentDateFin.getDate()+1)
    Logger.log('===========FIN DE JOURNEE===========')
    Logger.log('')
  }

  Logger.log('***************************************\n* Nombre d\'event(s) supprimé(s) : %s *\n***************************************',nbrDeleted)

}

function dateToString(dateString) {
  var dateArray = dateString.split("/");
  var year = dateArray[2];
  var month = dateArray[1];
  var day = dateArray[0];
  var date = new Date(year, month - 1, day);

  return date;
}
```
