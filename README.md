# sismi
Visualization of italian earthquakes data.

I get the data from

Rovida A., Locati M., Camassi R., Lolli B., Gasperini P. (eds), 2016. *CPTI15, the 2015 version of the Parametric Catalogue of Italian Earthquakes.* Istituto Nazionale di Geofisica e Vulcanologia.
doi:http://doi.org/10.6092/INGV.IT-CPTI15

Then I select the earthquakes where the time is known to the seconds and I plot the *Default Moment Magnitude (MwDef)* of said earthquakes versus the time of day, this is the plot I get:

![alt text](MwDef_vs_time-of-day.png "Default Moment Magnitude (MwDef) vs time of day (to seconds).")

The oldest earthquake in this selection happened in 1801 (1801-10-08 07:52:53 with epicentre in the Bolognese area and with MwDef=4.9) and the 1957 events are about the 42% of the entire dataset.

In order to get more events I select the earthquakes where the time is known to the hour and I get a subset of 3818 events that now are about the 83% of the entire dataset. The oldest earthquake happened in 1044-04-19 09:00:00 with epicentre in the city of Benevento and with MwDef=4.63.

![alt text](MwDef_vs_hour-of-day.png "Default Moment Magnitude (MwDef) vs hour of day.")

This graph shows a vertical stripe pattern due to the fact that now the time of the earthquakes is known only to the hour.

