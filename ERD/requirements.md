# **Entities and Attributes**

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

## **2. Property**

- **Attributes:**
  - property_id (Primary Key, UUID, Indexed)
  - host_id (Foreign Key, references User(user_id))
  - name (VARCHAR, NOT NULL)
  - description (TEXT, NOT NULL)
  - location (VARCHAR, NOT NULL)
  - price_per_night (DECIMAL, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

## **3. Booking**

- **Attributes:**
  - booking_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - start_date (DATE, NOT NULL)
  - end_date (DATE, NOT NULL)
  - total_price (DECIMAL, NOT NULL)
  - status (ENUM: pending, confirmed, canceled, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## **4. Payment**

- **Attributes:**
  - payment_id (Primary Key, UUID, Indexed)
  - booking_id (Foreign Key, references Booking(booking_id))
  - amount (DECIMAL, NOT NULL)
  - payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
  - payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

## **5. Review**

- **Attributes:**
  - review_id (Primary Key, UUID, Indexed)
  - property_id (Foreign Key, references Property(property_id))
  - user_id (Foreign Key, references User(user_id))
  - rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
  - comment (TEXT, NOT NULL)
  - created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## **6. Message**

- **Attributes:**
  - message_id (Primary Key, UUID, Indexed)
  - sender_id (Foreign Key, references User(user_id))
  - recipient_id (Foreign Key, references User(user_id))
  - message_body (TEXT, NOT NULL)
  - sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **Relationships**

1. **User ↔ Property**
- **one to one**
- user can host multiple properties, but a property can only be hosted by one user

2. **User ↔ Booking**
- **one to many**
- a user can make multiple bookings, but a booking is made by one user
- a booking is associated with one user

3. **Property ↔ Booking**
- **one to many**
- a property can have multiple bookings, but a booking is associated with one property

4. **Booking ↔ Payment**
- **one to one**
- a booking is associated with one payment, but a payment is made for one booking

5. **User ↔ Review**
- **one to many**
- a user can write multiple reviews, but a review is written by one user

6. **Property ↔ Review**
- **one to many**
- a property can have multiple reviews, but a review is associated with one property

7. **User ↔ Message**
- **Recursive (User to User)**
- A user can send messages to one or more other users, and a user can also receive messages from one or more users. Each message must have one sender and one recipient, both referencing the same User entity.
