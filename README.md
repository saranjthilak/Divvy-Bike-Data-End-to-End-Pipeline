# Divvy-Bike-Data-End-to-End-Pipeline 🚲

**DIVVY BIKES END-TO-END DATA PIPELINE WITH DASHBOARD**

---

## 1️⃣ Project Summary

We are asked to build a complete **data pipeline** for data ingestion and analytical processing to gain insights through reports and dashboards.

---

## 2️⃣ Steps

- Select a dataset of interest
- Create a pipeline for processing this dataset and loading it into a **Data Lake**
- Create a pipeline to move data from the **Data Lake** to a **Data Warehouse**
- Transform the data in the Data Warehouse to prepare it for the dashboard
- Build an **analytical dashboard/report**

---

## 3️⃣ Dataset

- **Source:** [Divvy Bike Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)
- **Description:** Bike-sharing data from Divvy (Chicago Department of Transportation)
- **Format:** CSV files (monthly, inside ZIP files)

### Dataset Attributes

| Attribute             | Description                                  |
|-----------------------|----------------------------------------------|
| ride_id               | Unique Trip ID                               |
| rideable_type         | Type of vehicle used                         |
| started_at / ended_at | Trip start and end date-time                  |
| start_station_name/id | Start station name and ID                     |
| end_station_name/id   | End station name and ID                       |
| start_lat / start_lng | Start station latitude and longitude          |
| end_lat / end_lng     | End station latitude and longitude            |
| member_casual         | Membership type (Member / Casual)             |

![image](https://user-images.githubusercontent.com/94320118/221644537-80d9dc33-9684-4c95-93b4-5f8da3dd7bd5.png)

---

## 4️⃣ Problem Description

The dataset updates monthly and is delivered as CSVs in ZIP files.

Goals:
1. Extract and combine data to derive **valuable insights**
2. Create a **data pipeline** to automate ingestion and cleaning
3. Build a **dashboard** to visualize trends and KPIs

---

## 5️⃣ Data Pipeline Overview

- **Ingestion:** Monthly ZIP files → Parquet → GCP Data Lake (Bucket)
- **Warehouse:** Parquet → BigQuery Dataset
- **Transformation:** BigQuery → DBT transformations → Analytical views
- **Visualization:** BigQuery → Google Data Studio dashboard

## Benefits:
✅ Eliminates manual processing  
✅ Enables real-time analysis  
✅ Provides continuous data pipeline  
✅ Agile, elastic, and easy to maintain

![image](https://user-images.githubusercontent.com/94320118/221644912-c4d30cd1-1377-4531-b5b1-9ce0282f4bf3.png)

---

## 6️⃣ Technologies Used

- **Google Cloud Platform (GCP)** → Processing & Storage
- **Terraform** → Infrastructure as Code
- **Apache Airflow** → Data Pipeline (ETL orchestration)
- **GCP Storage Bucket** → Data Lake
- **BigQuery** → Data Warehouse
- **DBT** → Data Modeling and Transformations
- **Google Data Studio** → Data Visualization

---

## 7️⃣ Google Cloud Platform Setup

### a. Create IAM Role with Permissions:
- BigQuery Admin
- Storage Admin
- Storage Object Creator

![image](https://user-images.githubusercontent.com/94320118/221645493-a944152d-17fb-4c27-bb14-7909710ed9bc.png)

### b. Create VM Instance:
- Region: Europe
- Machine: e2-standard-4
- Assign created IAM role
- Download JSON key pair

![image](https://user-images.githubusercontent.com/94320118/221645995-bf2acf63-10bb-4e00-890f-e92b82e4a714.png)

### c. Connect to VM via VS Code SSH

![image](https://user-images.githubusercontent.com/94320118/221646364-c03d2e68-3bd2-4bf1-80d3-917c03338ff7.png)

**Install:**
- Anaconda
- Terraform
- Docker  
**Authenticate:** Google Cloud credentials

---

## 8️⃣ Infrastructure with Terraform

Terraform is used to provision both the **Data Lake** (GCP Bucket) and **BigQuery Dataset**.


## 9️⃣ Airflow Implementation
Apache Airflow orchestrates the ETL process:

Unzip files

Convert to Parquet

Load to GCP Bucket

Steps:
Update Google credentials in docker-compose.yml

Set project ID and GCP bucket ID

Run Docker Compose:

bash
Copy
Edit
docker-compose up
Access Airflow UI at localhost:8080



Data Lake result:


## 🔟 BigQuery Table Creation
External Table created first

Partitioned table created from external table



## 1️⃣1️⃣ Data Transformation with dbt
dbt (Data Build Tool) used for data modeling and creating analytical views.

Final transformed tables loaded to BigQuery:



## 1️⃣2️⃣ Data Visualization with Google Data Studio
BigQuery connected to Google Data Studio

Interactive dashboards built for analysis:



## 🚀 Project Summary: Scalable Data Platform

- ✅ **Automated data pipeline** from raw source files to live dashboards  
- ✅ **Infrastructure as Code** with Terraform for repeatable cloud deployments  
- ✅ **ETL orchestration** using Apache Airflow for reliable, scheduled workflows  
- ✅ **Scalable analytics** with Google BigQuery as the central data warehouse  
- ✅ **Modular SQL transformations** using dbt for clean, testable data models  
- ✅ **Interactive dashboards** built with Google Data Studio for real-time insights

