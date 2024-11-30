# **Normalized Schema**

## **1. User**

- **Attributes:**
  - user_id (Primary Key, UUID, Indexed)
  - first_name (VARCHAR, NOT NULL)
  - last_name (VARCHAR, NOT NULL)
  - email (VARCHAR, UNIQUE, NOT NULL)
  - password_hash (VARCHAR, NOT NULL)
  - phone_number (VARCHAR, NULL)
  - role (ENUM: guest, host, admin, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **2. Property**

- **Attributes:**
  - property_id (Primary Key, UUID, Indexed)
  - host_id (Foreign Key, references User(user_id))
  - name (VARCHAR, NOT NULL)
  - description (TEXT, NOT NULL)
  - location_id (Foreign Key, references Location(location_id))
  - price_per_night (DECIMAL, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

## **3. Location**

- **Attributes:**
  - location_id (Primary Key, UUID)
  - location_name (VARCHAR, NOT NULL)

---

## **4. Booking**

- **Attributes:**
  - booking_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - start_date (DATE, NOT NULL)
  - end_date (DATE, NOT NULL)
  - total_price (DECIMAL, NOT NULL)
  - status (ENUM: pending, confirmed, canceled, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **5. Payment**

- **Attributes:**
  - payment_id (Primary Key, UUID, Indexed)
  - booking_id (Foreign Key, references Booking(booking_id))
  - amount (DECIMAL, NOT NULL)
  - payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

---

## **6. Review**

- **Attributes:**
  - review_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
  - comment (TEXT, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **7. Message**

- **Attributes:**
  - message_id (Primary Key, UUID, Indexed)
  - sender_id (Foreign Key, references User(user_id))
  - recipient_id (Foreign Key, references User(user_id))
  - message_body (TEXT, NOT NULL)
  - sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **Normalization Steps**

#### **Step 1: First Normal Form (1NF)**

- Ensure each table cell contains a single value.
- Ensure each table has a primary key
- Ensure each table has a unique name

#### **Step 2: Second Normal Form (2NF)**

- Ensure each non-key attribute depends on the entire primary key.
- The original schema already satisfies 2NF
- No further changes are needed

#### **Step 3: Third Normal Form (3NF)**

- Ensure if a table is in 2NF, and a non-key attribute depends on another non-key attributes depend only on the primary key.
- **Issue Identified: Location redundancy in the `Property` table.**
  - In the original schema, `location` was a string attribute in the `Property` table. If multiple properties were in the same location, the location data would be repeated, violating 3NF.
  - **Solution:** A new `Location` table was created, and a `location_id` foreign key was added to the `Property` table.

# Normalization Process

## **Step 1: First Normal Form (1NF)**
-- The initial schema already meets 1NF as each attribute holds atomic values and the primary keys are clearly defined.

## **Step 2: Second Normal Form (2NF)**
-- The schema is already in 2NF. Each non-prime attribute is fully dependent on the primary key of its respective table.

## **Step 3: Third Normal Form (3NF)**
-- The database must be in 2NF, and there should be no transitive dependencies (non-prime attributes should depend only on the primary key).

-- **Location Redundancy Issue:** In the `Property` table, the `location` attribute
-- was a string, which could lead to data redundancy if multiple properties shared the same location.
-- **Solution:** Create a separate `Location` table with a unique `location_id` and add
    -- a foreign key to the `Property` table to link properties to their respective locations.

## Benefits of Normalization

- Reduces data duplication and redundancy.
- Improves data consistency and integrity.
- Simplifies schema maintenance and scalability.
