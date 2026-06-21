-- Exercise 3: Stored Procedures

-- Scenario 1: Process monthly interest for all savings accounts

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;
END;

-- Scenario 2: Update employee bonus by department

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN Employees.Department%TYPE,
    p_bonus_percentage IN NUMBER
) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_percentage / 100)
    WHERE Department = p_department;

    COMMIT;
END;

-- Scenario 3: Transfer funds between accounts

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_source_account IN Accounts.AccountID%TYPE,
    p_destination_account IN Accounts.AccountID%TYPE,
    p_amount IN NUMBER
) IS
    v_balance Accounts.Balance%TYPE;
BEGIN
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_source_account;

    IF v_balance >= p_amount THEN
        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_source_account;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_destination_account;

        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance');
    END IF;
END;
