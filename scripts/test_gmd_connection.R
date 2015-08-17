library(RMySQL)
library(RODBC)

### Set up database connection

dbhandle <- odbcDriverConnect('driver={SQL Server}; 
                              server=r710sqljahu; 
                              database=GMD; 
                              trusted_connection=true')

# Create a connection to the database called "channel"
#channel <- odbcConnect("r710sqljahu", uid="MPIMP-GOLM\HSprenger", pwd="Potato", believeNRows=FALSE)
odbcDriverConnect(connection="server=r710sqljahu;database=GMD;trusted_connection=true;Port=1433;driver={SQL Server};TDS_Version=7.0;")
odbcDriverConnect(connection="server=gmd.mpimp-golm.mpg.de;database=r710sqljahu;uid=MPIMP-GOLM\\HSprenger;pwd=Potato;Port=1433;driver=FreeTDS;TDS_Version=7.0;")

# login <- yaml.load_file("../libpurzel/login.yaml")

# phenotyper <- dbConnect(MySQL(), user=login$user, password=login$passwd, dbname=login$db, host=login$host)  

gmd_connection <- dbConnect(MySQL(), 
                            user = "MPIMP-GOLM\\HSprenger", 
                            password = "Potato", 
                            dbname = "r710sqljahu", 
                            host = "gmd.mpimp-golm.mpg.de")  



### SQL Query for Intesity values of ALL Analytes and Chromatograms (= Samples) from one Experiment where the Analyte-MST is a quantitative Cluster.

all_values <- sqlQuery(dbhandle, 'SELECT FK_Analyte, 
                                         GMD.tf.IntensityValue.FK_chromatogram, 
                                         SUM(value) 
                                  FROM GMD.tf.MSTAnnotation 
                                  INNER JOIN GMD.tf.IntensityValue 
                                      ON GMD.tf.MSTAnnotation.FK_MST = GMD.tf.IntensityValue.FK_MST and 
                                             GMD.tf.MSTAnnotation.FK_TagList = GMD.tf.IntensityValue.FK_TagList
                                  INNER JOIN GMD.dbo.GC_Chromatogram 
                                      ON GMD.tf.IntensityValue.FK_chromatogram = GMD.dbo.GC_Chromatogram.id
  				                        INNER JOIN GMD.tf.TagList 
                                      ON GMD.tf.IntensityValue.FK_TagList = GMD.tf.TagList.id
                                  WHERE FK_Analyte is not NULL and 
                                      (GMD.tf.TagList.comment = \'trost\' or GMD.tf.TagList.name like \'%trost%\') and
                                      GMD.tf.MSTAnnotation.[Is Quantitative Cluster] = 1
                                      GROUP BY FK_Analyte, FK_chromatogram')
# Change colname
dim(all_values)
# 1055975      3