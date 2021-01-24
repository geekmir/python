-- Table: IsaTab.ONTOLOGY_SOURCE_REFERENCE
-- DROP TABLE "ONTOLOGY_SOURCE_REFERENCE";

CREATE TABLE "ONTOLOGY_SOURCE_REFERENCE"
(
    "Ontology_Source_REF_ID" oid NOT NULL,
    "Term_Source_Name" text COLLATE pg_catalog."default",
    "Term_Source_File" text COLLATE pg_catalog."default",
    "Term_Source_Version" text COLLATE pg_catalog."default",
    "Term_Source_Description" text COLLATE pg_catalog."default",
    "Ontology_REF_Investigation_Identifier" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "ONTOLOGY_SOURCE_REFERENCE_pkey" PRIMARY KEY ("Ontology_Source_REF_ID"),
    CONSTRAINT "ONTOLOGY_SOURCE_REFERENCE_Ontology_REF_Investigation_Ident_fkey" FOREIGN KEY ("Ontology_REF_Investigation_Identifier")
        REFERENCES "INVESTIGATION" ("Investigation_Identifier") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "ONTOLOGY_SOURCE_REFERENCE"
    OWNER to postgres;
-- Index: ontology_source_reference_ontology_source_ref_id_uindex

-- DROP INDEX ontology_source_reference_ontology_source_ref_id_uindex;

CREATE UNIQUE INDEX ontology_source_reference_ontology_source_ref_id_uindex
    ON "ONTOLOGY_SOURCE_REFERENCE" USING btree
    ("Ontology_Source_REF_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.INVESTIGATION

-- DROP TABLE "INVESTIGATION";

CREATE TABLE "INVESTIGATION"
(
    "Investigation_ID" oid NOT NULL,
    "Investigation_Identifier" text COLLATE pg_catalog."default" NOT NULL,
    "Investigation_Title" text COLLATE pg_catalog."default",
    "Investigation_Description" text COLLATE pg_catalog."default",
    "Investigation_Submission_Date" date,
    "Investigation_Public_Release_Date" date,
    "Investigation_Contacts" oid,
    "Investigation_Publications" oid,
    "Investigation_Study_Identifier" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "INVESTIGATION_pkey" PRIMARY KEY ("Investigation_ID"),
    CONSTRAINT "INVESTIGATION_Investigation_Identifier_key" UNIQUE ("Investigation_Identifier"),
    CONSTRAINT "INVESTIGATION_Investigation_Contacts_fkey" FOREIGN KEY ("Investigation_Contacts")
        REFERENCES "CONTACTS" ("Contact_Person_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "INVESTIGATION_Investigation_Publications_fkey" FOREIGN KEY ("Investigation_Publications")
        REFERENCES "PUBLICATIONS" ("Publication_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "INVESTIGATION_Investigation_Study_Identifier_fkey" FOREIGN KEY ("Investigation_Study_Identifier")
        REFERENCES "STUDY" ("Study_Identifier") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "INVESTIGATION"
    OWNER to postgres;
-- Index: investigation_investigation_id_uindex

-- DROP INDEX investigation_investigation_id_uindex;

CREATE UNIQUE INDEX investigation_investigation_id_uindex
    ON "INVESTIGATION" USING btree
    ("Investigation_ID" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: investigation_investigation_identifier_uindex

-- DROP INDEX investigation_investigation_identifier_uindex;

CREATE UNIQUE INDEX investigation_investigation_identifier_uindex
    ON "INVESTIGATION" USING btree
    ("Investigation_Identifier" COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.CONTACTS

-- DROP TABLE "CONTACTS";

CREATE TABLE "CONTACTS"
(
    "Contact_Person_ID" oid NOT NULL,
    "Person_Last_Name" text COLLATE pg_catalog."default",
    "Person_First_Name" text COLLATE pg_catalog."default",
    "Person_Mid_Initials" text COLLATE pg_catalog."default",
    "Person_Email" text COLLATE pg_catalog."default",
    "Person_Phone" text COLLATE pg_catalog."default",
    "Person_Fax" text COLLATE pg_catalog."default",
    "Person_Address" text COLLATE pg_catalog."default",
    "Person_Affiliation" text COLLATE pg_catalog."default",
    "Person_Roles" text COLLATE pg_catalog."default",
    "Person_Roles_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Person_Roles_Term_Source_REF" text COLLATE pg_catalog."default",
    CONSTRAINT "CONTACTS_pkey" PRIMARY KEY ("Contact_Person_ID")
)

TABLESPACE pg_default;

ALTER TABLE "CONTACTS"
    OWNER to postgres;
-- Index: contacts_contact_person_id_uindex

-- DROP INDEX contacts_contact_person_id_uindex;

CREATE UNIQUE INDEX contacts_contact_person_id_uindex
    ON "CONTACTS" USING btree
    ("Contact_Person_ID" ASC NULLS LAST, "Contact_Person_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.PUBLICATIONS

-- DROP TABLE "PUBLICATIONS";

CREATE TABLE "PUBLICATIONS"
(
    "Publication_ID" oid NOT NULL,
    "PubMed_ID" text COLLATE pg_catalog."default",
    "Publication_DOI" text COLLATE pg_catalog."default",
    "Publication_Author_List" text COLLATE pg_catalog."default",
    "Publication_Title" text COLLATE pg_catalog."default",
    "Publication_Status" text COLLATE pg_catalog."default",
    "Publication_Status_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Publication_Status_Term_Source_REF" text COLLATE pg_catalog."default",
    CONSTRAINT "PUBLICATIONS_pkey" PRIMARY KEY ("Publication_ID")
)

TABLESPACE pg_default;

ALTER TABLE "PUBLICATIONS"
    OWNER to postgres;
-- Index: publications_publication_id_uindex

-- DROP INDEX publications_publication_id_uindex;

CREATE UNIQUE INDEX publications_publication_id_uindex
    ON "PUBLICATIONS" USING btree
    ("Publication_ID" ASC NULLS LAST, "Publication_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.STUDY

-- DROP TABLE "STUDY";

CREATE TABLE "STUDY"
(
    "Study_ID" oid NOT NULL,
    "Study_Identifier" text COLLATE pg_catalog."default",
    "Study_Title" text COLLATE pg_catalog."default",
    "Study_Description" text COLLATE pg_catalog."default",
    "Study_Submission_Date" date,
    "Study_Public_Release_Date" date,
    "Study_File_Name" text COLLATE pg_catalog."default",
    "Study_Assays" oid,
    "Study_Contact" oid,
    "Study_Design_Descriptors" oid,
    "Study_Factors" oid,
    "Study_Protocols" oid,
    "Study_Publications" oid,
    CONSTRAINT "STUDY_pkey" PRIMARY KEY ("Study_ID"),
    CONSTRAINT "STUDY_Study_Identifier_key" UNIQUE ("Study_Identifier"),
    CONSTRAINT "STUDY_Study_Assays_fkey" FOREIGN KEY ("Study_Assays")
        REFERENCES "ASSAY" ("Assay_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "STUDY_Study_Contact_fkey" FOREIGN KEY ("Study_Contact")
        REFERENCES "CONTACTS" ("Contact_Person_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "STUDY_Study_Design_Descriptors_fkey" FOREIGN KEY ("Study_Design_Descriptors")
        REFERENCES "STUDY_DESIGN_DESCRIPTORS" ("Design_Descriptors_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "STUDY_Study_Factors_fkey" FOREIGN KEY ("Study_Factors")
        REFERENCES "STUDY_FACTORS" ("Study_Factors_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "STUDY_Study_ID_fkey" FOREIGN KEY ("Study_ID")
        REFERENCES "STUDY_SAMPLES" ("Study_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "STUDY_Study_Protocols_fkey" FOREIGN KEY ("Study_Protocols")
        REFERENCES "PROTOCOLS" ("Protocol_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "STUDY_Study_Publications_fkey" FOREIGN KEY ("Study_Publications")
        REFERENCES "PUBLICATIONS" ("Publication_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "STUDY"
    OWNER to postgres;

-- Table: IsaTab.PROTOCOLS

-- DROP TABLE "PROTOCOLS";

CREATE TABLE "PROTOCOLS"
(
    "Protocol_ID" oid NOT NULL,
    "Protocol_Name" text COLLATE pg_catalog."default",
    "Protocol_Type" text COLLATE pg_catalog."default",
    "Protocol_Type_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Protocol_Type_Term_Source_REF" text COLLATE pg_catalog."default",
    "Protocol_Description" text COLLATE pg_catalog."default",
    "Protocol_URI" text COLLATE pg_catalog."default",
    "Protocol_Version" text COLLATE pg_catalog."default",
    "Protocol_Parameters_Name" text COLLATE pg_catalog."default",
    "Protocol_Parameter_Name_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Protocol_Parameter_Name_Term_Source_REF" text COLLATE pg_catalog."default",
    "Protocol_Components_Name" text COLLATE pg_catalog."default",
    "Protocol_Components_Type" text COLLATE pg_catalog."default",
    "Protocol_Components_Type_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Protocol_Components_Type_Term_Source_REF" text COLLATE pg_catalog."default",
    CONSTRAINT "PROTOCOLS_pkey" PRIMARY KEY ("Protocol_ID")
)

TABLESPACE pg_default;

ALTER TABLE "PROTOCOLS"
    OWNER to postgres;
-- Index: protocols_protocol_id_uindex

-- DROP INDEX protocols_protocol_id_uindex;

CREATE UNIQUE INDEX protocols_protocol_id_uindex
    ON "PROTOCOLS" USING btree
    ("Protocol_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.STUDY_DESIGN_DESCRIPTORS

-- DROP TABLE "STUDY_DESIGN_DESCRIPTORS";

CREATE TABLE "STUDY_DESIGN_DESCRIPTORS"
(
    "Design_Descriptors_ID" oid NOT NULL,
    "Design_Type" text COLLATE pg_catalog."default",
    "Design_Type_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Design_Type_Term_Source_REF" text COLLATE pg_catalog."default",
    CONSTRAINT "STUDY_DESIGN_DESCRIPTORS_pkey" PRIMARY KEY ("Design_Descriptors_ID")
)

TABLESPACE pg_default;

ALTER TABLE "STUDY_DESIGN_DESCRIPTORS"
    OWNER to postgres;
-- Index: study_design_descriptors_design_descriptors_id_uindex

-- DROP INDEX study_design_descriptors_design_descriptors_id_uindex;

CREATE UNIQUE INDEX study_design_descriptors_design_descriptors_id_uindex
    ON "STUDY_DESIGN_DESCRIPTORS" USING btree
    ("Design_Descriptors_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.STUDY_FACTORS

-- DROP TABLE "STUDY_FACTORS";

CREATE TABLE "STUDY_FACTORS"
(
    "Study_Factors_ID" oid NOT NULL,
    "Factor_Name" text COLLATE pg_catalog."default",
    "Factor_Type" text COLLATE pg_catalog."default",
    "Factor_Type_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Factor_Type_Term_Source_REF" text COLLATE pg_catalog."default",
    CONSTRAINT "STUDY_FACTORS_pkey" PRIMARY KEY ("Study_Factors_ID")
)

TABLESPACE pg_default;

ALTER TABLE "STUDY_FACTORS"
    OWNER to postgres;
-- Index: study_factors_study_factors_id_uindex

-- DROP INDEX study_factors_study_factors_id_uindex;

CREATE UNIQUE INDEX study_factors_study_factors_id_uindex
    ON "STUDY_FACTORS" USING btree
    ("Study_Factors_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.ASSAY

-- DROP TABLE "ASSAY";

CREATE TABLE "ASSAY"
(
    "Assay_ID" oid NOT NULL,
    "Assay_Identifier" text COLLATE pg_catalog."default",
    "Assay_Measurement_Type" text COLLATE pg_catalog."default",
    "Assay_Measurement_Type_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Assay_Measurement_Type_Term_Source_REF" text COLLATE pg_catalog."default",
    "Assay_Technology_Type" text COLLATE pg_catalog."default",
    "Assay_Technology_Type_Term_Accession_Number" text COLLATE pg_catalog."default",
    "Assay_Technology_Type_Term_Source_REF" text COLLATE pg_catalog."default",
    "Assay_Technology_Platform" text COLLATE pg_catalog."default",
    CONSTRAINT "ASSAY_pkey" PRIMARY KEY ("Assay_ID")
)

TABLESPACE pg_default;

ALTER TABLE "ASSAY"
    OWNER to postgres;
-- Index: assay_assay_id_uindex

-- DROP INDEX assay_assay_id_uindex;

CREATE UNIQUE INDEX assay_assay_id_uindex
    ON "ASSAY" USING btree
    ("Assay_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.STUDY_SAMPLES

-- DROP TABLE "STUDY_SAMPLES";

CREATE TABLE "STUDY_SAMPLES"
(
    "Study_ID" oid NOT NULL,
    "Sample_Name" text COLLATE pg_catalog."default" NOT NULL,
    "Characteristics" text COLLATE pg_catalog."default",
    "Material_Type" text COLLATE pg_catalog."default",
    "Protocol_REF" text COLLATE pg_catalog."default",
    "Term_Accession_Number" text COLLATE pg_catalog."default",
    "Term_Source_REF" text COLLATE pg_catalog."default",
    "Comment" text COLLATE pg_catalog."default",
    "Provider" text COLLATE pg_catalog."default",
    "Description" text COLLATE pg_catalog."default",
    CONSTRAINT "STUDY_SAMPLES_pkey" PRIMARY KEY ("Sample_Name"),
    CONSTRAINT "STUDY_SAMPLES_Study_ID_key" UNIQUE ("Study_ID")
)

TABLESPACE pg_default;

ALTER TABLE "STUDY_SAMPLES"
    OWNER to postgres;
-- Index: study_samples_sample_name_uindex

-- DROP INDEX study_samples_sample_name_uindex;

CREATE UNIQUE INDEX study_samples_sample_name_uindex
    ON "STUDY_SAMPLES" USING btree
    ("Sample_Name" COLLATE pg_catalog."default" ASC NULLS LAST, "Sample_Name" COLLATE pg_catalog."default" ASC NULLS LAST, "Sample_Name" COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.A_TECHNOLOGY_MICROARRAY

-- DROP TABLE "A_TECHNOLOGY_MICROARRAY";

CREATE TABLE "A_TECHNOLOGY_MICROARRAY"
(
    "Assay_ID" oid NOT NULL,
    "Sample_Name" text COLLATE pg_catalog."default",
    "Extract_Name" text COLLATE pg_catalog."default",
    "Labeled_Extract_Name" text COLLATE pg_catalog."default",
    "Label" text COLLATE pg_catalog."default",
    "Hybridization_Assay_Name" text COLLATE pg_catalog."default",
    "Comment[ArrayExpress_Accession]" text COLLATE pg_catalog."default",
    "Comment[ArrayExpress_Raw_Data_URL]" text COLLATE pg_catalog."default",
    "Comment[ArrayExpress_Processed_Data_URL]" text COLLATE pg_catalog."default",
    "Array_Design_REF" text COLLATE pg_catalog."default",
    "Scan_Name" text COLLATE pg_catalog."default",
    "Array_Data_File" text COLLATE pg_catalog."default",
    "Data_Transformation_Name" text COLLATE pg_catalog."default",
    "Derived_Array_Data_File" text COLLATE pg_catalog."default",
    "Array_Data_Matrix_File" text COLLATE pg_catalog."default",
    "Derived_Array_Data_Matrix_File" text COLLATE pg_catalog."default",
    "Array_Design_File" text COLLATE pg_catalog."default",
    CONSTRAINT "A_TECHNOLOGY_MICROARRAY_pkey" PRIMARY KEY ("Assay_ID"),
    CONSTRAINT "A_TECHNOLOGY_MICROARRAY_Sample_Name_fkey" FOREIGN KEY ("Sample_Name")
        REFERENCES "STUDY_SAMPLES" ("Sample_Name") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "A_TECHNOLOGY_MICROARRAY"
    OWNER to postgres;
-- Index: a_technology_microarray_assay_id_uindex

-- DROP INDEX a_technology_microarray_assay_id_uindex;

CREATE UNIQUE INDEX a_technology_microarray_assay_id_uindex
    ON "A_TECHNOLOGY_MICROARRAY" USING btree
    ("Assay_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.A_TECHNOLOGY_MS

-- DROP TABLE "A_TECHNOLOGY_MS";

CREATE TABLE "A_TECHNOLOGY_MS"
(
    "Assay_ID" oid NOT NULL,
    "Sample_Name" text COLLATE pg_catalog."default" NOT NULL,
    "Extract_Name" text COLLATE pg_catalog."default",
    "Labeled_Extract_Name" text COLLATE pg_catalog."default",
    "Label" text COLLATE pg_catalog."default",
    "MS_Assay_Name" text COLLATE pg_catalog."default",
    "Raw_Spectral_Data_File" text COLLATE pg_catalog."default",
    "Normalization_Name" text COLLATE pg_catalog."default",
    "Protein_Assignment_File" text COLLATE pg_catalog."default",
    "Peptide_Assignment_File" text COLLATE pg_catalog."default",
    "Post_Translational_Modification_Assignment_File" text COLLATE pg_catalog."default",
    "Data_Transformation_Name" text COLLATE pg_catalog."default",
    "Derived_Spectral_Data_File" text COLLATE pg_catalog."default",
    CONSTRAINT "A_TECHNOLOGY_MS_pkey" PRIMARY KEY ("Assay_ID"),
    CONSTRAINT "A_TECHNOLOGY_MS_Sample_Name_fkey" FOREIGN KEY ("Sample_Name")
        REFERENCES "STUDY_SAMPLES" ("Sample_Name") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "A_TECHNOLOGY_MS"
    OWNER to postgres;
-- Index: a_technology_ms_assay_id_uindex

-- DROP INDEX a_technology_ms_assay_id_uindex;

CREATE UNIQUE INDEX a_technology_ms_assay_id_uindex
    ON "A_TECHNOLOGY_MS" USING btree
    ("Assay_ID" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: IsaTab.A_TECHNOLOGY_NMR

-- DROP TABLE "A_TECHNOLOGY_NMR";

CREATE TABLE "A_TECHNOLOGY_NMR"
(
    "Assay_ID" oid NOT NULL,
    "Sample_Name" text COLLATE pg_catalog."default",
    "Extract_Name" text COLLATE pg_catalog."default",
    "Labeled_Extract_Name" text COLLATE pg_catalog."default",
    "Label" text COLLATE pg_catalog."default",
    "NMR_Assay_Name" text COLLATE pg_catalog."default",
    "Free_Induction_Decay_Data_File" text COLLATE pg_catalog."default",
    "Acquisition_Parameter_Data_File" text COLLATE pg_catalog."default",
    "Derived_Spectral_Data_File" text COLLATE pg_catalog."default",
    "Normalization_Name" text COLLATE pg_catalog."default",
    "Data_Transformation_Name" text COLLATE pg_catalog."default",
    "Metabolite_Assignment_File" text COLLATE pg_catalog."default",
    CONSTRAINT "A_TECHNOLOGY_NMR_pkey" PRIMARY KEY ("Assay_ID"),
    CONSTRAINT "A_TECHNOLOGY_NMR_Sample_Name_fkey" FOREIGN KEY ("Sample_Name")
        REFERENCES "STUDY_SAMPLES" ("Sample_Name") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE "A_TECHNOLOGY_NMR"
    OWNER to postgres;
-- Index: a_technology_nmr_assay_id_uindex

-- DROP INDEX a_technology_nmr_assay_id_uindex;

CREATE UNIQUE INDEX a_technology_nmr_assay_id_uindex
    ON "A_TECHNOLOGY_NMR" USING btree
    ("Assay_ID" ASC NULLS LAST)
    TABLESPACE pg_default;
