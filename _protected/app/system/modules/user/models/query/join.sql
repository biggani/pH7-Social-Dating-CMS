INSERT INTO [DB_PREFIX]Members (email, username, password, firstName, reference, active, ip, hashValidation, joinDate, lastActivity, groupId)
VALUES (:email, :username, :password, :first_name, :reference, :is_active, :ip, :hash_validation, :current_date, :current_date, :group_id);
