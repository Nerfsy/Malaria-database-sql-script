
CREATE TABLE geographical_location (
    Location_ID INT(11) PRIMARY KEY,
    Village VARCHAR(100),
    Parish VARCHAR(100),
    Sub_County VARCHAR(100),
    County VARCHAR(100),
    Region VARCHAR(50),
    Population INT(11),
    Coordinates VARCHAR(100),
    Malaria_Risk_Level VARCHAR(50),
    Health_Facilities_Count INT(11),
    ITN_Coverage DECIMAL(5,2),
    Reported_Cases INT(11)
);

CREATE TABLE resource (
    Resource_ID INT(11) PRIMARY KEY,
    Facility_ID INT(11),
    Resource_Type VARCHAR(50),
    Quantity INT(11),
    Last_Updated_Date DATE,
    Description TEXT,
    Date_Added DATE,
    Update_Date DATE,
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE health_facility (
    Facility_ID INT(11) PRIMARY KEY,
    Facility_Name VARCHAR(100),
    Location_ID INT(11),
    Facility_Type INT(11),
    Capacity INT(11),
    Contact_Details VARCHAR(100),
    Date_Added DATE,
    Facility_Head VARCHAR(100),
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE treatment (
    Treatment_ID INT(11) PRIMARY KEY,
    Treatment_Name VARCHAR(100),
    Treatment_Description TEXT,
    Dosage VARCHAR(50),
    Side_Effects TEXT,
    Date_Added DATE,
    Update_Date DATE
);

CREATE TABLE user (
    User_ID INT(11) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Preferred_Name VARCHAR(50),
    Role_ID INT(11),
    Username VARCHAR(50),
    Password VARCHAR(100),
    Facility_ID INT(11),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE malaria_cases (
    Case_ID INT(11) PRIMARY KEY,
    Patient_ID INT(11),
    Facility_ID INT(11),
    Role_Name VARCHAR(50),
    Date_of_Diagnosis DATE,
    Treatment_ID INT(11),
    Outcome_ID INT(11),
    Referred_By INT(11),
    Referral_Date DATE,
    Reason TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES treatment(Treatment_ID),
    FOREIGN KEY (Outcome_ID) REFERENCES treatment_outcome(Outcome_ID),
    FOREIGN KEY (Referred_By) REFERENCES user(User_ID)
);

CREATE TABLE patient_data (
    Patient_ID INT(11) PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Date_of_Birth DATE,
    Gender VARCHAR(10),
    Phone_Number VARCHAR(15),
    Next_of_Kin VARCHAR(100),
    Location_ID INT(11),
    Date_Added DATE,
    Update_Date DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE treatment_outcome (
    Outcome_ID INT(11) PRIMARY KEY,
    Outcome_Name VARCHAR(100),
    Outcome_Description TEXT,
    Date_Added DATE,
    Update_Date DATE
);

CREATE TABLE epidemiological_data (
    Data_ID INT(11) PRIMARY KEY,
    Location_ID INT(11),
    Recorded_Date DATE,
    Cases_Per_Thousand_People INT(11),
    Rainfall INT(11),
    Average_Temperature DECIMAL(5,2),
    Update_Date DATE,
    Added_By INT(11),
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID),
    FOREIGN KEY (Added_By) REFERENCES user(User_ID)
);
