# sismi
Visualization of italian earthquakes data.

I get the data from

Rovida A., Locati M., Camassi R., Lolli B., Gasperini P. (eds), 2016. *CPTI15, the 2015 version of the Parametric Catalogue of Italian Earthquakes.* Istituto Nazionale di Geofisica e Vulcanologia.
doi:http://doi.org/10.6092/INGV.IT-CPTI15

Then I select the earthquakes where the time is known to the seconds and I plot the *Default Moment Magnitude (MwDef)* of said earthquakes versus the time of day, this is the plot I get:

![alt text](MwDef_vs_time-of-day.png "Default Moment Magnitude (MwDef) vs time of day (to seconds).")

The oldest earthquake in this selection happened in 1801 (1801-10-08 07:52:53 with epicentre in the Bolognese area and with MwDef=4.9) and the 1957 events are about the 42% of the entire dataset.

In order to get more events I select the earthquakes where the time is known to the hours and I get a subset of 3818 events that now are about the 83% of the entire dataset. The oldest earthquake happened in 1044-04-19 09:00:00 with epicentre in the city of Benevento and with MwDef=4.63.

![alt text](MwDef_vs_hour-of-day.png "Default Moment Magnitude (MwDef) vs hour of day.")

This graph shows a vertical stripe pattern due to the fact that now the time of the earthquakes is known only to the hour.

I sorted the events known to seconds in [this file](to_sec.csv) with descending MwDef (stronger first) and the 80% of the top ten eartquakes happened at night.

I do the same for the events known to hours in [this file](just_hour.csv) and in that case the 50% of the top ten eartquakes happened at night.

The code to discriminate day from night is `is.night` by [Luke A. Winslow](https://github.com/lawinslow) in library [LakeMetabolizer](https://github.com/GLEON/LakeMetabolizer).

Some info about the forecasts of earthquakes (in Italian): [Cosa sta facendo e cosa ha fatto l'INGV nel campo della previsione dei terremoti?](http://terremoti.ingv.it/it/ultimi-eventi/13-approfondimenti/889-3-cosa-sta-facendo-e-cosa-ha-fatto-l-ingv-nel-campo-della-previsione-dei-terremoti.html).



