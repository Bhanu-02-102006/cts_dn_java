-- =========================================
-- Scenario 1:
-- Apply 1% discount to loan interest rates
-- for customers above 60 years old
-- =========================================

BEGIN
    FOR rec IN (
        SELECT l.LoanID
        FROM LOANS l
        JOIN CUSTOMERS c
        ON l.CustomerID = c.CustomerID
        WHERE c.Age > 60
    )
    LOOP
        UPDATE LOANS
        SET InterestRate = InterestRate - 1
        WHERE LoanID = rec.LoanID;
    END LOOP;

    COMMIT;
END;

-- =========================================
-- Scenario 2:
-- Promote customers to VIP status
-- if balance > 10000
-- =========================================

BEGIN
    FOR rec IN (
        SELECT CustomerID
        FROM CUSTOMERS
        WHERE Balance > 10000
    )
    LOOP
        UPDATE CUSTOMERS
        SET IsVIP = 'TRUE'
        WHERE CustomerID = rec.CustomerID;
    END LOOP;

    COMMIT;
END;

-- =========================================
-- Scenario 3:
-- Send reminders for loans due
-- within the next 30 days
-- =========================================

SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (
        SELECT c.Name,
               l.LoanID,
               l.DueDate
        FROM CUSTOMERS c
        JOIN LOANS l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear ' || rec.Name ||
            ', your loan (ID: ' || rec.LoanID ||
            ') is due on ' || TO_CHAR(rec.DueDate, 'DD-MON-YYYY')
        );
    END LOOP;
END;
