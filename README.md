# Divvy-Bike-Data-End-to-End-Pipeline
DIVVY BIKES END-TO-END DATA PIPELINE WITH DASHBOARD 
# 1.	Project Summary
We are asked to build a complete data pipeline for data ingestion and further analytical processing to gain some insights from the report/dashboard.
# Steps
  •	Select a dataset that you're interested in  
  •	Create a pipeline for processing this dataset and putting it into a data lake  
  •	Create a pipeline for moving the data from the lake to a Data Warehouse  
  •	Transform the data in the data warehouse: prepare it for the dashboard.  
  •	Create an analytical dashboard/report.  
# 2.	Data Set
The dataset was made available through Kaggle. Divvy bike is a bike-sharing service in Chicago, Illinois, United States. The Chicago Department of Transportation operates it. The Divvy bike dataset includes the trip start and end time, start and end station, bike ID, and member type. The City of Chicago's open data portal makes it public. 
https://divvy-tripdata.s3.amazonaws.com/index.html
 
 
![image](https://user-images.githubusercontent.com/94320118/221644537-80d9dc33-9684-4c95-93b4-5f8da3dd7bd5.png)


Attributes of Dataset
ride_id - Unique ID Assigned to Each Divvy Trip
rideable_type - Type of Vehicle Used
started_at - Start of Trip Date and Time
ended_at - End of Trip Date and Time
start_station_name - Name Assigned to Station the Trip Started at
start_station_id - Unique Identification Number of Station the Trip Started at
end_station_name - Name Assigned to Station the Trip Ended at
end_station_id - Unique Identification Number of Station the Trip Ended at
start_lat - Latitude of the Start Station
start_lng - Longitude of the Start Station
end_lat - Latitude of the End Station
end_lng - Longitude of the End Station
member_casual - Field with Two Values Indicating Whether the Rider has a Divvy Membership or Paid with Credit Card
# 3.	Problem Description
The data set is updated monthly, and the dataset is in CSV format inside Zip files. The Aim is to
1. Extract and combine the data to find valuable insights and trends.
2. Create a data pipeline to organise the data and eliminate repetitive tasks like importing and cleaning the data set
3. Create a Dashboard to showcase the data trends.
 
# 4.	Data Pipeline 
The report showcases the creation of a data lake and a data warehouse through an end-to-end pipeline and a Dashboard. Datasets are updated monthly, then ported to a  data lake as parquets using airflow and moved to a Big Query data set. The data lake is created using a GCP bucket, and Both Bucket and Big Query data set is created using Terraform. The Big Query data set is then partitioned, and new tables will be created back using dbt tool. The Google Data Studio is a data visualisation tool that will then be connected to Big Query Tables and generate trends and insights of data sets using a Dashboard.
Data pipeline has been made because they eliminate manual steps which can be used to process data. With the help of a pipeline, there would be smooth data flow which would be used from one step to the other. This helps in the real-time analysis of data and information-driven decisions.
This data pipeline helps in the continuous processing of data. This is an agile and elastic process and allows smooth access to data. This also helps in easy setup and maintenance.
 
![image](https://user-images.githubusercontent.com/94320118/221644912-c4d30cd1-1377-4531-b5b1-9ce0282f4bf3.png)

Technologies Used
1.	Google Cloud Platform (Processing)
2.	Terraform (Infrastructure as a Service)
3.	Airflow (Data Pipeline - ETL)
4.	GCP Storage Bucket (Data Lake)
5.	Big Query (Data Warehouse)
6.	DBT (Creating Analytical Views)
7.	Google Data Studio (Data Visualisation)
# 5.	Google Cloud Platform
  Google Cloud Platform (GCP) is a collection of cloud computing services offered by Google. These services run on the same infrastructure that Google uses internally for its end-user products, such as Google Search and YouTube. In addition, GCP provides various services, including computing, storage, networking, and big data analytics.
a.	Create a GCP account and create a Role.
Use IAM and create a Role with the below permissions
1. Big Query Admin
2. Storage Admin
3. Storage Object Creator

 
![image](https://user-images.githubusercontent.com/94320118/221645493-a944152d-17fb-4c27-bb14-7909710ed9bc.png)

b.	Create a VM instance assigning the role.
Use Compute Engine to create a VM instance and select. 
1.	Region in Europe
2.	Machine type e2-Standard-4
3.	Assign the above-created role. 
4.	Download the key pair as a JSON file 
 
![image](https://user-images.githubusercontent.com/94320118/221645995-bf2acf63-10bb-4e00-890f-e92b82e4a714.png)

c.	Connect VS code to the remote host using SSH.
Generate the key using a JSON file and add it to the metadata ssh key
 
  ![image](https://user-images.githubusercontent.com/94320118/221646213-4d0cd70e-919c-4627-b747-5946d9cc7ff0.png)
	
 	 use Instance public IP to log in to the remote VM instance 
 
  ![image](https://user-images.githubusercontent.com/94320118/221646364-c03d2e68-3bd2-4bf1-80d3-917c03338ff7.png)

•	Download Anaconda, Terraform and docker Packages.
•	Authenticate the Google credentials.

# 6.	Run Terraform Codes to create Bucket and Data Lake.
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. It can manage popular service providers as well as custom in-house solutions. It uses a simple, human-readable language called HashiCorp Configuration Language (HCL) to describe infrastructure as code. This allows for collaboration, versioning, review, and automation of infrastructure changes. Terraform can be used to manage infrastructure on cloud providers like AWS, Azure, and GCP, as well as on-premises and other infrastructure.
Use the below Commands to run the code
•	Terraform init
•	Terraform plan
•	Terraform apply

            
  ![image](https://user-images.githubusercontent.com/94320118/221646549-79b6e0ab-7e3c-4577-977e-c36335bb74db.png)

a.	Bucket is created for Data Lake 
    A data lake is a large, centralised repository that allows organisations to store all their structured and unstructured data at any scale. The data can be stored in raw format and processed later per business requirements. Data lake enables a more cost-effective and flexible way to store and analyse data. Data can be stored in various formats and accessed by different users and systems for different purposes, such as reporting, analytics, and machine learning.
 
  ![image](https://user-images.githubusercontent.com/94320118/221646693-2a1e8d32-6b56-4cbf-acab-c10fae67dc8d.png)

b.	Data warehouse is created using Big Query.
      A data warehouse is a system for collecting, storing, and analysing large amounts of data from various sources. It is designed to support the reporting and analysis of data and can be used to support business intelligence and decision-making processes. Data is typically extracted from transactional systems and loaded into the data warehouse on a regular schedule, where it can be organised and optimised for querying and reporting. In addition, data warehouses often use other tools, such as business intelligence and data mining software, to perform complex data analysis and visualisation tasks.
 
![image](https://user-images.githubusercontent.com/94320118/221646780-4896089a-9467-4238-8ab8-eec993b7213c.png)

# 7.	Airflow implementation 
      Airflow is an open-source platform to programmatically author, schedule, and monitor workflows. It is written in Python and is used to schedule and manage data pipelines, workflow management, and backfill historical data. It can integrate with various data storage systems and message queues. It can also run tasks on various execution environments, such as a local machine, a cluster, or a cloud-based system. Here, Airflow is implemented to unzip the files, convert them into column data, and load them into the GCP bucket.
1.	Update the google credential in docker-compose
2.	Update the project ID and GCP bucket ID
3.	Run Docker compose
  
![image](https://user-images.githubusercontent.com/94320118/221647454-395b356b-9c47-432c-a545-43553a0f784e.png)


Use port 8080 Login to Airflow.
Wait till data ingestion is complete.

![image](https://user-images.githubusercontent.com/94320118/221647611-a574fdee-13f5-45cf-9014-cfaa6dc1e1ec.png)

 
Datasets are loaded to the Data lake as parquets. 

![image](https://user-images.githubusercontent.com/94320118/221647706-b9d33e1b-0f44-4229-b6e7-fbceec885a33.png)

 

# 8.	Table creation using Big Query
              Data is loaded in Big Query as External Table, and a Partitioned table is created.
	      
![image](https://user-images.githubusercontent.com/94320118/221647851-2a5a2cbb-adda-42a0-8948-cbff7e4db331.png)

 
# 9.	Data Transformation using dbt
              dbt (Data Build Tool) is an open-source command line tool that helps users create, test, and manage data transformations. It is built on top of SQL and is primarily used to build and maintain analytical data pipelines. Dbt allows users to define data models, create and modify data structures, and perform data transformations using SQL. It also provides a way to manage dependencies between transformations and can be integrated with other data tools, such as Apache Airflow. Dbt is commonly used in data warehousing and data analytics to improve the efficiency and maintainability of data pipelines
         The data table in Big Query is transformed and loaded into Big Query as new Tables. 
	 
 ![image](https://user-images.githubusercontent.com/94320118/221647915-538dad2e-30ec-4b45-83a3-3c1baba18bca.png)

 

# 10.	Data Visualisation using Google Data Studio
Google Data Studio is a data visualisation and reporting tool that allows users to connect to various data sources, including Google Analytics, Google Sheets, BigQuery, and more, and create interactive reports and dashboards. It is a web-based tool that is free to use and can be used to create customised reports and dashboards that can be shared with others.
Big Query is connected to Google Data Studio, and Data Visualisation is done using google data studio.

![image](https://user-images.githubusercontent.com/94320118/221647982-d825eb02-1cb5-4fa0-98df-150d8289605c.png)




 






