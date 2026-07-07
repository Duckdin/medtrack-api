DROP TABLE IF EXISTS patient CASCADE;

DROP TABLE IF EXISTS medication CASCADE;

DROP TABLE IF EXISTS symptom CASCADE;

DROP TABLE IF EXISTS medication_taken_status CASCADE;

DROP TABLE IF EXISTS medcoach_tips CASCADE;


 -- PATIENT
 /*
    CREATE table for patient
*/
 CREATE TABLE PATIENT (
    patient_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    phone_number    VARCHAR(20) NOT NULL,
    name            VARCHAR(30) NOT NULL,
    password_hash   VARCHAR(255) NOT NULL
);

COMMENT ON COLUMN PATIENT.patient_id IS
    'Patient id';

COMMENT ON COLUMN PATIENT.phone_number IS
    'Patient phone number';

COMMENT ON COLUMN PATIENT.name IS
    'Patient name';

COMMENT ON COLUMN PATIENT.password_hash IS
    'Patient password';

-- Medication

/*
    CREATE table for medication
*/
CREATE TABLE MEDICATION (
    id SERIAL PRIMARY KEY,
    patient_id  UUID NOT NULL REFERENCES PATIENT(patient_id) ON DELETE CASCADE,
    medication_name   VARCHAR(255) NOT NULL,
    dosage            VARCHAR(100) NOT NULL,
    frequency         VARCHAR(100) NOT NULL,
    scheduled_time    TIME NOT NULL,
    medication_type   VARCHAR(100) NOT NULL,
    notes             VARCHAR(200)
);

/*
    Added comment for the attributes in the medication table
*/
COMMENT ON COLUMN MEDICATION.id IS
    'medication id';

COMMENT ON COLUMN MEDICATION.patient_id IS
    'Patient id';

COMMENT ON COLUMN MEDICATION.medication_name IS
    'Medication name';

COMMENT ON COLUMN MEDICATION.dosage IS
    'Amount to take for the medication';

COMMENT ON COLUMN MEDICATION.frequency IS
    'the number of times to take in a day';

COMMENT ON COLUMN MEDICATION.scheduled_time IS
    'Time to take the medication';

COMMENT ON COLUMN MEDICATION.medication_type IS
    'The type of medication';

COMMENT ON COLUMN MEDICATION.notes IS
    'Notes for additional information';

/*
    Alter table
*/
-- check contranint on the frequnecy
ALTER TABLE MEDICATION
ADD CONSTRAINT chk_frequency
CHECK (frequency IN ('Once daily' , 'Twice daily' , 'Three times daily' , 'As needed'));


ALTER TABLE MEDICATION
ADD CONSTRAINT chk_medication_type
CHECK (medication_type IN ('Tablet' , 'Capsule' , 'Liquid' , 'Injection' , 'Topical' , 'Other'));

CREATE INDEX idx_medication_patient_id ON MEDICATION(patient_id);

 /*
    CREATE table for SYMPTOM
*/
CREATE TABLE SYMPTOM (
    id            SERIAL PRIMARY KEY,
    patient_id    UUID NOT NULL REFERENCES PATIENT(patient_id) ON DELETE CASCADE,
    category      VARCHAR(100) NOT NULL,
    severity      INTEGER NOT NULL,
    notes         VARCHAR(200),
    date_time     TIMESTAMP NOT NULL
);

COMMENT ON COLUMN SYMPTOM.id IS
    'Symptom id';

COMMENT ON COLUMN SYMPTOM.patient_id IS
    'Patient id';

COMMENT ON COLUMN SYMPTOM.category IS
    'the type of pain of the symptom';

COMMENT ON COLUMN SYMPTOM.severity IS
    'the severity of the symptom';


COMMENT ON COLUMN SYMPTOM.notes IS
    'Additional nodes to be made';


COMMENT ON COLUMN SYMPTOM.date_time IS
    'the time of the symptom started';


/*
    Alter table for the symptom
*/
-- for category
ALTER TABLE SYMPTOM
ADD CONSTRAINT chk_category
CHECK (category IN ('Pain' , 'Nausea' , 'Dizziness' , 'Fatigue' , 'Headache' , 'Skin Reaction' ,'Other'));

-- for severity
ALTER TABLE SYMPTOM
ADD CONSTRAINT chk_severity
CHECK (severity BETWEEN 1 AND 10);


CREATE INDEX idx_symptom_patient_id ON SYMPTOM(patient_id);


-- MedCoach tips
CREATE TABLE medcoach_tips (
    id            SERIAL PRIMARY KEY,
    patient_id    UUID NOT NULL REFERENCES PATIENT(patient_id) ON DELETE CASCADE,
    tip           TEXT NOT NULL,
    created_at    TIMESTAMP NOT NULL DEFAULT now()
);

COMMENT ON COLUMN medcoach_tips.id IS
    'the medcoach tips id';

COMMENT ON COLUMN medcoach_tips.patient_id IS
    'Patient id';

COMMENT ON COLUMN medcoach_tips.tip IS
    'the tip created from the gen ai';

COMMENT ON COLUMN medcoach_tips.created_at IS
    'the time that is created at using the current time';


CREATE INDEX idx_medcoach_tips_patient_id ON medcoach_tips(patient_id);


-- Medication taken status
CREATE TABLE medication_taken_status (
    patient_id      UUID NOT NULL REFERENCES PATIENT(patient_id) ON DELETE CASCADE,
    medication_id   INTEGER NOT NULL REFERENCES MEDICATION(id) ON DELETE CASCADE,
    date_taken      DATE NOT NULL,
    is_taken        BOOLEAN NOT NULL,
    PRIMARY KEY (patient_id, medication_id, date_taken)
);

COMMENT ON COLUMN medication_taken_status.patient_id IS
    'Patient id';

COMMENT ON COLUMN medication_taken_status.medication_id IS
    'Medication id';

COMMENT ON COLUMN medication_taken_status.date_taken IS
    'The date the medication was taken on';

COMMENT ON COLUMN medication_taken_status.is_taken IS
    'Wheater the medication has been taken or not';
