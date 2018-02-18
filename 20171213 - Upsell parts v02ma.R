# path<-"C:/Users/MADIMUL/Downloads/Work/Upsell Logic/Data/"
# setwd(path)
processed<-"C:/Users/MADIMUL/Downloads/Work/Upsell Logic/Processed Files/"
# data<-read.csv("1-15_Apr_2017_1.csv",header = FALSE)
# data<-data[,c(11,13,14,25)]
# colnames(data)<-c("Vehicle Class","Body Number","Vehicle Number","Part Number")

# Reading Files for 2017
path_2017<-"C:/Users/MADIMUL/Downloads/Work/Upsell Logic/Data/2017 Data/"
setwd(path_2017)
filenames = list.files(path_2017,
                       full.names=FALSE)
print(paste0("Total Number of Files to be read:",length(filenames)))
data_2017 = NULL
data_2017 = as.data.frame(data_2017)
for(i in filenames) {
  print(paste0("Reading Filename:",i))
  temp_data = read.csv(i,header=TRUE,stringsAsFactors = FALSE,na.strings = c("        ","","NA"," ",".","           ",".          "))
  temp_data<-temp_data[,c(3,4,18,7,8,10,19,23)]
  temp_data$Age2<-ifelse(temp_data$Age<=2,"0 - 2 Years",
                    ifelse(temp_data$Age<=5,"3 - 5 Years",
                       ifelse(temp_data$Age<=10,"5 - 10 Years","10+ Years")))
  temp_data<-temp_data[,-7]
  print(paste0("Rows temp_data:",nrow(temp_data)))
  print(paste0("Rows supposed to be in final data:",(nrow(temp_data)+nrow(data_2017))))
  data_2017 = rbind(data_2017,temp_data)
  setwd(path_2017)
  print(paste0("Rows in final data:",nrow(data_2017)))
}
setwd(processed)
# write.csv(data_2017,"Processed_2017.csv",row.names = FALSE)

# data_2017<-read.csv("Processed_2017.csv",header = TRUE)
frequency<-as.data.frame(table(data_2017$Item.Description))
frequency_age<-as.data.frame(table(data_2017$Item.Description,data_2017$Age2))
data_2017_merge<-merge(data_2017,frequency,by.x = "Item.Description",by.y = "Var1",all.x = TRUE)
data_2017_merge_age<-merge(data_2017_merge,frequency_age,by.x = c("Item.Description","Age2"),by.y = c("Var1","Var2"),all.x = TRUE)
write.csv(data_2017_merge_age,"Processed_2017_1.csv",row.names = FALSE)

'''
# Reading Files for 2016
path_2016<-"C:/Users/MADIMUL/Downloads/Work/Upsell Logic/Data/2016 Data/"
setwd(path_2016)
filenames = list.files(path_2016,
                       full.names=FALSE)
print(paste0("Total Number of Files to be read:",length(filenames)))
data_2016 = NULL
data_2016 = as.data.frame(data_2016)
for(i in filenames) {
  print(paste0("Reading Filename:",i))
  temp_data = read.csv(i,header=FALSE,na.strings = c("        ","","NA"," ",".","           ",".          "))
  temp_data<-temp_data[,c(11,13,14,20,25)]
  temp_data<-subset(temp_data,(temp_data[,4]==2),select = c(1,2,3,5))
  print(paste0("Rows temp_data:",nrow(temp_data)))
  print(paste0("Rows supposed to be in final data:",(nrow(temp_data)+nrow(data_2016))))
  data_2016 = rbind(data_2016,temp_data)
  setwd(path_2016)
  print(paste0("Rows in final data:",nrow(data_2016)))
}
colnames(data_2016)<-c("Vehicle Class","Body Model","Vehicle Number","Part Number")
setwd(processed)
write.csv(data_2016,"Processed_2016.csv",row.names = FALSE)

data_final<-rbind(data_2017,data_2016)
write.csv(data_final,"Processed_final.csv",row.names = FALSE)
data_final<-na.omit(data_final)
data_2017<-na.omit(data_2017)
data_2016<-na.omit(data_2016)
write.csv(data_2017,"Processed_2017_na_omit.csv",row.names = FALSE)
write.csv(data_2016,"Processed_2016_na_omit.csv",row.names = FALSE)
write.csv(data_final,"Processed_final_na_omit.csv",row.names = FALSE)

# Adding Frequency
count_occurence<-as.data.frame(table(data_2017$`Part Number`))
data_2017_merge<-merge(data_2017,count_occurence,by.x = "Part Number",by.y = "Var1",all.x = TRUE)
write.csv(data_2017_merge,"Processed_2017_na_omit.csv",row.names = FALSE)

count_occurence<-as.data.frame(table(data_final$`Part Number`))
data_final_merge<-merge(data_final,count_occurence,by.x = "Part Number",by.y = "Var1",all.x = TRUE)
write.csv(data_final_merge,"Processed_final_na_omit.csv",row.names = FALSE)

# Reading the processed files
'''

tmp<-read.csv("C:/Users/MADIMUL/Downloads/Work/Upsell Logic/1-02 Data Download/1-02_2017_example.csv",header = FALSE,encoding ='cp932')

